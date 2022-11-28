<%@page import="poet.ex01.MemberVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="poet.ex01.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberVO vo=request.getAttribute("setmypage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="img/android-icon-36x36.png" rel="shortcut icon" type="image/x-icon">
    <title>마이페이지</title>
    <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.2.2-dist/js/bootstrap.bundle.min.js"></script>
    <style>
      #navigation{
        position: fixed;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
      }
    </style>
</head>
<body>
  <header>
    <nav class="navbar sticky-top bg-danger bg-gradient">
        <div class="container">
            <a class="navbar-brand" href="boot.html">
              <img src="img/android-icon-36x36.png" alt="로고" width="30" height="24">저항시인
            </a>
            <a href="index.html" class="navbar-brand" onclick="session.invalidate();">로그아웃</a>
        </div>
      </nav>
    </header>
    <div class="btn-group-vertical" id="navigation" role="group" aria-label="Vertical button group">
      <a href="./index.html#isanghwa" class="btn btn-dark">이상화</a>
      <a href="./index.html#iyugsa" class="btn btn-dark">이육사</a>
      <a href="./index.html#yundongju" class="btn btn-dark">윤동주</a>
    </div> 
    <div class="container col-4 mt-5 mb-5 bg-light pb-3 pt-3 rounded">
      <h3 class="text-center">회원 정보</h3>
      <form action="/updateMypage.jsp" method="post">
        <div class="row">
            <label for="id" class="col-form-label">아이디</label>
        </div>
        <div class="input-group">
          <input type="text" name="id" class="form-control" value="<%=vo.getId()%>" readonly>
        </div>
        <div class="row">
          <label for="inputPassword6" class="col-form-label">이름</label>
        </div>
        <div class="input-group">
          <input type="text" class="form-control" name="name" value="<%=vo.getName()%>" readonly>
        </div>
        <div class="row">
          <label for="inputPassword6" class="col-form-label">전화 번호</label>
        </div>
        <div class="input-group">
          <input type="tel" class="form-control" name="tel" value="<%=vo.getTel()%>" readonly>
        </div>
        <div class="row">
          <label for="inputPassword6" class="col-form-label">이메일</label>
        </div>
        <div class="input-group">
          <input type="email" class="form-control" name="email" value="<%=vo.getEmail()%>" readonly>
        </div>
        <div class="input-group mt-3">
          <input type="submit" value="회원 정보 변경" class="form-control" placeholder="Recipient's username">
        </div>
    </form>
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