<%@page import="poet.ex01.NoticeVO"%>
<%@page import="poet.ex01.MemberVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="poet.ex01.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	NoticeVO vo=(NoticeVO)request.getAttribute("noticeView");
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
    </style>
    <script>
      //var textForm=document.getElementsByName("textForm");
      function updateNotice(){
        textForm.action="noticeUpdateServlet";
      }
      function deleteNotice(){
        textForm.action="noticeDeleteServlet";
      }
    </script>
</head>
<body>
  <header>
    <nav class="navbar sticky-top bg-danger bg-gradient">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
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
      <form name="textForm" action="" method="post">
      	<input type="hidden" name="noticeNum" value="<%=vo.getNoticeNum()%>">
        <div class="row">
            <label for="title" class="col-form-label">제목</label>
        </div>
        <div class="container row input-group  mb-3">
          <input type="text" class="form-control" name="title" value="<%=vo.getTitle()%>">
        </div>
        <div class="container row input-group  mb-3">
          <textarea class="form-control" name="content" id="" cols="20" rows="10"><%=vo.getContent() %></textarea>
        </div>
        <%if(user != null && user.equals("master")){%>
        <div class="row input-group">
          <input type="submit" value="수정하기" class="form-control" onclick="updateNotice()">
          <input type="submit" value="삭제하기" class="form-control" onclick="deleteNotice()">
        </div>
        <%} %>
    </form>
    <div class="text-end m-1"><a href="NoticeServlet" class="btn btn-primary">목록으로</a></div>
  </div>
</body>
</html>