<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String text="";
	String href="";
	if(session.getAttribute("id") != null){
		text="마이페이지";
		href="./mypageServlet";
	}else{
		text="로그인";
		href="./login.html";
	}
	
%>
	<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css" type="text/css">
    <script src="bootstrap-5.2.2-dist/js/bootstrap.bundle.min.js"></script>
    <style>
      #navigation{
        position: fixed;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
      }
    </style>
    <link href="img/android-icon-36x36.png" rel="shortcut icon" type="image/x-icon">
    <title>저항시인</title>
</head>
<body>
  <header>
    <nav class="navbar sticky-top bg-danger bg-gradient">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
              <img src="img/android-icon-36x36.png" alt="로고" width="30" height="24">저항시인
            </a>
            <a href="<%=href %>" class="navbar-brand" id="nextLink"><%=text %></a>
        </div>
      </nav>
    </header>
    <div class="btn-group-vertical" id="navigation" role="group" aria-label="Vertical button group">
      <a href="index.jsp#isanghwa" class="btn btn-dark">이상화</a>
      <a href="index.jsp#iyugsa" class="btn btn-dark">이육사</a>
      <a href="index.jsp#yundongju" class="btn btn-dark">윤동주</a>
    </div> 
  <article class="mt-5">
    <article>
      <div class="card mb-3" style="max-width: 1000px; margin: 0 auto;" id="isanghwa">
        <div class="row g-0" >
          <div class="col-md-4">
            <img src="img/isanghwa.png" class="rounded" style="width: 90%; height: 90%;" alt="이상화">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">이상화<br>(1901~1943)</h5>
              <p class="card-text mt-3">
                18세때 경성중앙학교 3년을 마쳤고,
                1919년 3‧1만세운동 당시 친구 백기만(白基萬) 등과 함께 대구학생봉기를 주도하다가
                발각되기도 했다. 1921년 프랑스 유학을 목적으로 일본에 건너가 아테네 프랑세에서
                프랑스어와 프랑스문학을 공부하다가 1923년 9월 관동대진재(關東大震災)를 겪고 고국으로 돌아왔다.
                1927년 의열단 이종암(李鍾巖) 사건에 연루되어 구금되기도 했고, 1937년 백씨 이상정 장군을 만나러 만경(滿京)에 갔다가
                돌아오자마자 일본관헌에 붙잡혀 4개월 동안 옥고를 치렀다. 그 후 대구교남학교에서 교편을 잡았으며, 교남학교를 그만둔 후 「춘향전」의 영역본(英譯本)과 국문학사 등을 기획하고 독서와 연구에 몰두했으나, 완성치 못하고 1943년 4월 25일 사망했다. 대구광역시 달성공원에 시비가 세워져 있다.
              </p>
            </div>
          </div>
        </div>
          <div class="text-center" style="width: 100%;">
            <div class="card-body">
              <a href="poetview.jsp?poetTitle=towriter" class="card-link link-dark" style="text-decoration: none;">시인에게</a>
              <a href="poetview.jsp?poetTitle=wailing" class="card-link link-dark" style="text-decoration: none;">통곡</a>
              <a href="poetview.jsp?poetTitle=reversesky" class="card-link link-dark" style="text-decoration: none;">역천</a>
              <a href="poetview.jsp?poetTitle=spring" class="card-link link-dark" style="text-decoration: none;">빼앗긴 들에도 봄은 오는가</a>
              <a href="poetview.jsp?poetTitle=eatsun" class="card-link link-dark" style="text-decoration: none;">나는 해를 먹다</a>
            </div>
        </div>
      </div>
  </article>
  <article>
    <div class="card mb-3" style="max-width: 1000px; margin: 0 auto;" id="iyugsa">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="img/iwonlog.png"class="rounded" style="width: 90%; height: 90%;"alt="이육사">
        </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">이육사<br>(1904~1944)</h5>
          <p class="card-text mt-3">
            1904년 경북 안동군 도산면 원촌리 881번지에서 아은처사인 부친 이가호와 모친 허길 사이에서 5형제중 차남으로 태어났다. 본관은 진성(眞城)이며 본명은 원록(源祿)이나 후에 원삼(源三) 또는 활(活)이라 하였으며, 자(字)는 태경(台卿), 아호는 육사(陸史)이다. 어려서부터 형제지간의 우애가 지극하였으며 용모는 청수하고 깨끗한 선비형으로서, 한번 사귀면 생사를 같이 할 만큼 신의와 의리가 강하였다고 한다. 12살이 되던 해에 조부 이중직이 숙장이었던 예안보문의숙(禮安普文義塾)에서 한학을 배웠다. 17세가 되자 대구로 이사하여 시내에 있는 교남학교에서 신학문을 배우고 이듬해에 영천에 살고 있던 안일양과 혼인하였다. 영천에 있는 백학서원에서 학문을 연수하였으나, 끊임없는 미지의 세계를 동경하여 1923년에 일본에 건너가 1년여 간 동경에 있는 대학을 다니다가 이후 1925년에 귀국하였다.
          </p>
        </div>
      </div>
      </div>
    <div class="text-center" style="width: 100%;">
        <div class="card-body">
          <a href="poetview.jsp?poetTitle=greengrape" class="card-link link-dark" style="text-decoration: none;">청포도</a>
          <a href="poetview.jsp?poetTitle=peak" class="card-link link-dark" style="text-decoration: none;">절정</a>
          <a href="poetview.jsp?poetTitle=field" class="card-link link-dark" style="text-decoration: none;">광야</a>
          <a href="poetview.jsp?poetTitle=twilight" class="card-link link-dark" style="text-decoration: none;">황혼</a>
          <a href="poetview.jsp?poetTitle=notitle" class="card-link link-dark" style="text-decoration: none;">무제</a>

        </div>
      </div>
    </div>
    </article>
    <article>
      <div class="card mb-3" style="max-width: 1000px; margin: 0 auto;" id="yundongju">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="img/yundongju.png"class="rounded" style="width: 90%; height: 90%;"alt="윤동주">
          </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title">윤동주<br>(1904~1944)</h5>
            <p class="card-text mt-3">
              북간도(北間島) 출생. 용정(龍井)에서 중학교를 졸업하고 연희전문을 졸업한 뒤 일본 도쿄에 있는 릿쿄 대학 영문과에 입학했다가 1학기를 마치고 교토에 있는 도시샤 대학 영문과에 편입했다. 그러나 1943년 7월 독립운동 혐의로 일본 경찰에 검거되어 2년형을 선고받고 후쿠오카 형무소에 수감되었다가 젊은 나이로 옥사했다. 윤동주는 일제에 의해 억압받는 민족의 현실에 정서적 연원을 둔 작품을 많이 썼다.  
            </p>
          </div>
        </div>
        </div>
      <div class="text-center" style="width: 100%;">
          <div class="card-body">
            <a href="poetview.jsp?poetTitle=prologue" class="card-link link-dark" style="text-decoration: none;">서시</a>
            <a href="poetview.jsp?poetTitle=cross" class="card-link link-dark" style="text-decoration: none;">십자가</a>
            <a href="poetview.jsp?poetTitle=night" class="card-link link-dark" style="text-decoration: none;">별 헤는 밤</a>
            <a href="poetview.jsp?poetTitle=confession" class="card-link link-dark" style="text-decoration: none;">참회록</a>
            <a href="poetview.jsp?poetTitle=toeasy" class="card-link link-dark" style="text-decoration: none;">쉽게 쓰여진씨</a>  
          </div>
        </div>
      </div>
      </article>
    
  </article>
  <div class="text-end m-1"><a href="NoticeServlet" class="btn btn-primary" >공지사항</a></div>
  <footer class="p-1 border-top bg-primary bg-gradient ">
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