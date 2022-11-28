if(sessionStorage.getItem("id")){
    var text="마이페이지"
    var href= "mypage.jsp"
  }else{
    var text="로그인"
    var href= "login.html"
  }
  window.onload=function(){
    document.getElementById("nextLink").textContent=text;
    document.getElementById("nextLink").setAttribute("href",href);
  }