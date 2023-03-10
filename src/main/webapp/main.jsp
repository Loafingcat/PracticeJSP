<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 컴퓨터 폰 해상도에 맞게 디자인 변경되는 반응형 웹 메타태그 -->
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- css폴더 안의 bootstrap.css를 참조해서 홈페이지 디자인을 사용하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 새로 파일을 만들어 작성한 'css' 파일을 참조하는 링크 -->
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 네비게이션 영역 -->
	<nav class="navbar navbar-default">
		<!-- 헤더 영역 홈페이지 로고 등을 담당 -->
		<div class="navbar-header">
		<!-- 네비게이션 상단 박스 영역 -->
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
				data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- 세 줄 버튼 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="botton" aria-haspopup="ture"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>	
			</ul>
			<%
				} else {				
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="botton" aria-haspopup="ture"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>	
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!-- 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>이 웹사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. 최소한의 간단한 로직만 이용해서 개발했습니다
					디자인 템플릿으로는 부트스트랩을 이용했습니다.</p>
					<p><a class="btn btn-primary btn-pull" href='#' role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	<!-- 메인 페이지 이미지 삽입 영역 -->
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- 순서가 있는 항목이니 ol 사용 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 실질적으로 이미지가 들어가는 부분 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<!-- 버튼 부분 -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<!-- 메인 페이지 끝 -->
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>