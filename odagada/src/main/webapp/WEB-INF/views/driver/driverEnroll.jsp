<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<%
	Member m = (Member) session.getAttribute("logined");
	
%>
​<style>
     div#enroll-container{width:400px; margin:0 auto; text-align:center;}
     div#enroll-container input, div#enroll-container select {margin-bottom:10px;}

    /*중복아이디체크관련*/
    div#enroll-container{position:relative; padding:0px;}
    div#enroll-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.ok{color:green;}
    div#enroll-container span.error{color:red;}
    
    div#board-continer{width:400px;margin:0 auto; text-align:center}
    div#board-continer input{margin-bottom:15px;} 


   .profile{
   margin-left:13px;
   margin-right:13px;
   }
   
   .submitB{
   margin-top:5%;
   margin-left:30%;
   margin-bottom: 10%;
   }
   
   #enrollBtn{
   margin-right:15%; 
   }


   li { list-style: none }
  
  	li.li_pass{
  		font-size:14px;
  		margin-top:-10px;
  		margin-left:-10px;
  	}
  	p{
  	font-size:13px;
  	}
  	.passwordInfo{
  	height:40px;
  	}
  	
  	#memberId,#memberName,#birth{
  		width : 75%;
  	}
  	
  	label {
  		text-align: left;
  		padding-left : 0px;
  	}

  	#selectPhone{
  		width: 25%;
  	}
  	#phone2 {
  		width: 50%;
  	}
  	#label_id {
  		padding-left: 0px;
  	}
  	#label_name{
  		padding-left: 0px;
  	}
  	#label_tel{
  		padding-left: 0px;
  	}
  	#label_birth{
  		padding-left: 0px;
  	}

    </style>
    
     
<script>
 $(function(){
   $('[name=upFile]').on('change',function(){
      //var filename=$(this).val();
      var filename=this.files[0].name;
      //var filename=$(this).prop('files')[0].name;
      $(this).next('.custom-file-label').html(filename);
   });
              
   //핸드폰 숫자만 입력받게 하는 함수    
   $('#phone2').on('keyup', function() {
      if (/\D/.test(this.value)) {
         this.value = this.value.replace(/\D/g, '')
         alert('숫자만 입력가능합니다.');
      }
   });
 });
 function validate() {
      //핸드폰 유효성 검사 
      var regExp = /([0-9]{7,8})$/;
      if (!regExp.test($("input[name=phone2]").val())) {
            alert("정확한 휴대폰 번호를 입력해주세요.");
            return false;
         }
      //자동차 사진 필수 입력
      var file_name = $('.custom-file-label').val();
      if(file_name == null){
    	  alert('자동차 사진을 첨부해주세요.');
    	  return false;
      }
      //자동차모델
      var carModelExp = /[ㄱ-ㅎ가-힣A-Za-z]/g;
      if(!carModelExp.test($("input[name=carModel]").val())){
    	  alert("자동차모델은 한글/영어만 입력해주세요");
    	  return false;
      }
      
      var file_name2=$('.custom-file-label').val();
      
      var licenseNum = $('#licenseNum').val();
      var incenseCon = licenseNum.substring(0,2);
      var licen = /([가-힣]|[0-9]){2}-{1}([0-9]{2})-{1}([0-9]){6}-{1}([0-9]){2}$/
      console.log("licenseNum");
      console.log($("input[name=licenseNum]").val());
      console.log(licen.test($("input[name=licenseNum]").val()));
      if(!licen.test($("input[name=licenseNum]").val())){
    	  alert("정확한 면허번호를 입력해주세요.");
    	  
    	  return false;
      }

      var carNum = $('#carNum').val();
      var carNumTest = /[0-9]{2} [가-힣]{1} [0-9]{4}/g;
      
      if(!carNumTest.test($("input[name=carNum]").val()))
    	  {
    	  	alert("정확한 자동차번호를 입력해주세요");
    	  	return false;
    	  }
      
      console.log(carNumTest.test($("input[name=carNum]").val()));
      
      
   }
   //프로필 사진을 이미지 타입 파일로만 받기
   function fileCheck(obj){
      var fileKind=obj.value.lastIndexOf('.');
      var fileName=obj.value.substring(fileKind+1, obj.length);
      var fileType=fileName.toLowerCase();
      
      var ckFileType=new Array();
      ckFileType=['jpg','gif','png','jpeg','jpeg','bmp'];
      
      if(ckFileType.indexOf(fileType)==-1){
         alert("이미지 파일만 선택할 수 있습니다.");
         var parentObj=obj.parentNode;
         var node=parentObj.replaceChild(obj.cloneNode(true), obj);
         return false;      
         }
      }
   

