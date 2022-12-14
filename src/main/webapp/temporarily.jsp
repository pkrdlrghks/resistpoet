<%@page import="poet.ex01.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String chekingId=request.getParameter("checkingId").toString();
	MemberDAO dao=new MemberDAO();
	boolean checkResult=dao.checkId(chekingId);
	String idResult="";
	String textResult="이미있는 아이디 입니다.";
	if(checkResult) {
		idResult=chekingId;
		textResult="사용가능한 아이디 입니다.";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="img/android-icon-36x36.png" rel="shortcut icon" type="image/x-icon">
    <title>임시페이지</title>
    <script type="text/javascript">
	    window.opener.sinDater.id.value="<%=idResult%>"
		window.opener.alert("<%=textResult%>");
		window.close()
    </script>
</head>
<body>
  
</body>
</html>