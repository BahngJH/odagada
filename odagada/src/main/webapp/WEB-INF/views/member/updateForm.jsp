<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
    String eDate []=m.getEnrollDate().split(" ");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>



  <style>
     div#enroll-container{width:400px; margin:0 auto; text-align:center;}
     div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
   
    div#board-continer{width:400px;margin:0 auto; text-align:center}
    div#board-continer input{margin-bottom:15px;} 
    
    
    /*비밀번호 체크 */
    div#enroll-container span.ck {display:none;font-size: 12px;position:absolute; top:58px; right:10px;}
    div#enroll-container span.ckOk{color:green;}
    div#enroll-container span.ckNo{color:red;}
    
    .ckOk, .ckNo{padding-right:13px; }
    .phone{margin-left:0; margin-right:0;}
    #pro_img{width: 180px; height: auto;}
       
    </style>
    
     
<script>

 $(function(){
	 //파일 업로드 함수
   $('[name=upFile]').on('change',function(){
        var filename=this.files[0].name;
   		var fileReader = new FileReader();
 	
 		fileReader.readAsDataURL(this.files[0]);
 		fileReader.onload = function(e){
	 		var result = e.target.result;	
	 		$('#pro_img').attr('src',result); 		
 		};

      $(this).next('.custom-file-label').html(filename);
   });  
  
   //프로필 사진 클릭시 파일 업로드 가능하게 하는 이벤트.
	$('#pro_img').on('click', function() {
			$('#upFile').trigger('click');			
		})	 
});

	//비밀번호 유효성 검사
	function passwordCheck(password) {
		var pw = $(password).val();
		var ckPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
		if (!ckPw.test(pw)) {
			alert('숫자,영문자,특수문자 조합으로 6~15자');
			$('#password_').val('').focus();
			return false;
		}
		return true;
	}

	$(function() {	
	    //비밀번호 일치 확인
        $('#password2').keyup(function(){
           var pw1=$("#password1").val().trim();
           var pw2=$("#password2").val().trim();
           if(pw2.length<1){
              $(".ck").hide();
              return;
           }
           if(pw1==pw2){
              $(".ck.ckOk").show();
              $(".ck.ckNo").hide();
           }else{
              $(".ck.ckOk").hide();
              $(".ck.ckNo").show(); 
           }
        });
		

		//이메일(아이디부분) 알파벳만 입력 받게 하기    
		$("#email1").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});

	});

	function validate() {
		//핸드폰 유효성 검사 
		var regExp = /([0-9]{7,8})$/;
		var ck = /^\d{3}-\d{3,4}-\d{4}$/;

		if (!regExp.test($("input[name=phone2]").val())) {
			alert("정확한 휴대폰 번호를 입력해주세요.");
			return false;
		}
		
		//이메일 유효성 검사
		var ckMail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!ckMail.test($("input[name=email]").val())){
			alert("정확한 이메일 형식을 입력해주세요.");	
			return false;
		}		
		//비밀번호 체크 
		var pw1 = $("#password1").val().trim();
		var pw2 = $("#password2").val().trim();
		if (pw1 != pw2) {
			alert("정확한 비밀번호 입력하세요.");
			return false;
		}
		return true;
	}

	//프로필 사진을 이미지 타입 파일로만 받기
	function fileCheck(obj) {
		var fileKind = obj.value.lastIndexOf('.');
		var fileName = obj.value.substring(fileKind + 1, obj.length);
		var fileType = fileName.toLowerCase();

		var ckFileType = new Array();
		ckFileType = [ 'jpg', 'gif', 'png', 'jpeg', 'jpeg', 'bmp' ];

		if (ckFileType.indexOf(fileType) == -1) {
			alert("이미지 파일만 선택할 수 있습니다.");
			var parentObj = obj.parentNode;
			var node = parentObj.replaceChild(obj.cloneNode(true), obj);
			return false;
		}
	}
</script>
      <div id="enroll-container">
         <form name="memberEnrollFrm" id="memberEnrollFrm" action="${path }/member/updateInfoEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">         
       		<div class="row">
       			<div class="col-6">
		           <div class="custom-file" >
		           		<img class="card-img-top" id="pro_img" src="${path }/resources/upload/profile/${logined.profileImageRe}" alt="Card image cap">
	   		    	    <input type="file" class="custom-file-input"  accept="image/*" id="upFile" name="upFile" onchange="fileCheck(this)" required>
		           </div>
		         </div> 
	           <div class="col-6">           			                                
       			  <input type="password" class="form-control" placeholder="새 비밀번호" name="memberPw" id="password1" onchange="passwordCheck(this)" maxlength="15" required>                              
                  <input type="password" class="form-control" placeholder="새 비밀번호확인" id="password2" maxlength="15" required>
                  <span class="ck ckOk">비밀번호 일치</span>
                  <span class="ck ckNo">비밀번호 불일치</span>                      	          			
       			  <input type="email" class="form-control" value="${logined.email }" name="email" maxlength="15" required>
                  <div class="row phone">
	                  <c:set var="phone" value="${logined.phone}"/>
	                     <select class="tel form-control col-sm-5" name="phone1" id="selectPhone" required>                                                                                        
	                        <option  value="010" <c:if test="${fn:contains(fn:substring(phone,0,3),'010')}">selected</c:if>>010</option>
	                        <option  value="011" <c:if test="${fn:contains(fn:substring(phone,0,3),'011')}">selected</c:if>>011</option>
	                        <option  value="016" <c:if test="${fn:contains(fn:substring(phone,0,3),'016')}">selected</c:if>>016</option>
	                        <option  value="017" <c:if test="${fn:contains(fn:substring(phone,0,3),'017')}">selected</c:if>>017</option>
	                        <option  value="018" <c:if test="${fn:contains(fn:substring(phone,0,3),'018')}">selected</c:if>>018</option>
	                        <option  value="019" <c:if test="${fn:contains(fn:substring(phone,0,3),'019')}">selected</c:if>>019</option>         
	                        <option  value="070" <c:if test="${fn:contains(fn:substring(phone,0,3),'070')}">selected</c:if>>070</option> 
	                     </select>
	                   
	                     <c:if test="${fn:length(phone) eq 11}">
	                		<input type="text" class="tel form-control col-sm-7" name="phone2" id="phone2" value="${fn:substring(phone, 3,12)}"required>
	           			</c:if>
	           			<c:if test="${fn:length(phone) eq 10}">
	                		<input type="text" class="tel form-control col-sm-7" name="phone2" id="phone2" value="${fn:substring(phone, 3,11)}"required>
	           			</c:if> 
	           	 </div>
                  <input type="submit" class="btn btn-outline-success" id="enrollBtn" value="정보변경" >&nbsp;
                  <input type="reset" class="btn btn-outline-success" value="취소">
               </div>
             </div> 
          </form>
       </div>


   



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>