</script>
   	<div class="col-6 col-md-6 offset-md-3" style="text-align: center; font-weight: bold;">
		<br><br>
	      <h2>드라이버 신청</h2>
	   <br>
	</div>  
      <div id="enroll-container" class="container">
         <form name="driverEnrollFrm" action="${path }/driver/driverEnrollEnd" method="post" onsubmit="return validate();" enctype="multipart/form-data">
           
            <div class="form-group row">            		
           		<label for="memberId" class="col-sm-3 col-form-label" id="label_id">아이디</label>
           		<input type="text" class="form-control" name="memberId" id="memberId" maxlength="12" value="${logined.memberId }" readonly required>
            </div>
             <div class="form-group row">
             	<label for="memberName" class="col-sm-3 col-form-label" id="label_name">이름</label>
           		<input type="text" class="form-control" value="${logined.memberName}" name="memberName" id="memberName" readonly required>
             </div>
             <div class="form-group row">          		
           		<label for="memberName" class="col-sm-3 col-form-label" id="label_birth">생년월일</label>
           		<input type="text" class="form-control" value="${logined.birth}" name="birth" id="birth" readonly required>
            </div>
			<div class="form-group row">                  
                 <label for="memberName" class="col-sm-3 col-form-label" id="label_tel">전화번호</label>                 
                  <c:set var="phone" value="${logined.phone}"/>
                     <select class="tel" name="phone1" id="selectPhone" required>                                                                                        
                        <option  value="010" <c:if test="${fn:contains(fn:substring(phone,0,3),'010')}">selected</c:if>  >010</option>
                        <option  value="011" <c:if test="${fn:contains(fn:substring(phone,0,3),'011')}">selected</c:if>>011</option>
                        <option  value="016" <c:if test="${fn:contains(fn:substring(phone,0,3),'016')}">selected</c:if>>016</option>
                        <option  value="017" <c:if test="${fn:contains(fn:substring(phone,0,3),'017')}">selected</c:if>>017</option>
                        <option  value="018" <c:if test="${fn:contains(fn:substring(phone,0,3),'018')}">selected</c:if>>018</option>
                        <option  value="019" <c:if test="${fn:contains(fn:substring(phone,0,3),'019')}">selected</c:if>>019</option>         
                        <option  value="070" <c:if test="${fn:contains(fn:substring(phone,0,3),'070')}">selected</c:if>>070</option> 
                     </select>
                     <c:if test="${fn:length(phone) eq 11}">
                      <input type="text" class="tel" name="phone2" id="phone2" value="${fn:substring(phone, 3,12)}"required>
                    </c:if>
                    <c:if test="${fn:length(phone) eq 10}">
                      <input type="text" class="tel" name="phone2" id="phone2" value="${fn:substring(phone, 3,11)}"required>
                    </c:if>
            </div>
            <div class="form-group row">      		
           		<input type="text" class="form-control" name="licenseNum" id="licenseNum" onchange="licenseCheck(this)" placeholder="운전면허번호(AA-BB-CCCCCC-DE)" required/>
            </div>
            <div class="form-group row">            		
           		<input type="text" class="form-control" name="carModel" id="carModel" placeholder="자동차 모델(ex.페라리)" required/>
            </div>
            <div class="form-group row">            		
           		<input type="text" class="form-control" name="carNum" id="carNum" placeholder="자동차 번호(ex. 28 루 4454)"required/>
            </div>
            <div class="form-group row">            		
           		<input type="text" class="form-control" name="driver_info" id="driver_info" placeholder="드라이버 자기소개 입력해주세요."required/>

            </div>
	       	 <div class="custom-file form-group row">
	               <input multiple="multiple" type="file" class="custom-file-input" accept="image/*" name="upFile" id="upFile1" onchange="fileCheck(this)" required>
	               <label class="custom-file-label profile" for="upFile1">자동차 사진</label>
	          </div>

   
                <br/>
                <div class="row submitB">
                	<input type="hidden" name="memberNum" value="${logined.memberNum}"/>
                  <input type="submit" class="btn btn-outline-success" id="enrollBtn" value="가입" >&nbsp;
                  <input type="reset" class="btn btn-outline-success" value="취소">
               </div>
            </form>
         </div>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​