<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/loginFile/style.css">
	<!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<style>
	#easyLogin{
		text-align: center;
		margin-bottom:30px;
	}
	div#naverIdLogin > a#naverIdLogin_loginButton > img{
   	width: 222px;
   	height: 49px;
	}
	#naverIdLogin{
		margin-top:20px;
	}
	</style>

<body>
    <form  action="${path }/member/login.do" method="post" style="margin-top: 150px;">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <input id="tt" type="text" name="memberId" placeholder="아이디를 입력하세요">
        <input type="password" name="memberPw" placeholder="패스워드">
        <input type="submit" value="로그인">
        <span class="searchAccount"><a href="${path}/member/signUp.do">회원가입</a> | <a href="${path}/member/findId">아이디 찾기</a> | <a href="${path}/member/findPw">비밀번호 찾기</a></span>
    </form>
    <!-- 간편로그인 배너 -->
	<div id="easyLogin">
	
		<div id="kakaoLogin">  
		    <a id="kakao-login-btn"></a>
		    <a href="http://developers.kakao.com/logout"></a>
		</div>
		<div id="naverIdLogin"></div>
	</div>    
	<script src="${pageContext.request.contextPath }/resources/loginFile/script.js"></script>

	<!-- 카카오 스크립트문 -->
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
                  
                  kakaoId = res.id;
                  kakaoName=JSON.stringify(res.properties.nickname);
                  
                  $.ajax({
                	  url:"${path}/member/kakaoIdCK",
                	  data:{"kakaoId":kakaoId,"kakaoName":kakaoName},
                	  success:function(data){
                		  console.log(data);
                		  if(data.result=="N")
                		  {
                			 location.href='${path}/member/kakaoLogin.do?kakaoId='+kakaoId+'&kakaoName='+kakaoName;
                		  		
                		  }else
                		  {
                			 location.href='${path}/';
                		  } 
                		  
                	  }
                  });
              
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
	
	<!-- 네이버 간편 로그인 스크립트 -->
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

	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>