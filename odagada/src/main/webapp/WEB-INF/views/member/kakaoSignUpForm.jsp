  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

   <style>
   #kakaoEnrollFrm {
   	margin-top:50px;
   }
   
     div#enroll-container{width:350px; margin:0 auto; text-align:center;}
     div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
    /*중복아이디체크관련*/
    div#enroll-container{position:relative; padding:0px;}
    div#enroll-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.ok{color:green;}
    div#enroll-container span.error{color:red;}
    
    div#board-continer{width:350px;margin:0 auto; text-align:center}
    div#board-continer input{margin-bottom:15px;} 
    
    
    /*비밀번호 체크 */
    div#enroll-container span.ck {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.ckOk{color:green;}
    div#enroll-container span.ckNo{color:red;}
    
    .ckOk, .ckNo{
    padding-right:13px;
    }
       
  .emailC{     
    display: block;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;   
    }
    
    .tel{
    display: block;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; 
    width: 100%; 
    }
   
   .div-email{
   padding : 0px;
   }
   .row-email{
      padding: 0px;
      margin-left: 0px;
      margin-right: 0px;
   }
    
   .addon-email{
      margin-bottom: 10px;
   }
   
   .profile{
   margin-left:13px;
   margin-right:13px;
   }
   
   .gender{
   padding-left:28%;
   }
   
   .genderRow{
   margin-top: 10px;
   }
   
   .submitB{
   margin-top:5%;
   margin-left:30%;
   margin-bottom: 10%;
   }
   
   #enrollBtn{
   margin-right:15%; 
   }
   
   #memberId_{
   margin-top:20%;
   }
   
   .genderC{
   padding-left:0;
   }
   
   #gender1{
   margin-left:20px;
   } 
   .dR{
   padding-left:1%;
   }
   .dL{
   padding-right:1%;
   }
   .phone2C{
   padding-left:0px;
   }
   
   li { list-style: none }
  
  	li.li_pass{
  		font-size:14px;
  		margin-top:-10px;
  		margin-left:-10px;
  	}
  	p{
  	font-size:12px;
  	}
  	.passwordInfo{
  	height:40px;
  	}
  	.eck{padding-right:0; padding-left:0; font-size:15px; width:75px;}
  	.upFile-div{margin-bottom:10px;}
  	.select-div, .phone-div, .phone-btn{padding:0;} 
  	.p-div{margin-top:4px;}
  	.name-div{padding-right:3px;}
  	
   input[type='radio'] {
            display: none;
    }
    #checkGender label {
        padding-top: 10px;
        width: 85px; height: 40px;
        border: 1px solid gray;
        border-radius: 10px 10px 10px 10px;
    }
    #man:checked ~ label:nth-of-type(1) {
        color: white;
        background: green;
        border-color: green;
    }
    #woman:checked ~ label:nth-of-type(2) {
        color: white;
        background: green;
        border-color: green;
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
   
    //ID 중복확인
   $("#memberId_").keyup(function(){
      var memberId=$("#memberId_").val().trim();
      if(memberId.length<4)
      {
         $(".guide").hide();
         return;
      } 
       $.ajax({
         url:"${path}/member/checkId.do",
         data:{"memberId":memberId},
         success:function(data){         
                                                  
             if(data.isId==true)
             {
                $(".guide.ok").hide();
                $(".guide.error").show();
                document.getElementById('checkStatus').value='0';
             }
             else{
                $(".guide.ok").show();
                $(".guide.error").hide();
                document.getElementById('checkStatus').value='1';
             }
         }
      }); 
   }); 
 }); 
 
    //비밀번호 유효성 검사
   function passwordCheck(password){
      var pw=$(password).val();
      var ckPw =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
        if(!ckPw.test(pw)){        
           alert('숫자,영문자,특수문자 조합으로 6~15자');
           $('#password_').val('').focus();
           return false;
       }                  
       return true;
   }
