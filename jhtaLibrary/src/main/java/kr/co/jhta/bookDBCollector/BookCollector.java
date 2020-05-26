package kr.co.jhta.bookDBCollector;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.crypto.Data;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

// REST API response to HttpURLConnection request
// DestUrl = "https://dapi.kakao.com/v3/search/book?query="+encodedQueryStr+"&page=xx&sort=xx&size=xx";
public class BookCollector {
	/**
	 * @param httpReqRestApiurl  : rest api
	 * @param queryStr           : search query, 가~힣a~zA~Z0~9
	 * @param page               : result page number, 1~999(MAX)
	 * @param sortMethod         : sort method, accuracy or lastest
	 * @param pagesPerPage       : number of factors to show per page, 1~50
	 * unicode                   : 가(0xAC00)~힣(0xD7A3), 0x0041 ~ 0x007A, (65~90, 97~122) A ~ z, (91~96) [\]^_`
	 */
	public static void main(String[] args) {
		HttpURLConnection conn = null;
		
		// doc
		int page = 1;
		int pagesPerPage = 50;
		String httpReqRestApiurl="https://dapi.kakao.com/v3/search/book";
		String queryStr="가";
		String sortMethod = "accuracy";
		int totalCount = 0; // 일일상한 카운트 횟수 25000
		int uniCnt = 7172;
		
		// meta
		JSONObject jsonobject2 = new JSONObject();
		int pageableCount=100;
		boolean is_end;
		
		queryStr = unicodeAddConvert(queryStr, uniCnt);
		
		GeneralBookDAO dao = new GeneralBookDAO();
			
		//JSONObject jsonobject2 = (JSONObject) jsonObject.get("meta");
		//System.out.println(jsonobject2); //meta
		//System.out.println(jsonobject2.get("total_count"));
		//System.out.println(jsonobject2.get("is_end"));
		//System.out.println(jsonobject2.get("pageable_count"));
		
		// 이 페이지를 메타 데이터를 참조하게 만드려면 do while문으로 작성하면 되지만 너무 코드 가독성이 떨어져서 안하기로함
		// 시간나면 재미삼아 하던가 급하니까 그냥 예외시 유니코드값 바꾸는걸로 하자
		
		for(page = 1; page < 999; page++) {
		
			String encodedReqRestApiUrl = createEncodedHttpReqRestApiUrl(httpReqRestApiurl, queryStr, page, sortMethod, pagesPerPage);
			System.out.println(" - - - - - - [encoded req rest api url] : "+encodedReqRestApiUrl+" - - - - - - ");
		
			try {
				URL urlToHttpReq = new URL(encodedReqRestApiUrl);
				conn = (HttpURLConnection) urlToHttpReq.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", "KakaoAK 788b6c819d4b6c6e2e83afa567cfd156");
				conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				conn.setRequestProperty("Transfer-Encoding", "chunked");
				conn.setRequestProperty("Vary", "Accept-Encoding");
				conn.setRequestProperty("Content-Encoding", "gzip");
				conn.setDoOutput(true);
				
				int responseCode = conn.getResponseCode();
				if (responseCode == 400) {
					// 만약에 페이지의 끝에 다다른다면 unicode를 증가시킨다.
					System.out.println("400 err");
					page = 0;
					queryStr = unicodeAddConvert(queryStr, 1);
					uniCnt++;
					System.out.println("Query Str 변경됨 : "+queryStr);
					continue;
				} else if (responseCode == 401) {
					System.out.println("401 err");
					break;
				} else if (responseCode == 500) {
					System.out.println("500 err");
					break;
				} else {
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
					StringBuffer sb = new StringBuffer();
					String line = "";
					while ((line = br.readLine()) != null) {
						sb.append(line);
					}
					
					// JSON Array Parsing
					String jsonStr = sb.toString();
					JSONParser jsonParser = new JSONParser();				
					JSONObject jsonObject = (JSONObject)jsonParser.parse(jsonStr);
					JSONArray jsonArrayX = (JSONArray)jsonObject.get("documents");
					
					// 첫 페이지에서는 meta정보를 읽어온다.
					// 사실 이 pageable, is_end로 위에 for문을 do while로 바꾸어 첫 번째 동작시에는 메타 정보를 읽어 조건문을 만들고 난 뒤 page<pageable_count 내에서 검색하도록 만드는 것이
					// 귀찮아서 그냥 냅둠
					if(page == 1) {
						jsonobject2 = (JSONObject) jsonObject.get("meta");
						System.out.println(jsonobject2);
						System.out.println(jsonobject2.get("total_count"));
						System.out.println("is_end : "+jsonobject2.get("is_end"));
						System.out.println("pageable : "+jsonobject2.get("pageable_count"));	
						pageableCount = Integer.parseInt((String)jsonobject2.get("pageable_count"));
						System.out.println("pageableCount : "+pageableCount);
					}
					
					
					is_end = (boolean)jsonobject2.get("is_end");
					if((page > pageableCount) || (is_end == true)) {
						System.out.println("이 이상은 필요 없으니까 pass");
						page = 0;
						queryStr = unicodeAddConvert(queryStr, 1);
						uniCnt++;
						System.out.println("Query Str 변경됨 : "+queryStr);
						continue;
					}
					
					totalCount = getBookInfoByKakaoAndKyobo(page, queryStr, totalCount, uniCnt, dao, jsonArrayX);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
	}
	System.out.println("모든 검색이 종료되었음.");
		dao.close();
	}

	private static int getBookInfoByKakaoAndKyobo(int page, String queryStr, int totalCount, int uniCnt,
			GeneralBookDAO dao, JSONArray jsonArrayX) throws IOException, SQLIntegrityConstraintViolationException {
		for(int i = 0; i < jsonArrayX.size(); i++) {
			GeneralBookDTO gBookDTO= new GeneralBookDTO();
			ArrayList<String> authorList = new ArrayList<String>();			// dto 대신 안써도 되겠다 싶어서
			ArrayList<String> translatorList = new ArrayList<String>();
			
			System.out.print("[page:"+page+"]의 "+(i+1)+"번째 책");
			System.out.println("| 총 "+totalCount+++"번째 책");
			JSONObject jsonObjectX = ((JSONObject)jsonArrayX.get(i));
			
			// 한권의 책에 대한 일반적인 정보는 획득 완료
			// 내부 제1 정규화를 침해하는 authors, translators 테이블을 위한 내부 중첩 for문
			
			@SuppressWarnings("unchecked")
			Set<String> key = jsonObjectX.keySet();
			Iterator<String> iter = key.iterator();

			//System.out.println("[미리구한] isbn : "+(String)jsonObjectX.get("isbn"));
			// isbn13부터 뽑아내기
			Matcher onlyIsbn13Matcher = Pattern.compile("[0-9]{13}").matcher(((String)jsonObjectX.get("isbn")));
			if(onlyIsbn13Matcher.find()){ 
				gBookDTO.setGeneralBookId(onlyIsbn13Matcher.group()); //Long.parseLong(onlyIsbn13Matcher.group())
			}else {
				System.out.println("isbn13이 존재하지 않음");
			}

			// 책 정보 컬럼 채우기
			getAuthorsTranslators(gBookDTO, authorList, translatorList, jsonObjectX, iter);
			
			// 장르 크롤링해서 긁어오기
			String kyobo_url = "http://www.kyobobook.co.kr/product/detailViewKor.laf";
			
			Document doc = Jsoup.connect(kyobo_url+"?barcode="+gBookDTO.getGeneralBookId()).get();
			Elements genreElems = doc.select(".location_zone:nth-child(3)>p.location>span>a");	
			if(!genreElems.get(0).text().isEmpty())
				gBookDTO.setGenre(genreElems.get(0).text());
			
			//	String kyobo_url = "http://www.kyobobook.co.kr/product/detailViewKor.laf";
			//	Document doc = Jsoup.connect(kyobo_url+"?barcode=9791165075064").get();
			//	Elements genreElems = doc.select(".location_zone:nth-child(4)>p.location>span>a");		
			//	System.out.println(">>"+genreElems.get(0).text());
			
			Elements tagElems = doc.select(".tag_list");
			String tagStrs = "";
			if(!tagElems.isEmpty())
				tagStrs = tagElems.get(0).text();
			
			StringTokenizer st = new StringTokenizer(tagStrs.replace(" ", ""), "#", false); 
			ArrayList<String> tagList = new ArrayList<String>();	
			
			while(st.hasMoreTokens()) {
					tagList.add(st.nextToken());
			}
			
			// 담겨진 정보가 있다면 해당 주제어(해쉬태그)정보를 입력.
			if(tagList.size() >= 1) {
				dao.insertBookKeyword(gBookDTO.getGeneralBookId(), tagList);
			}
			
			// 전반적인 자료 구비 완료. insert 후 다음 책 정보를 받으러 가자.
			dao.insertOneBook(gBookDTO);						

			// 포린키가 생긴 시점이니까 이제부터는 주입 가능하겠지
			JSONArray nonNormalizedKey1 = (JSONArray) jsonObjectX.get("authors");
			for(int j = 0; j < nonNormalizedKey1.size(); j++) {
					dao.insertAuthor(gBookDTO.getGeneralBookId(), authorList);
			}
			JSONArray nonNormalizedKey2 = (JSONArray) jsonObjectX.get("translators");
			for(int j = 0; j < nonNormalizedKey2.size(); j++) {
				dao.insertTranslator(gBookDTO.getGeneralBookId(), translatorList);
			}
			
			authorList.clear();
			translatorList.clear();
			
			System.out.println("------------------------------------------------------");
			System.out.println("queryStr : ["+queryStr+"] plus unicode cnt : ["+ uniCnt+"]");
		}
		return totalCount;
	}
	
	public static String createEncodedHttpReqRestApiUrl(String inputUrl, String queryStr, int page, String sort, int size) {
		String encodedQueryStr = "";	
		try {
			encodedQueryStr = URLEncoder.encode(queryStr, StandardCharsets.UTF_8.toString());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return inputUrl+"?query="+encodedQueryStr+"&page="+page+"&sort="+sort+"&size="+size;
	}
	
	private static String unicodeAddConvert(String str, int cnt) {
	    StringBuilder sb = new StringBuilder();
	    char ch;
	    int len = str.length();
	    for (int i = 0; i < len; i++) {
	        ch = (char) ((int)str.charAt(i)+cnt);
	        if(ch=='힣')
	        	break;
	        System.out.println("ch : "+ch);
	        if (ch == '\\' && str.charAt(i+1) == 'u') {
	            sb.append((char) Integer.parseInt(str.substring(i+2, i+6), 16));
	            i+=5;
	            continue;
	        }
	        sb.append(ch);
	    }
	    return sb.toString();
	}
	
	// 안씀
	public static String makeURLgetParameter(String... elem) {
		StringBuffer addedParams = new StringBuffer();
		for(String x : elem) {
			addedParams.append("?elem="+x);		
		}
		return addedParams.toString();
	}

	private static void getAuthorsTranslators(GeneralBookDTO gBookDTO, ArrayList<String> authorList,
			ArrayList<String> translatorList, JSONObject jsonObjectX, Iterator<String> iter) {
		while(iter.hasNext()) {
			String keyname = iter.next();

			// 위에서 isbn은 구했으니까 스킵
			if(keyname.equals("isbn"))
				continue;

			if(keyname.equals("title")) {
				System.out.printf("{key : %-15s}, {value : %-100s} \n", keyname, jsonObjectX.get(keyname));
				//{type : %-25s} jsonObjectX.get(keyname).getClass()
			}
			
			injectGeneralCols(gBookDTO, jsonObjectX, keyname);
		
			if(jsonObjectX.get(keyname).getClass()==JSONArray.class) { // 제1정규화를 위한 테이블 분리, authors, translators
				JSONArray nonNormalizedKey = (JSONArray) jsonObjectX.get(keyname);
				if(keyname.equals("authors")) {
					for(int j = 0; j < nonNormalizedKey.size(); j++) {
						authorList.add((String) nonNormalizedKey.get(j));
//						System.out.println((String) nonNormalizedKey.get(j));
					}
				}else if(keyname.equals("translators")) {
					for(int j = 0; j < nonNormalizedKey.size(); j++) {
						translatorList.add((String) nonNormalizedKey.get(j));									
					}
				}
			 }else {
				if(keyname.equals("authors")) {
					 JSONArray nonNormalizedKey = (JSONArray) jsonObjectX.get(keyname);
					 if(!nonNormalizedKey.isEmpty()) {
						 authorList.add((String) nonNormalizedKey.get(0));									 
					 }
				}else if(keyname.equals("translators")) {
					JSONArray nonNormalizedKey = (JSONArray) jsonObjectX.get(keyname);
					if(!nonNormalizedKey.isEmpty()) {
						authorList.add((String) nonNormalizedKey.get(0));									 
					}							
				}
			}
		}
	}

	private static void injectGeneralCols(GeneralBookDTO gBookDTO, JSONObject jsonObjectX, String keyname) {
		switch (keyname) {
			case "datetime":
				gBookDTO.setPublicationDate(((String) jsonObjectX.get(keyname)).substring(0, 10));
				break;
			case "thumbnail":
				gBookDTO.setThumbnailUrl((String) jsonObjectX.get(keyname));
				break;
			case "contents":
				gBookDTO.setDescription((String) jsonObjectX.get(keyname));
				break;
			case "publisher":
				gBookDTO.setPublisher((String) jsonObjectX.get(keyname));
				break;
			case "title":
				gBookDTO.setTitle((String) jsonObjectX.get(keyname));
				break;
			case "url":
				gBookDTO.setDetailUrl((String) jsonObjectX.get(keyname));
				break;
		}
	}
}


// 생각
// 1. 여러페이지를 동시 서치할 수 있도록 멀티쓰레드로 만들 필요가 있음
// 2. 최적화 필요가 있음. 동작 속도가 너무 느림
// 3. 자동화가 안된 부분들이 있음
// 4. 예외처리가 느슨한 부분이 있음







/*
(JSONArray) jsonObject.get("documents"); 
(JSONObject) jsonObject.get("meta");     
db에 업데이트 되는 순서는
gb_book table이 먼저 insert 되고
그 테이블의 id값을 사용하여 엮인 테이블에 다시 insert하는 과정이 필요함
*/
		
//				System.out.println("string buffer");
//				System.out.println(sb.toString()+"\n");


//GeneralBookDTO bookDTO = 
//new GeneralBookDTO(generalBookId, 
//		genre, 
//		title, 
//		description, 
//		detailUrl, 
//		publicationDate, 
//		authors, 
//		publisher, 
//		translators, 
//		thumbnailUrl, 
//		status)


//JSONObject jsonobject2 = (JSONObject) jsonObject.get("meta");
//System.out.println(jsonobject2); //meta
//System.out.println(jsonobject2.get("total_count"));
//System.out.println(jsonobject2.get("is_end"));
//System.out.println(jsonobject2.get("pageable_count"));

//JSONObject jsonObject0 = (JSONObject)jsonArray.get(0);
//JSONObject jsonObject1 = (JSONObject)jsonArray.get(1);




/*
Set<String> key = jsonObject0.keySet();// jsonObject0 -> jsonObject.get("documents").get(i)
Iterator<String> itr = key.iterator();
while(itr.hasNext()) {
	String keyname = itr.next();
	System.out.printf("[key] : %10s [type] : %25s [value] %50s: ",keyname,jsonObject0.get(keyname).getClass(),jsonObject0.get(keyname));
}
*/


/*
System.out.println(jsonObject.getClass());
System.out.println(jsonObject);
System.out.println("-----");
System.out.println(jsonObject.get("documents"));
System.out.println(":"+jsonObject.get("documents").getClass());
System.out.println("-----");
//jsonObject.get("documents") �̰� json array�ϱ� 
System.out.println(jsonArray.getClass());
System.out.println(jsonArray);
System.out.println("-----");
System.out.println(jsonArray.get(0)); // 1��å json
System.out.println(jsonArray.get(1)); // 2��å json
System.out.println("-----------�ѱǿ� ���� ����-------");
System.out.println(jsonArray.get(0).getClass()); // 1��å json
System.out.println("datetime : "+((JSONObject)jsonArray.get(0)).get("datetime"));
System.out.println("thumbnail : "+((JSONObject)jsonArray.get(0)).get("thumbnail"));
System.out.println("translators : "+((JSONObject)jsonArray.get(0)).get("translators"));
System.out.println("contents : "+((JSONObject)jsonArray.get(0)).get("contents"));
System.out.println("isbn : "+((JSONObject)jsonArray.get(0)).get("isbn"));
System.out.println("publisher : "+((JSONObject)jsonArray.get(0)).get("publisher"));
System.out.println("title : "+((JSONObject)jsonArray.get(0)).get("title"));
System.out.println("url : "+((JSONObject)jsonArray.get(0)).get("url"));
System.out.println("authors : "+((JSONObject)jsonArray.get(0)).get("authors"));
*/
				//for(int i = 0 ; i <)
				//System.out.println(":"+);
//				System.out.println((JSONObject)jsonParser.parse().get("datetime"));
				
				

		//Data data = parser.JSONtoData(responseJson);
		//data.calls = parser.JSONtoCalls(responseJson);
		//return data;