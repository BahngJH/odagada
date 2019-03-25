<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<style>
	div#enroll-container{width:400px; margin:0 auto; text-align:center;}
	div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	#enroll-form{margin-top:20%;}
	.submitB{margin-bottom:10%; margin-top:8%;}
	.find-div{padding-right:0%;}
	.cancle-div{padding-left:0%;}
	#memberId_{margin-top:5%;} 
	p{font-size:13px; margin-bottom:7px;}
	.info{margin:1%; margin-top:10%;}
	#mail-a{font-size:13px; text-align:left;}
</style>
    
<script>
$(function(){
  	//아이디  숫자,영소문자만 입력 가능하게 하는 함수      
    $("#memberId").keyup(function(event) {
       if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
          var inputVal = $(this).val();
          $(this).val(inputVal.replace(/[^a-z0-9]{2,6}/gis, ''));
       }
    });   	
  });
    
function validate(){
 	//ID 4자리~12자리 소문자, 숫자 가능 확인하기 
    var idReg =/^[A-Za-z0-9]{4,12}$/;
    if (!idReg.test($("#memberId").val())) {
       alert("아이디는 영문자 또는 숫자  4~12자리로 입력해주세요.");
       return false;
    }
    //이름 유효성 검사
    var name=$('#memberName').val().trim();
    if(name.length>7){
       alert("정확한 이름을 입력해주세요.");
       return false;
 	 }
   	     
	//이메일 유효성 검사
	var ckMail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!ckMail.test($("#email").val())){
		alert("정확한 이메일 형식을 입력해주세요.");	
		return false;
	}
}
    
</script>
    
   <div id="enroll-container">
         <form name="memberEnrollFrm" id="enroll-form" action="${path }/member/findPw.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
	      	<h3>패스워드 찾기</h3>
            <div class="row info">  
    			<p class="badge badge-secondary">등록된 회원 정보로 찾기</p>
				<p>등록한 아이디, 이름, 이메일 주소로 비밀번호를 재설정 합니다.</p>
            </div>
            <input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" maxlength="7" required>
            <input type="text" class="form-control" placeholder="아이디 " name="memberId" id="memberId" maxlength="12" required>                   
            <input type="text" class="form-control" placeholder="등록한 이메일" name="email" id="email" maxlength="25" required>                    
                <br/>
            <div class="row submitB">
            	<div class="col-6 find-div"> 
              		<input type="submit" class="btn btn-success" value="임시비밀번호 발급" >
              	</div>
              	<div class="col-6 cancle-div">	
              		<input type="reset" class="btn btn-outline-success" value="취소 ">
           		</div> 
           </div>
         </form>
    </div>
         

      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>