$(function(){
    //비밀번호 일치 확인
         $('#password2').keyup(function(){
            var pw1=$("#password_").val().trim();
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
    
   //아이디  숫자,영소문자만 입력 가능하게 하는 함수      
   $("#memberId_").keydown(function(event) {
      if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
         var inputVal = $(this).val().trim();
         $(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
      }
   });
   
      
   //이름 한글만 입력받게 하는 함수       
   $("#memberName").keyup(function(event) {
         if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^가-힣]/gis, ''));
      }
   });
   
   //생년월일
     $("#birth" ).datepicker({
       changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+200d"   
     });
              
   //이메일(아이디부분)    
   $("#email1").keyup(function(event) {
      if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
         var inputVal = $(this).val();
         $(this).val(inputVal.replace(/[^a-z0-9_+.-]/gi, ''));
      }
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
     	//이메일 도메인 정규식 받기    
        var mC= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
        if(!mC.test($("input[name=email2]").val())){
          alert("정확한 이메일 형식을 입력해주세요.");
          return false;
       }          
        //E-mail 중복확인 체크
        if($('#emailStatus').val()==0){
        alert('e-mail 중복확인 해주세요.')
        return false;
        }
        //핸드폰 중복체크 
        if ($('#phoneStatus').val()==0) {
        	console.log($('#phoneStatus').val());
              alert("핸드폰 중복확인해주세요.");
              return false;
           }
        //생년월일 받기
        var birth=$('#birth').val().trim();
        if(birth==''){
        	alert('생일을 입력해주세요.')
        	return false;
        }
        
  
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
   
   
 //E-mail 중복 확인
   function checkEmail(){ 	
     	//이메일 도메인 정규식 받기    
       var mC= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
       if(!mC.test($("input[name=email2]").val())){
         alert("정확한 이메일 형식을 입력해주세요.");
         return false;
      }  
   		
       var email1=$("#email1").val();
       var at='@';
       var email2=$("#email2").val();
       var email=email1+at+email2;
       var phoneStatus=$('#phoneStatus').val();
        
       $.ajax({
           url:"${path}/member/checkEmail.do",
           data:{"email":email},
           success:function(data){                 
               if(data == 'no')
               {
              	  alert('이미 사용중인 이메일 입니다. 사용하실 수 없습니다.');          
                  document.getElementById('emailStatus').value='0';
                  return false;
               }else{
               	 document.getElementById('emailStatus').value='1'; 
               	alert('사용하셔도 좋습니다.');
               }
           }
        });  
      };
      
      //핸드폰 중복확인
      function checkPhone(){
    	    var phone1=$('#selectPhone option:selected').val();
    	    var phone2=$('#phone2').val();
    	    var phone=phone1+phone2;
    	    console.log(phone);
    	  //핸드폰 유효성 검사 
          var regExp = /([0-9]{7,8})$/;
          if (!regExp.test($("input[name=phone2]").val())) {
                alert("정확한 휴대폰 번호를 입력해주세요.");
                return false;
             }
   	    
    	    $.ajax({
    	    	url:"${path}/member/phoneCheck.do",
    	    	data:{"phone": phone},
    	    	success:function(data){
    	    		
    	    		if(data == 'Y'){
    	    			alert('사용하셔도 좋습니다.');
    	    			document.getElementById('phoneStatus').value='1';
    	    		}else{
    	    			alert('이미 사용중인 번호입니다. 사용하실 수 없습니다.');
    	    			 document.getElementById('phoneStatus').value='0';
    	    			return false;
    	    		}
    	    	}
    	    }) ;   	  
      };
      
      
</script>
      
      <div id="enroll-container">
      	<h3>필수항목 받기</h3>
         <form id="kakaoEnrollFrm" name="memberEnrollFrm" action="${path }/member/kakaoSignUpEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
            <input type="hidden" name="kakaoId" value="${kakaoId}">
            <input type="hidden" name="kakaoName" value="${kakaoName}">
             <div class="row">                     
                  <div class="upFile-div custom-file col-12">
                      <input type="file" class="custom-file-input" accept="image/*" name="upFile" onchange="fileCheck(this)" required>
                      <label class="custom-file-label profile" for="upFile">내 사진 등록</label>                      
                  </div>
                  <div class="col-6">
                  </div>                      
             </div>           
              
            <div class="row row-email">
               <div class="col-6 div-email">
                  <div class="input-group div-email">
                     <input type="text" class="emailC form-control" placeholder="이메일" name="email1" id="email1" maxlength="20" required>
                     <span class="input-group-addon addon-email" id="basic-addon1">@</span>
                  </div>
               </div>
               <input type="hidden" id="emailStatus" value="0"/>
               <div class="col-4 div-email">
                  <input type="text" class="emailC form-control" name="email2" id="email2" placeholder="도메인" maxlength="20" required>                                 
               </div>
               <div class="div-email col-2">
               		<button type="button" class="eck btn btn-success" onclick="checkEmail();">중복확인</button>
               </div>
          </div>
          <div class="row row-email">
             <div class="col-3 select-div">         
	              <select class="tel" name="phone1" id="selectPhone" required>                                                                                           
	                 <option  value="010" selected>010</option>
	                 <option  value="011">011</option>
	                 <option  value="016">016</option>
	                 <option  value="017">017</option>
	                 <option  value="018">018</option>
	                 <option  value="019">019</option>         
	                 <option  value="070">070</option> 
	              </select>
             </div>          
             <div class="col-7 phone-div">
          		<input type="text" class="tel" name="phone2" id="phone2" maxlength="8" placeholder="' - ' 제외" required>         
             </div>
             <div class="col-2 phone-btn">
             	<button type="button" class="eck btn btn-success" onclick="checkPhone();">중복확인</button>
             </div>
          </div>
           <input type="hidden" id="phoneStatus" value="0"/>              
               <!--  <div class="row genderRow">         
             		<div class="gender form-check-inline from-control">성별 : &nbsp; 
	                     <input type="radio" class="form-check-input" name="gender" id="gender0" value="F" checked><label for="gender0" class="form-check-label genderC">여자</label>&nbsp;
	                     <input type="radio" class="form-check-input" name="gender" id="gender1" value="M"><label for="gender1" class="form-check-label genderC">남자</label>&nbsp;
             	   </div>
               </div>  -->
                <input type="text" class="form-control" placeholder="생년월일" name="birth" id="birth" readonly required>
                <div id="checkGender">
	                <input type="radio" name="gender" value="M" id="man" checked>
	                <input type="radio" name="gender" value="F" id="woman">
	                <label for="man">남자</label>
	                <label for="woman">여자</label>
            	</div>                
                <br/>
                <div class="row submitB">  
                  <input type="submit" class="btn btn-outline-success" id="enrollBtn" value="가입" >&nbsp;
                  <input type="reset" class="btn btn-outline-success" value="취소">
               </div>
            </form>
         </div>
         
      

      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>