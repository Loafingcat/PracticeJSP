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
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//아이디 중복 체크 여부 및 중복 여부 기록
	var count = 0; //0은 중복 체크를 하지 않은 상태, 중복된 상태
	               //1은 중복 체크를 한 결과 중복되지 않은 상태
	
	//이벤트 연결               
	$('#chk').click(function(){
		if($('#userID').val()==''){
			alert('아이디를 입력하세요.');
			$('#userID').focus();
			return;
		}
		
		$.ajax({
			url:'confirm.jsp',//요청할 URL
			type:'POST', //메소드 방식
			data:{id:$('#userID').val()},//전송할 데이터
			dataType:'JSON',//전달받을 데이터 타입
			success:function(param){//성공 시 실행할 함수
				if(param.result == 'idDuplicated'){ //아이디 중복된 경우
					count = 0;
					$('#id_signed').text('이미 등록된 아이디입니다.').css('color','red');
					$('#userID').val('').focus();
				}else if(param.result == 'idNotFound'){
					count = 1;
					$('#id_signed').text('사용 가능한 아이디입니다.').css('color','green');
				}else{
					count = 0;
					alert('오류 발생');
				}
			},
			error:function(){//오류 시 실행할 함수
				count = 0;
				alert('네트워크 오류 발생');
			}
		});
		
	});          
	               
	$('#insert_form #userID').keydown(function(){
		$('#id_signed').text('');
		count = 0;
	});
	
	$('#insert_form').submit(function(){
		if($('#userID').val()==''){
			alert('아이디를 입력하세요.');
			$('#userID').focus();
			return false;
		}
		
		if(count == 0){
			alert('아이디 중복체크 필수');
			return false;
		}
	});
	
});
</script>


</head>
<body>
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
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="botton" aria-haspopup="ture"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<!-- 드랍다운 아이템 영역 -->
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li class="active"><a href="join.jsp">회원가입</a></li>
						</ul>
				</li>	
			</ul>		
		</div>
	</nav>
	<!-- 로그인 양식 -->
	<div class="container">  <!-- 하나의 영역 생성 -->
		<div class="col-lg-4">	<!-- 영역의 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스다 -->
			<div class="jumbotron" style="padding-top: 20px;">
			<!-- post는 회원가입이나 로그인 같이 어떠한 정보를 숨기면서 보낼 떄 사용하는 메소드 -->
				<form method="post" action="joinAction.jsp" id="insert_form">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="content_title">아이디</div>
					<div class="content_content">
						<input type="text" class="form-control" placeholder="아이디" name="userID" id="userID" maxlength="20">
						<div style="width: 100px;"><button class="btn btn-primary" id="chk" type="button">중복체크</button>
						<span id="id_signed"></span>
					</div>
					</div>
					<div class="content_title">비밀번호</div>
					<div class="content_content">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" id="userPassword" maxlength="20">
					</div>
					<div class="content_title">비밀번호 확인</div>
					<div class="content_content">
						<input type="password" class="form-control" placeholder="비밀번호 확인" name="userPassword2" id="userPassword2" maxlength="20">
						
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <!-- 액티브는 미리 버튼이 활성되 되어있게 하는 것 -->
								<input type="radio" name="userGender" autocomplete="off" value="남자">남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>