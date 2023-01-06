<%@page import="poet.ex01.NoticeVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="poet.ex01.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<NoticeVO> vo=(ArrayList<NoticeVO>)request.getAttribute("noticevo");
  	Iterator voIterator=vo.iterator();
  	String text="";
	String href="";
	String user=(String)session.getAttribute("id");
  	if(user != null){
		text="마이페이지";
		href="./mypageServlet";
	}else{
		text="로그인";
		href="./login.html";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="img/android-icon-36x36.png" rel="shortcut icon" type="image/x-icon">
    <title>공지사항</title>
    <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.2.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="main.js"></script>
    <style>
      #navigation{
        position: fixed;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
      }
      a { text-decoration: none; color: black; }
      a:visited { text-decoration: none; }
      a:hover { text-decoration: none; }
      a:focus { text-decoration: none; }
      a:hover, a:active { text-decoration: none; }
    </style>
    <script>
      var checkMaster=(window.sessionStorage.getItem("id")=="masster")
      var displayValue="none";
      window.onload=function(){
        if(checkMaster){
          displayValue="inline";
        }
        document.getElementById("masterView").style("display", displayValue);
      }
    </script>
</head>
<body>
  <header>
    <nav class="navbar sticky-top bg-danger bg-gradient">
        <div class="container">
            <a class="navbar-brand" href="boot.html">
              <img src="img/android-icon-36x36.png" alt="로고" width="30" height="24">저항시인
            </a>
            <a class="navbar-brand" href="<%=href%>"><%=text %></a>
        </div>
      </nav>
    </header>
    <div class="btn-group-vertical" id="navigation" role="group" aria-label="Vertical button group">
      <a href="./index.html#isanghwa" class="btn btn-dark">이상화</a>
      <a href="./index.html#iyugsa" class="btn btn-dark">이육사</a>
      <a href="./index.html#yundongju" class="btn btn-dark">윤동주</a>
    </div> 
    <div class="container col-4 mt-5 mb-5 bg-light pb-3 pt-3 rounded">
      <h3 class="text-center">공지사항</h3>
      <a href="#">등록하기</a><br>
      <table class="table table-hover">
        <tr>
          <td>제목</td><td>날짜</td>
        </tr>
         <%
              	while(voIterator.hasNext()){
              		NoticeVO noticeDater=(NoticeVO)voIterator.next(); %>
                <tr>
                  <td><a href='noticeViewServlet?num=<%=noticeDater.getNoticeNum()%>'><%=noticeDater.getTitle()%></a></td>
                  <td><%=noticeDater.getUploadDate()%></td>
                </tr>
                <%} %>
      </table>
      <%if(user != null && user.equals("master")){ %>
        <div class="text-end m-1" id="masterView">
        	<a href="./notice.html" class="btn btn-primary disabled" role="button" aria-disabled="true">등록하기</a>
        </div>
  		<%} %>
  	</div>
  <footer class="pt-1  border-top bg-primary bg-gradient">
    <h4 class="text-center">출처</h4>
    <div class="grid container text-center">
        <a class="link-dark" style="text-decoration: none;" href="http://www.sanghwa.org/">이상화 기념 사업회</a>
        <a class="link-dark" style="text-decoration: none;" href="http://www.munhakwan.com/member.html?html=member-munhakwan.html&section=sc4&section2=%EC%9D%B4%EC%9C%A1%EC%82%AC%EB%AC%B8%ED%95%99%EA%B4%80">이육사 문학관</a>
        <a class="link-dark" style="text-decoration: none;" href="https://search.naver.com/p/crd/rd?m=1&px=386&py=184&sx=386&sy=184&p=h2zFJsp0J1Zss5dzZRNssssst9G-090366&q=%EC%97%B0%EC%84%B8%EB%8C%80%ED%95%99%EA%B5%90+%EC%9C%A4%EB%8F%99%EC%A3%BC+%EA%B8%B0%EB%85%90%EA%B4%80&ie=utf8&rev=1&ssc=tab.nx.all&f=nexearch&w=nexearch&s=5i%2FJLnSU52M6g9gn3rLz9g%3D%3D&time=1668081647035&abt=%5B%7B%22eid%22%3A%22SBR1%22%2C%22vid%22%3A%22508%22%7D%5D&a=vsd_bas.tit&r=1&i=a00000fa_98dd8dc90c4a0527f2d9a252&u=https%3A%2F%2Fyoondongju.yonsei.ac.kr%2F&cr=1">연세대학교 윤동주 기념관</a>
        <a class="link-dark" style="text-decoration: none;" href="https://terms.naver.com/">네이버 지식백과</a>
    </div>
  </footer>
</body>
</html>