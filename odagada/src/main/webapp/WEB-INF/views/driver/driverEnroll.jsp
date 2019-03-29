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
@font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-3Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }	
	h1{
		/* font-family : S-CoreDream-3Light; */
		font-family : silgothic;
		text-align: left;
		margin: 20px 0 20px 0;
	}
	.photo-backround{
		background-image: url(${pageContext.request.contextPath}/resources/images/driver.png);
		background-position: center center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 300px;
		margin-bottom: 30px;
		margin-top: 10px;
	}
	#tbl-board{
		margin-bottom: 30px;
	}
	a{
		color: black;
		text-decoration: none;
	}
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
  	
  	div#enroll-container{
  		font-family: S-CoreDream-3Light;
  	}
	#reCk1,#reCk2{
		display: none;
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
   
 });
 function validate() {
      //자동차 사진 필수 입력
      var file_name = $('.custom-file-label').val();
      if(file_name == null){
    	  alert('자동차 사진을 첨부해주세요.');
    	  return false;
      }
      
      //자동차모델
      var carModelExp = /^[가-힣a-zA-Z0-9\s]+$/;
      if(!carModelExp.test($("input[name=carModel]").val().trim())) {
    	  alert("자동차모델은 한글/영어만 입력해주세요");
    	  return false;
      }
      
      var file_name2=$('.custom-file-label').val();
      
	    if($("#licenseStatus").val()=='0'){
	    	
	    	alert("등록된 운전면허 번호입니다.");
	    	return false;
	    }
	    
	      if($("#carNumStatus").val()=='0'){
	    	  alert("등록왼 자동차 번호입니다.");
	    	  return false;
	      }
	      
	 console.log("자동차 번호"+carNum);
	 console.log("확인"+carNumStatus);

      
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
function liCk(){
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
     
     console.log("운전면허"+licenseNum);
	    $.ajax({
	    	url:"${path}/driver/checkLicense",
	    	data:{"licenseNum": licenseNum},
	    	success:function(data){
	    		console.log('sdssds:    '+data);
	    		if(data == "Y"){
	    			document.getElementById('licenseStatus').value='1';
	    			alert('올바른 운전면허 번호입니다.');
	    			$('#licenseNum').attr('readonly',true);
	    			$('#liCk1').css('display','none');
	    			$('#reCk1').css('display','block');
	    			return true;
	    		}else{
	    			 document.getElementById('licenseStatus').value='0';
	    			alert('등록된 운전면허 번호입니다.');
	    			return false;
	    		}
	    	}
	    });	
}
function carCk(){
	
	 var carNum = $('#carNum').val();
     var carNumTest = /[0-9]{2} [가-힣]{1} [0-9]{4}/g;
     if(!carNumTest.test($("input[name=carNum]").val()))
   	  {
   	  	alert("정확한 자동차번호를 입력해주세요");
   	  	return false;
   	  }
     
	 //자동차번호 중복확인
	  console.log("자동차 번호"+carNum);
	    $.ajax({
	    	url:"${path}/driver/checkCarNum",
	    	data:{"carNum": carNum},
	    	success:function(data){
	    		if(data == "Y"){
	    			document.getElementById('carNumStatus').value='1';
	    			alert('올바른 자동차 번호입니다.');
	    			$('#carNum').attr('readonly',true);
	    			$('#carCk1').css('display','none');
	    			$('#reCk2').css('display','block');
	    			return true;
	    		}else{
	    			 document.getElementById('carNumStatus').value='0';
	    			alert('등록된 자동차 번호입니다.');
	    			return false;
	    		}
	    	}
	    });	
}
function reCk(){
	document.getElementById('licenseStatus').value='0';
	document.getElementById('licenseNum').value='';
	$('#licenseNum').attr('disabled',false);
	$('#liCk1').css('display','block');
	$('#reCk1').css('display','none');
}
function reCkCar(){
	document.getElementById('carNumStatus').value='0';
	document.getElementById('carNum').value='';
	$('#carNum').attr('disabled',false);
	$('#carCk1').css('display','block');
	$('#reCk2').css('display','none');
}
</script>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">오다가다 드라이버 신청하기</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/driver.png">
</section>
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
                     <select class="tel" name="phone1" id="selectPhone"  disabled="disabled">                                                                                        
                        <option  value="010" <c:if test="${fn:contains(fn:substring(phone,0,3),'010')}">selected</c:if>  >010</option>
                        <option  value="011" <c:if test="${fn:contains(fn:substring(phone,0,3),'011')}">selected</c:if>>011</option>
                        <option  value="016" <c:if test="${fn:contains(fn:substring(phone,0,3),'016')}">selected</c:if>>016</option>
                        <option  value="017" <c:if test="${fn:contains(fn:substring(phone,0,3),'017')}">selected</c:if>>017</option>
                        <option  value="018" <c:if test="${fn:contains(fn:substring(phone,0,3),'018')}">selected</c:if>>018</option>
                        <option  value="019" <c:if test="${fn:contains(fn:substring(phone,0,3),'019')}">selected</c:if>>019</option>         
                        <option  value="070" <c:if test="${fn:contains(fn:substring(phone,0,3),'070')}">selected</c:if>>070</option> 
                     </select>
                     <c:if test="${fn:length(phone) eq 11}">
                      <input type="text" class="tel" name="phone2" id="phone2" value="${fn:substring(phone, 3,12)}" readonly required>
                    </c:if>
                    <c:if test="${fn:length(phone) eq 10}">
                      <input type="text" class="tel" name="phone2" id="phone2" value="${fn:substring(phone, 3,11)}" readonly required>
                    </c:if>
            </div>
            <div class="form-group row">      		
           		<input type="text" class="form-control" name="licenseNum" id="licenseNum" style="width: 75%;" placeholder="운전면허번호(AA-BB-CCCCCC-DE)" required/>
           		&nbsp;&nbsp;&nbsp;
           		<span>
           			<input type='button' class='btn btn-success' id='liCk1' value='중복확인' onclick='liCk()'/>
           			<input type='button' class='btn btn-success' id='reCk1'  value='재설정' onclick='reCk()'/>
           		</span>
            	<input type="hidden" id="licenseStatus" value="0"/>
            </div>
            <div class="form-group row">            		
           		<input type="text" class="form-control" name="carModel" id="carModel" placeholder="자동차 모델(ex.페라리)" required/>
            </div>
            <div class="form-group row">            		
           		<input type="text" class="form-control" name="carNum" id="carNum" style="width: 75%;" maxlength="9" placeholder="자동차 번호(ex. 28 루 4454)"required/>
          		&nbsp;&nbsp;&nbsp;
          		<span>
           			<input type='button' class='btn btn-success' id='carCk1'  value='중복확인' onclick='carCk()'/>
           			<input type='button' class='btn btn-success' id='reCk2'  value='재설정' onclick='reCkCar()'/>
           		</span>
            	<input type="hidden" id="carNumStatus" value="0"/>
            </div>
            <div class="form-group row">            		
           		<input type="text" class="form-control" name="driver_info" id="driver_info" placeholder="드라이버 자기소개 입력해주세요."required/>

            </div>
	       	 <div class="custom-file form-group row">
	               <input multiple="multiple" type="file" class="custom-file-input" accept="image/*" name="upFile" id="upFile1" onchange="fileCheck(this)" required>
	               <label class="custom-file-label profile" for="upFile1">자동차 정면1장, 측면2장, 후면1장</label>
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