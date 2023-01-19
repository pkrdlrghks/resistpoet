<%@page import="poet.ex01.ReviewDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="poet.ex01.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//시처리 코드
	String poetTitle=request.getParameter("poetTitle").toString();
%>
<%
	//로그인에따른 표시
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.2.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="main.js"></script>
    <script>
      var handl=false;
      window.onload= function(){
        let title=document.getElementById("content").querySelector("h2");
        title.classList.add('mb-5');
      }
      function reviewHandler(){
        if(!handl){
          document.getElementById("reviewWriter").style("display","block");
        }else{
          document.forms("reviewForm").submit();
        }
        handl=!handl;
      }
    </script>
    <style>
      #navigation{
        position: fixed;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
      }
    </style>
    <link href="img/android-icon-36x36.png" rel="shortcut icon" type="image/x-icon">
    <title>시</title>
</head>
<body>
  <header>
    <nav class="navbar sticky-top bg-danger bg-gradient">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
              <img src="img/android-icon-36x36.png" alt="로고" width="30" height="24">저항시인
            </a>
            <a class="navbar-brand" id="nextLink" href="<%=href%>"><%=text %></a>
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
      <div class="card mb-3" style="max-width: 1000px; margin: 0 auto;">
        <div class="row g-0">
            <div class="card-body text-center" id="content">
             <%if(poetTitle.equals("towriter")){ %>
             	<h2>시인에게</h2>
		        <p>한 편(篇)의 시(詩) 그것으로
		        </p><p>새로운 세계(世界) 하나를 낳아야 할 줄 깨칠 그때라야
		        </p><p>시인(詩人)아 너의 존재(存在)가
		        </p><p>비로소 우주(宇宙)에게 없지 못할 너로 알려질 것이다.
		        </p><p>가뭄 든 논끼에는 청개구리의 울음이 있어야 하듯-
		        </p><p> 
		        </p><p>새 세계(世界)란 속에서도
		        </p><p>마음과 몸이 갈려 사는 줄, 풍류만 나와보아라
		        </p><p>시인(詩人)아 너의 목숨은
		        </p><p>진저리나는 절름발이 노릇을 아직도 하는 것이다.
		        </p><p>언제든지 일식(日飾)된 해가 돋으면 뭣하며 진들 어떠랴
		        </p><p> 
		        </p><p>시인(詩人)아 너의 영광(榮光)은
		        </p><p>미친개 꼬리도 밟는 어린애의 짬 없는 그 마음이 되어
		        </p><p>밤이라도 낮이라도
		        </p><p>새 세계(世界)를 낳으려 소댄 자국이 시(詩)가 될 때에- 있다.
		        </p><p>촛불로 날아들어 죽어도 아름다운 나비를 보아라.</p>
             <%}else if(poetTitle.equals("wailing")){ %>
             	<h2>통곡</h2>
		        <p>하늘을 우러러
		        </p><p>울기는 하여도
		        </p><p>하늘이 그리워 울음이 아니다
		        </p><p>두 발을 못 뻗는 이 땅이 애달파
		        </p><p>하늘을 흘기니
		        </p><p>울음이 터진다.
		        </p><p>해야 웃지 마라.
		        </p><p>달도 뜨지 마라.</p>
             <%}else if(poetTitle.equals("reversesky")){ %>
             	<h2>역천</h2>
		        <p>이때야말로 이 나라의 보배로운 가을철이다.
		        </p><p>더구나 그림과도 같고 꿈과도 같은 좋은 밤이다.
		        </p><p>초가을 열나흘 밤 열푸른 유리로 천장을 한 밤
		        </p><p>거기서 달은 마중 왔다 얼굴을 쳐들고 별은 기다린다 눈짓을 한다.
		        </p><p>그리고 실낱같은 바람은 길을 끄으려 바라노라 이따금 성화를 하지 않는가.
		        </p><p> 
		        </p><p>그러나 나는 오늘밤에 좋아라 가고프지가 않다.
		        </p><p>아니다 나는 오늘밤에 좋아라 보고프지도 않다.
		        </p><p> 
		        </p><p>이런 때 이런 밤 이 나라까지 복되게 보이는 저편 하늘을
		        </p><p>햇살이 못 쪼이는 그 땅에 나서 가슴 밑바닥으로 못 웃어 본 나는 선뜻만 보아도
		        </p><p>철모르는 나의 마음 홀아비 자식 아비를 따르듯 불 본 나비가 되어
		        </p><p>꾀이는 얼굴과 같은 달에게로 웃는 이빨 같은 별에게로
		        </p><p>앞도 모르고 뒤도 모르고 곤두치듯 줄달음질을 쳐서 가더니.
		        </p><p> 
		        </p><p>그리하여 지금 내가 어디서 무엇 때문에 이 짓을 하는지
		        </p><p>그것조차 잊고서도 낮이나 밤이나 노닐 것이 두려웁다.
		        </p><p> 
		        </p><p>걸림 없이 사는 듯하면서도 걸림뿐인 사람의 세상-
		        </p><p>아름다운 때가 오면 아름다운 그때와 어울려 한 뭉텅이가 못 되어지는 이 살이-
		        </p><p>꿈과도 같고 그림과도 같고 어린이 마음 위와 같은 나라가 있어
		        </p><p>아무리 불러도 멋대로 못 가고 생각조차 못하게 지천을 떠는 이 설움
		        </p><p>벙어리 같은 이 아픈 설움이 칡넝쿨같이 몇 날 몇 해나 얽히어 틀어진다.
		        </p><p>
		        </p><p>보아라 오늘밤에 하늘이 사람 배반하는 줄 알았다
		        </p><p>아니다 오늘밤에 사람이 하늘 배반하는 줄도 알았다.</p>
             <%}else if(poetTitle.equals("spring")){ %>
             	<h2>빼앗긴 들에도 봄은 오는가</h2>
		        <p>지금은 남의 땅- 빼앗긴 들에도 봄은 오는가?
		        </p><p> 
		        </p><p>나는 온몸에 햇살을 받고
		        </p><p>푸른 하늘 푸른 들이 맞붙은 곳으로
		        </p><p>가르마 같은 논길을 따라 꿈속을 가듯 걸어만 간다.
		        </p><p> 
		        </p><p>입술을 다문 하늘아 들아
		        </p><p>내 맘에는 내 혼자 온 것 같지를 않구나.
		        </p><p>네가 끌었느냐 누가 부르더냐 답답어라 말을 해다오.
		        </p><p> 
		        </p><p>바람은 내 귀에 속삭이며
		        </p><p>한 자국도 섰지 마라 옷자락을 흔들고
		        </p><p>종다리는 울타리 너머에 아씨같이 구름 뒤에다 반갑다 웃네.
		        </p><p> 
		        </p><p>고맙게 잘 자란 보리밭아
		        </p><p>간밤 자정이 넘어 내리던 고운 비로
		        </p><p>너는 삼단같은 머리를 감았구나 내 머리조차 가뿐하다.
		        </p><p> 
		        </p><p>혼자라도 가쁜하게나 가자
		        </p><p>마른 논을 안고 도는 착한 도랑이
		        </p><p>젖먹이 달래는 노래를 하고 제 혼자 어깨춤만 추고 가네.
		        </p><p> 
		        </p><p>나비 제비야 깝치지 마라
		        </p><p>맨드라미 들마꽃에도 인사를 해야지
		        </p><p>아주까리 기름을 바른 이가 지심 매던 그들이라 다 보고싶다.
		        </p><p> 
		        </p><p>내 손에 호미를 쥐어다오
		        </p><p>살진 젖가슴과 같은 부드러운 이 흙을
		        </p><p>발목이 시도록 밟아도 보고 좋은 땀조차 흘리고 싶다.
		        </p><p> 
		        </p><p>강가에 나온 아이와 같이
		        </p><p>짬도 모르고 끝도 없이 닫는 내 혼아
		        </p><p>무엇을 찾느냐 어디로 가느냐 우스웁다 답을 하려무나.
		        </p><p> 
		        </p><p>나는 온몸에 풋내를 띠고
		        </p><p>푸른 웃음 푸른 설움이 어우러진 사이로
		        </p><p>다리를 절며 하루를 걷는다 아마도 봄 신령이 잡혔나보다.
		        </p><p> 
		        </p><p>그러나 지금은- 들을 빼앗겨 봄조차 빼앗기겠네.</p>
             <%}else if(poetTitle.equals("eatsun")){ %>
             	<h2>나는 해를 먹다</h2>
		        <p>구름은 차림옷에 놓기 알맞아 보이고
		        </p><p>하늘은 바다같이 깊다라- ㄴ하다.
		        </p><p> 
		        </p><p>한낮 뙤약볕이 쬐는 지도 모르고
		        </p><p>온몸이 아니 넋조차 깨운-아찔하여지도록
		        </p><p>뼈 저리는 좋은 맛에 자스러지기는
		        </p><p>보기 좋게 잘도 자란 과수원(果樹園)의 목거지다.
		        </p><p> 
		        </p><p>배추속처럼 핏기 없는 얼굴에도
		        </p><p>푸른빛이 비치어 생기를 띠고
		        </p><p>더구나 가슴에는 깨끗한 가을 입김을 안은 채
		        </p><p>능금을 바수노라 해를 지우나니.
		        </p><p> 
		        </p><p>나뭇가지를 더위잡고 발을 뻗기도 하면서
		        </p><p>무성한 나뭇잎 속에 숨어 수줍어하는
		        </p><p>탐스럽게도 잘도 익은 과일을 찾아
		        </p><p>위태로운 이 짓에 가슴을 조이는 이때의 마음 저 하늘같이 맑기도 하다.
		        </p><p> 
		        </p><p>머리카락 같은 실바람이 아무리 나부껴도
		        </p><p>메밀꽃밭에 춤추던 벌들이 아무리 울어도
		        </p><p>지난날 예쁜 이를 그리어 살며시 눈물지는,
		        </p><p>그런 생각은 꿈밖에 꿈으로도 보이지 안는다.
		        </p><p> 
		        </p><p>남의 과일밭에 몰래 들어가
		        </p><p>험상스런 얼굴과 억센 주먹을 두려워하면서.
		        </p><p>하나 둘 몰래 훔치던 어릴 적 철없던 마음이 다시 살아나자.
		        </p><p>그립고 우습고 죄 없던 그 기쁨이 오늘에도 있다.
		        </p><p> 
		        </p><p>부드럽게 쌓여 있는 이랑의 흙은
		        </p><p>솥뚜껑을 열고 밥 김을 맡는 듯 구수도 하고
		        </p><p>나무에 달린 과일-푸른 그릇에 담긴 깍두기 같이
		        </p><p>입안에 맑은 침을 자아내나니.
		        </p><p> 
		        </p><p>첫가을! 琴湖江 굽이쳐 흐르고
		        </p><p>벼이삭 배부르게 늘어져 섰는
		        </p><p>이 벌판 한가운데 주저앉아서
		        </p><p>두 볼이 비자웁게 해 같은 능금을 나는 먹는다.</p>
             <%}else if(poetTitle.equals("greengrape")){ %>
             	<h2>청포도</h2>
		        <p>내 고장 七月은
		        </p><p>청포도가 익어가는 시절
		        </p><p> 
		        </p><p>이 마을 전설이 주저리 주저리 열리고
		        </p><p>먼데 하늘이 꿈꾸려 알알이 들어와 박혀
		        </p><p> 
		        </p><p>하늘 밑 푸른 바다가 가슴을 열고
		        </p><p>흰 돛단 배가 곱게 밀려서 오면
		        </p><p> 
		        </p><p>내가 바라는 손님은 고달픈 몸으로
		        </p><p>靑袍를 입고 찾아 온다고 했으니
		        </p><p> 
		        </p><p>내 그를 맞아 이 포도를 따 먹으면
		        </p><p>두 손은 함뿍 적셔도 좋으련
		        </p><p> 
		        </p><p>아이야 우리 식탁엔 은 쟁반에
		        </p><p>하이얀 모시 수건을 마련해 두렴</p>
             <%}else if(poetTitle.equals("peak")){ %>
             	<h2>절정</h2>
		        <p>매운 季節의 챗죽에 갈겨
		        </p><p>마츰내 北方으로 휩쓸려오다
		        </p><p> 
		        </p><p>하늘도 그만 지쳐 끝난 高原
		        </p><p>서리빨 칼날진 그우에서다
		        </p><p> 
		        </p><p>어데다 무릎을 꾸러야하나?
		        </p><p>한발 재겨디딜 곳조차 없다
		        </p><p> 
		        </p><p>이러매 눈깜아 생각해볼밖에
		        </p><p>겨울은 강철로된 무지갠가보다.</p>
             <%}else if(poetTitle.equals("field")){ %>
             	<h2>광야</h2>
		        <p>까마득한 날에
		        </p><p>하늘이 처음 열리고
		        </p><p>어데 닭 우는 소리 들렷스랴
		        </p><p> 
		        </p><p>모든 山脉들이
		        </p><p>바다를 戀慕해 휘달릴때도
		        </p><p>참아 이곧을 犯하든 못하였으리라
		        </p><p> 
		        </p><p>끈임없는 光陰을
		        </p><p>부지런한 季節이 픠여선 지고
		        </p><p>큰 江물이 비로소 길을 연엇다
		        </p><p> 
		        </p><p>지금 눈 나리고
		        </p><p>梅花香氣 홀로 아득하니
		        </p><p>내 여기 가난한 노래의 씨를 뿌려라
		        </p><p> 
		        </p><p>다시 千古의 뒤에
		        </p><p>白馬타고 오는 超人이 있어
		        </p><p>이 曠野에서 목노아 부르게하리라</p>
             <%}else if(poetTitle.equals("twilight")){ %>
             	<h2>황혼</h2>
		        <p>내 골방의 커-텐을 것고
		        </p><p>정성된 맘으로 黃昏을마저드리노니
		        </p><p>바다의 힌갈메기들 갓치도
		        </p><p>人間은 얼마나 외로운것이냐
		        </p><p> 
		        </p><p>黃昏아 네 부드러운 손을 힘내미라
		        </p><p>내 뜨거운 입술을 맘대로 맛추어보련다
		        </p><p>그리고 네품아에 안긴 모-든것에
		        </p><p>나의 입술을 보내게 해다오
		        </p><p> 
		        </p><p>저-十二星座의 반ㅅ작이는 별들에게도
		        </p><p>鍾소리저문 森林속 그윽한 修女들에게도
		        </p><p>쎄멘트 장판우 그만흔 囚人들에게도
		        </p><p>의지할 가지업는 그들의 心臟이얼마나 떨고잇슬가
		        </p><p> 
		        </p><p>『고비』沙漠을 끈어가는 駱駝탄 行商隊에게나
		        </p><p>『아푸리카』 綠陰속 할쏘는 『인데안』에게라도
		        </p><p>黃昏아 네부드러운 품안에안기는 동안이라도
		        </p><p>地球의 半만을 나의타는 입술에 맛겨다오
		        </p><p> 
		        </p><p>내 五月의 골방이아늑도 하오니
		        </p><p>黃昏아 來日도 저-푸른 커-텐을 것게하겟지
		        </p><p>情情이 살어지긴 시내물 소리갓해서
		        </p><p>한번 식어지면 다시는 도라올줄 모르나부다</p>
             <%}else if(poetTitle.equals("notitle")){ %>
             	<h2>무제</h2>
		        <p>비올가 바란마음 그마음 지난 바램
		        </p><p>하로가 열흘같이 기약도 아득해라
		        </p><p>바라다 지친이넋을 잠재올가하노라
		        </p><p>
		        </p><p>잠조차 업는 밤에 燭태워 안젓으니
		        </p><p>리별에 病든몸이 나을길 없오매라
		        </p><p>저달 상기보고가오니 때로 볼가 하노라</p>
             <%}else if(poetTitle.equals("prologue")){ %>
             	<h2>서시</h2>
				<p>죽는 날까지 하늘을 우러러
				</p><p>한 점 부끄럼이 없기를,
				</p><p>잎새에 이는 바람에도
				</p><p>나는 괴로워했다.
				</p><p>별을 노래하는 마음으로
				</p><p>모든 죽어 가는 것을 사랑해야지
				</p><p>그리고 나한테 주어진 길을
				</p><p>걸어가야겠다.
				</p><p> 
				</p><p>오늘 밤에도 별이 바람에 스치운다.</p>
             <%}else if(poetTitle.equals("cross")){ %>
             	<h2>십자가</h2>
		        <p>쫓아오던 햇빛인데,
		        </p><p>지금 교회당 꼭대기
		        </p><p>십자가에 걸리었습니다.
		        </p><p> 
		        </p><p>첨탑(尖塔)이 저렇게도 높은데,
		        </p><p>어떻게 올라갈 수 있을까요.
		        </p><p> 
		        </p><p>종 소리도 들려오지 않는데
		        </p><p>휘파람이나 불며 서성거리다가,
		        </p><p> 
		        </p><p>괴로웠던 사나이,
		        </p><p>행복한 예수 그리스도에게
		        </p><p>처럼
		        </p><p>십자가가 허락된다면
		        </p><p> 
		        </p><p>모가지를 드리우고
		        </p><p>꽃처럼 피어나는 피를
		        </p><p>어두워 가는 하늘 밑에
		        </p><p>조용히 흘리겠습니다.</p>
             <%}else if(poetTitle.equals("night")){ %>
             	<h2>별 헤는 밤</h2>
		        <p>계절이 지나가는 하늘에는
		        </p><p>가을로 가득 차 있습니다.
		        </p><p> 
		        </p><p>나는 아무 걱정도 없이
		        </p><p>가을 속의 별들을 다 헤일 듯합니다.
		        </p><p> 
		        </p><p>가슴 속에 하나 둘 새겨지는 별을
		        </p><p>이제 다 못 헤는 것은
		        </p><p>쉬이 아침이 오는 까닭이요,
		        </p><p>내일 밤이 남은 까닭이요,
		        </p><p>아직 나의 청춘이 다하지 않은 까닭입니다.
		        </p><p> 
		        </p><p>별 하나에 추억과
		        </p><p>별 하나에 사랑과
		        </p><p>별 하나에 쓸쓸함과
		        </p><p>별 하나에 동경과
		        </p><p>별 하나에 시와
		        </p><p>별 하나에 어머니, 어머니,
		        </p><p> 
		        </p><p>어머님, 나는 별 하나에 아름다운 말 한마디씩 불러 봅니다. 소학교 때 책상을 같이 했던 아이들의 이름과, 패, 경, 옥, 이런 이국 소녀들의 이름과, 벌써 아기 어머니 된 계집애들의 이름과, 가난한 이웃 사람들의 이름과, 비둘기, 강아지, 토끼, 노새, 노루, '프랑시스 잠', '라이너 마리아 릴케' 이런 시인의 이름을 불러 봅니다.
		        </p><p>  
		        </p><p>이네들은 너무나 멀리 있습니다.
		        </p><p>별이 아스라이 멀듯이.
		        </p><p> 
		        </p><p>어머님,
		        </p><p>그리고 당신은 멀리 북간도에 계십니다.
		        </p><p> 
		        </p><p>나는 무엇인지 그리워
		        </p><p>이 많은 별빛이 내린 언덕 위에
		        </p><p>내 이름자를 써 보고
		        </p><p>흙으로 덮어 버리었습니다.
		        </p><p> 
		        </p><p>따는 밤을 새워 우는 벌레는
		        </p><p>부끄러운 이름을 슬퍼하는 까닭입니다.
		        </p><p> 
		        </p><p>그러나 겨울이 지나고 나의 별에도 봄이 오면
		        </p><p>무덤 위에 파란 잔디가 피어나듯이
		        </p><p>내 이름자 묻힌 언덕 위에도
		        </p><p>자랑처럼 풀이 무성할 거외다.</p>
             <%}else if(poetTitle.equals("confession")){ %>
             	 <h2>참회록</h2>
		        <p>파란 녹이 낀 구리 거울 속에
		        </p><p>내 얼굴이 남아 있는 것은
		        </p><p>어느 왕조의 유물이기에
		        </p><p>이다지도 욕될까.
		        </p><p>
		        </p><p>나는 나의 참회의 글을 한 줄에 줄이자.
		        </p><p>― 만 이십사 년 일 개월을
		        </p><p>무슨 기쁨을 바라 살아왔던가.
		        </p><p>
		        </p><p>내일이나 모레나 그 어느 즐거운 날에
		        </p><p>나는 또 한 줄의 참회록을 써야 한다.
		        </p><p>― 그때 그 젊은 나이에
		        </p><p>왜 그런 부끄런 고백을 했던가.
		        </p><p>
		        </p><p>밤이면 밤마다 나의 거울을
		        </p><p>손바닥으로 발바닥으로 닦아 보자.
		        </p><p>
		        </p><p>그러면 어느 운석 밑으로 홀로 걸어가는
		        </p><p>슬픈 사람의 뒷모양이
		        </p><p>거울 속에 나타나 온다.</p>
             <%}else if(poetTitle.equals("toeasy")){ %>
             	 <h2>쉽게 씌어진씨</h2>
		       <p>窓밖에 밤비가 속살거려
		       </p><p>六疊房은 남의 나라、
		       </p><p>
		       </p><p>詩人이란 슬픈 天命인줄 알면서도
		       </p><p>한줄 詩를 적어 볼가、
		       </p><p>
		       </p><p>땀내와 사랑내 포근히 품긴
		       </p><p>보내주신 學費封套를 받어
		       </p><p>
		       </p><p>大學 노ー트를 끼고
		       </p><p>늙은 敎授의 講義 들으러 간다。
		       </p><p>
		       </p><p>생각해 보면 어린때 동무를
		       </p><p>하나、둘、 죄다 잃어 버리고
		       </p><p>
		       </p><p>나는 무얼 바라
		       </p><p>나는 다만、홀로 沈澱하는 것일가?
		       </p><p>
		       </p><p>人生은 살기 어렵다는데
		       </p><p>詩가 이렇게 쉽게 씨워지는 것은
		       </p><p>부끄러운 일이다。
		       </p><p>
		       </p><p>六疊房은 남의 나라、
		       </p><p>窓밖에 밤비가 속살거리는데、
		       </p><p>
		       </p><p>등불을 밝혀 어둠을 조곰 내몰고、
		       </p><p>時代처럼 올 아침을 기다리는 最後의 나、
		       </p><p>
		       </p><p>나는 나에게 적은 손을 내밀어
		       </p><p>눈물과 慰安으로 잡는 最初의 握手。</p>
            <%} %>
            </div>
            <div class="card-body">
              <h3 class="text-end">감상 후기</h3>
              <%
              	if(session.getAttribute("id") != null){%>
              		<form action="addreview" method="post" name="reviewForm">
		              	<p class="text-end" ><input type="submit" value="후기등록"></p>
		              	<p class="text-end" ><input type="hidden" name="poetTitle" value="<%=poetTitle%>"></p>
		              	<p class="text-end"><input type="text" name="review"  id="reviewWriter" required="required" size=50></p>
		             </form>
              	<%}else{%>
              		<p class="text-end" ><input type="button" value="후기등록" onclick="location.href='login.html'"></p>
              	<%}%>
              	
	              <table class="table">
	              <%
	              ReviewDAO dao=new ReviewDAO();
	      			ArrayList<ReviewVO> reviewlist=dao.listView(poetTitle);
	              	Iterator voIterator=reviewlist.iterator();
	              	while(voIterator.hasNext()){
	              		ReviewVO reviewDater=(ReviewVO)voIterator.next(); %>
	                <tr>
	                	<td class="row">
		                	<table class="col">
		                		<tr>
		                			<td class="text-start"><%=reviewDater.getId() %></td><td class="text-end"><%=reviewDater.getWriteDate() %></td>
		                		</tr>
		                		<tr><td colspan="2" class="text-center"><%=reviewDater.getReview() %><td></tr>
		                	</table>
	                	</td>
	                </tr>
	                <%} %>
	              </table>
             	
            </div>
        </div>
      </div>
  </article>
  </article>
  <div class="text-end m-1"><a href="./notice.html" class="btn btn-primary disabled" role="button" aria-disabled="true">공지사항</a></div>
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