<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>

@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
/* background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');*/
background-size: cover;
background-repeat: no-repeat;
height: 100%; 
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}



</style>


<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form action="${path }/member/login.do" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="memberId" placeholder="아이디">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="memberPw" placeholder="비밀번호">
					</div>
					<!-- <div class="row align-items-center remember">
						<input type="checkbox">내 정보 기억하기
					</div> -->
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
				아이디가 없으신가요?<a href="${pageContext.request.contextPath}/o/signUp.do">회원가입</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="${path}/member/findId">ID 잊으셨나요? ID찾기</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="${path}/member/findPw">비밀번호를 잊으셨나요? 비밀번호찾기</a>
				</div>
			</div>
		</div>
	</div>

<!-- 	<div id="kakaoLogin">  
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout"></a>
</div> -->
 
<script type='text/javascript'>
	var kakaoName="";
	var kakaoId="";
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('05f49b9ab4a2c1bc706682703a9c1bae');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
          
          //로그인 성공시, kakao API를 호출한다.(카카오에 있는 데이터 불러옴)
          Kakao.API.request({
              url: '/v2/user/me',
              success: function(res){
                  console.log(res);
                  console.log(res.id);
                  console.log(res.kakao_account);
                  console.log(JSON.stringify(res.properties.nickname));
                  
                  kakaoId=res.id;
                  kakaoName=JSON.stringify(res.properties.nickname);
                  location.href='${path}/member/kakaoLogin.do?kakaoId='+kakaoId+'&kakaoName='+kakaoName;     

              },
              fail: function(error){
                  alert(JSON.stringify(error));
              }
          });
         
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    
</script>  
	<div id="naverIdLogin">
	</div>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script>
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "vc3JlDx8OrM42I7Dhas4",
					callbackUrl: "http://localhost:9090/odagada/member/naverSignup",
					isPopup: false,
					loginButton: {color: "green", type: 3, height: 60}
					
				});
		naverLogin.init();
	</script>
</div>


      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>