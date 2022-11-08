<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	<%
Connection conn;
ResultSet rs;
PreparedStatement pstmt;
String t_id = "";
String t_src ="";

try{
	String dbURL = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
	String dbID = "root";
	String dbPassword = "root";
	String SQL = "";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL,  dbID, dbPassword);
    
	String mbti[] = {"ENFJ", "ENFP", "ENTJ", "ENTP", "ESFJ", "ESFP", "ESTJ", "ESTP", "INFJ", "INFP", "INTJ", "INTP", "ISFJ", "ISFP", "ISTJ", "ISTP"};
	
    String title;
    String kind;
    String content;
    String img;
    String src; //선택지 따올 테스트의 주소
    
	int i=0; //테스트 5개만 가져와서 저장
	
	//--------------------------------------방구석연구소 크롤링 시작-----------------------------------------
	Document doc1 = 
			Jsoup.connect("https://www.banggooso.com/").get();
	
	// feed-list 속성안에  요소 데이터들을 긁어온다
    Elements posts = doc1.body().getElementsByClass("feed-list");
    Elements file = posts.select("li");
	
    for(Element e : file){
    	
    	title = e.select(".title_wrap h4").text();
    	kind = "방구석 연구소";
    	content = e.select(".title_wrap h5").text();
    	img = e.select(".thumb img").attr("data-src");
    	src = e.select("a").attr("href");
    	
    	if(src != null){
	    	if(src.startsWith("/intro") == true){
	    		src = "https://www.banggooso.com/" + "gl/" + src.substring(16);;
	    		i++;
	    	}
	    	if(src.contains("메타브")==true){continue;}
    	}
    	SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, title);
    	pstmt.setString(2, kind);
    	pstmt.setString(3, content);
    	pstmt.setString(4, img);
    	pstmt.setString(5, src);
    	pstmt.executeUpdate();

    	if(i == 5){break;}
    }
    	//--------------------------------------방구석연구소 크롤링 끝-----------------------------------------
    	
    	//-------------------------------------- ktest 크롤링 시작-----------------------------------------
    	i = 0;
    	
    	Document doc2 = Jsoup.connect("https://ktestone.com/kapable.github.io/").get();
    	
    	// feed-list 속성안에  요소 데이터들을 긁어온다
        Elements posts2 = doc2.body().getElementsByClass("main-link-div");
        Elements file2 = posts2.select("a");
        for(Element e1 : file2){
        	
        	title = e1.select("img").attr("alt");
        	kind = "ktest";
        	content = e1.select("img").attr("alt");
        	img = e1.select("img").attr("src");
        	src = e1.select("a").attr("href");

    	    src = "https://ktestone.com" + src;
    	    i++;
    	    
        	SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
        	
        	pstmt = conn.prepareStatement(SQL);
        	pstmt.setString(1, title);
        	pstmt.setString(2, kind);
        	pstmt.setString(3, content);
        	pstmt.setString(4, img);
        	pstmt.setString(5, src);
        	pstmt.executeUpdate();

        	if(i == 5){break;}
        }

        	//--------------------------------------ktest 크롤링 끝-----------------------------------------
        	
        	//--------------------------------------방구석연구소 결과 크롤링 시작-----------------------------------------
        	
        	SQL = "select t_id, t_src from test where t_kind = '방구석 연구소'";
        	pstmt = conn.prepareStatement(SQL);
        	rs = pstmt.executeQuery();
          	
          	while(rs.next()){
          		t_id = rs.getString("t_id");
          		t_src = rs.getString("t_src");
          		
          		t_src = t_src + "/list-type";
          		i = 1;
          		
          		Document doc3 = Jsoup.connect(t_src).get();
            	
            	// feed-list 속성안에  요소 데이터들을 긁어온다
                Elements posts3 = doc3.body().getElementsByClass("test-lists");
                Elements file3 = posts3.select("li.test-list-item");
                for(Element e2 : file3){
                	
                	String content1 = e2.select("div.item-info h4").text();
                	img = e2.select("figure.thumb img").attr("src");
            	    
                	SQL = "insert into test_result(t_id,s_id,r_content,r_img) values(?,?,?,?)";
                	
                	pstmt = conn.prepareStatement(SQL);
                	pstmt.setString(1, t_id);
                	pstmt.setString(2, Integer.toString(i));
                	pstmt.setString(3, content1);
                	pstmt.setString(4, img);
                	pstmt.executeUpdate();
                	i++;
                }
    		}
          	
    //------------------------------------------------ktest 결과 넣기--------------------------------------------------------------------------------------
    
	SQL = "select t_id, t_src from test where t_kind = 'ktest'";
	pstmt = conn.prepareStatement(SQL);
	rs = pstmt.executeQuery();
  	
	String skin[] = {"DRNT", "DRNW", "DRPT", "DRPW", "DSNT", "DSNW", "DSPT", "DSPW", "ORNT", "ORNW", "ORPT", "ORPW", "OSNT", "OSNW", "OSPT", "OSPW"};
  	String half[] = {"S-result", "N-result"};
	
  	while(rs.next()){
  		t_id = rs.getString("t_id");
  		t_src = rs.getString("t_src");
  		
  		if(Integer.parseInt(t_id) == 6){
  			for(i = 0; i < 16; i++ ){
  				img = "https://images.ktestone.com/resultImages" + t_src.substring(38) + skin[i] + ".png";
  				SQL = "insert into test_result(t_id,s_id,r_img) values(?,?,?)";
  	        	
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, img);
  	        	pstmt.executeUpdate();
  	        	
  			}
  		}
  		else if(Integer.parseInt(t_id) == 7){
  			for(i = 0; i<16; i++){
  				img = "https://images.ktestone.com/resultImages" + t_src.substring(38) + mbti[i] + ".png";
				SQL = "insert into test_result(t_id,s_id,r_img) values(?,?,?)";
				
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, img);
  	        	pstmt.executeUpdate();
  			}
  		}
  		else if(Integer.parseInt(t_id) == 10){
  			for(i = 0; i<2; i++){
  				img = "https://images.ktestone.com/resultImages" + t_src.substring(38) + half[i] + ".jpg";
				SQL = "insert into test_result(t_id,s_id,r_img) values(?,?,?)";
				
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, img);
  	        	pstmt.executeUpdate();
  			}
  		}
  		else{
  			for(i = 0; i<16; i++){
  				img = "https://images.ktestone.com/resultImages" + t_src.substring(38) + mbti[i] + ".jpg";
				SQL = "insert into test_result(t_id,s_id,r_img) values(?,?,?)";
				
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, img);
  	        	pstmt.executeUpdate();
  			}
  		}
	}
  //---------------------------------------------------------------------ktest 결과 크롤링----------------------------------------------------------------------

  //------------------------------------------------------개별 테스트 DB 입력---------------------------------------------------------
	    
    	SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, "성향 테스트");
    	pstmt.setString(2, "기타");
    	pstmt.setString(3, "여가는 어떠하며 취향은 어떠하리");
    	pstmt.setString(4, "https://personality.frip.co.kr/static/intro-content.3a849b89.png");
    	pstmt.setString(5, "https://personality.frip.co.kr/");
    	pstmt.executeUpdate();
    	
		SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, "말싸움 전투력 테스트");
    	pstmt.setString(2, "기타");
    	pstmt.setString(3, "나의 말빨은 상위 몇 퍼센트일까?");
    	pstmt.setString(4, "https://mbti.yplabs.net/main.gif");
    	pstmt.setString(5, "https://mbti.yplabs.net/intro");
    	pstmt.executeUpdate();

		SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, "직장인 생존 유형 테스트");
    	pstmt.setString(2, "기타");
    	pstmt.setString(3, "오늘도 존버 중인 나를 위한 직장인 생존 유형 테스트");
    	pstmt.setString(4, "https://doguri.kr/image/main/main_img.png");
    	pstmt.setString(5, "https://doguri.kr/");
    	pstmt.executeUpdate();
    	
		SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, "성격으로 알아보는 멍BTI");
    	pstmt.setString(2, "기타");
    	pstmt.setString(3, "나는 어떤 개일까?");
    	pstmt.setString(4, "https://www.lifeplus.co.kr/pet/mbti/static/images/intro_2.png");
    	pstmt.setString(5, "https://www.lifeplus.co.kr/pet/mbti/intro.html");
    	pstmt.executeUpdate();
    	
    	//------------------------------------------------------개별 테스트 결과 입력---------------------------------------------------------
		
  		t_id = "11";
  		for(i = 0; i < 16; i++){
  		t_src = "https://personality.frip.co.kr/result/" + mbti[i].toLowerCase();

  		Document doc4 = Jsoup.connect(t_src).get();
    	
    	// feed-list 속성안에  요소 데이터들을 긁어온다
    	Elements posts4 = doc4.body().getElementsByClass("Result__ResultWrapper-sc-1quf7h1-0");
        Elements file4 = posts4.select("div");
        for(Element e3 : file4){

        	img = e3.select(".Result__ResultWrapper-sc-1quf7h1-0 img").attr("src");
        	if(img != ""){
        	img = "https://personality.frip.co.kr" + img;
        	SQL = "insert into test_result(t_id,s_id,r_img) values(?,?,?)";
        	
        	pstmt = conn.prepareStatement(SQL);
        	pstmt.setString(1, t_id);
        	pstmt.setString(2, Integer.toString(i+1));
        	pstmt.setString(3, img);
        	pstmt.executeUpdate();
        	
        	}else{
        		int j = 0;
        		j++;
        		}
        	
        }
  		}
  		
  		t_id = "12";
  		String content2 = "";
  		
  		for(i = 0; i < 16; i++){
  	  		t_src = "https://mbti.yplabs.net/result/" + mbti[i].toLowerCase();

  	  		Document doc5 = Jsoup.connect(t_src).get();
  	    	
  	    	// feed-list 속성안에  요소 데이터들을 긁어온다
  	    	Elements posts5 = doc5.body().getElementsByClass("data.v-0cba62de");
  	        Elements file5 = doc5.select("#app");
  	        for(Element e4 : file5){
				content2 = e4.select("div.resultHeader").text() + "<br>" + e4.select("div.resultSubHeader").text() + "<br>" + e4.select("div.detailText div");
  	        	img = e4.select("img.resultImage").attr("src");
				
  	        	img = "https://mbti.yplabs.net" + img;
  	        	
  	        	SQL = "insert into test_result(t_id,s_id,r_content, r_img) values(?,?,?,?)";
  	        	
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, content2);
  	        	pstmt.setString(4, img);
  	        	pstmt.executeUpdate();
  	        	
  	        	//div태그 같이 들어가는데 어차피 출력하면 div 태그 우리가 안넣어도 자동으로 넣어지는거니까 가공 안하구 넣을겡
  	        }
  	  		}
  		
    	t_id = "13";
  		String content3 = "";
  		int j = 0;
  		for(i = 0; i < 10; i++){
  			j++;
  			if(j <= 9)
  	  			t_src = "https://doguri.kr/result0" + j + ".php";
  			else if(j == 10)
  				t_src = "https://doguri.kr/result10.php";

  	  		Document doc6 = Jsoup.connect(t_src).get();
  	    	
  	    	// feed-list 속성안에  요소 데이터들을 긁어온다
  	    	Elements posts6 = doc6.body().getElementsByClass("result__inner");
  	        Elements file6 = posts6.select("div");
  	        
  	        
  	        	img = file6.select("div.result__img img").attr("src");
  	        	img = "https://doguri.kr" + img;
  	        	content3 = file6.select("p.main__stit").text() + "<br>" + file6.select("p.main__tit span").text() + "<br>" + file6.select("ul.main__list").text() + "<br>";
  	        	  	
  	        	SQL = "insert into test_result(t_id,s_id, r_content, r_img) values(?,?,?,?)";
  	        	
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, content3);
  	        	pstmt.setString(4, img);
  	        	pstmt.executeUpdate();
  	    	    
  	  		}
  		
  		
    	t_id = "14";
		String content4 = "";
  		
  		for(i = 0; i < 16; i++){
  	  		t_src = "https://www.lifeplus.co.kr/pet/mbti/result" + mbti[i] + ".html";

  	  		Document doc7 = Jsoup.connect(t_src).get();
  	    	
  	    	// feed-list 속성안에  요소 데이터들을 긁어온다
  	    	Elements posts7 = doc7.body().getElementsByClass("center-wrap");
  	        Elements file7 = posts7.select("div");
				content4 = file7.select(".result-title span").text() + "<br>" + file7.select(".txt-1 span").text() + "<br>" + file7.select(".txt-2 strong").text() + "<br>" + file7.select(".text-result").text() + "<br>"; 
				img = file7.select(".img-result img").attr("src");
				img = "https://www.lifeplus.co.kr/pet/mbti/" + img;
				
  	        	SQL = "insert into test_result(t_id,s_id,r_content, r_img) values(?,?,?,?)";
  	        	
  	        	pstmt = conn.prepareStatement(SQL);
  	        	pstmt.setString(1, t_id);
  	        	pstmt.setString(2, Integer.toString(i+1));
  	        	pstmt.setString(3, content4);
  	        	pstmt.setString(4, img);
  	        	pstmt.executeUpdate();
  	        
  	  	}
  		
} finally {	}
%>

</body>
</html>
