  
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
		background-image: url(${pageContext.request.contextPath}/resources/images/member.png);
		background-position: center center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 300px;
		margin-bottom: 30px;
		margin-top: 10px;
	}
	#tbl-board{
		margin-bottom: 30px;
	"src/main/webapp/resources/images"}
	a{
		color: black;
		text-decoration: none;
	}
     div#enroll-container{width:400px; margin:0 auto; text-align:center;}
     div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
   
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
    #birth-div{padding-right:13px;}
   .ckOk,.ckNo{padding-right:13px;}
       
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
   
   .div-email{padding : 0px;}
   .row-email{
      padding: 0px;
      margin-left: 0px;
      margin-right: 0px;}
    
   .addon-email{margin-bottom: 10px;}  
   .profile{
   margin-left:13px;
   margin-right:13px;}
   
   .gender{ padding-left:28%;}   
   .genderRow{margin-top: 10px;} 
   .submitB{
   margin-top:5%;
   margin-left:30%;
   margin-bottom: 10%;}
   .eck{width:2;height:29pt;}
   #memberId_{margin-top:20%;}     
   .dR{padding-left:1%;}
   .dL{padding-right:1%;}
   .phone2C{padding-left:0px;}  
   li { list-style: none } 
   li.li_pass{
  		font-size:14px;
  		margin-top:-10px;
  		margin-left:-10px;
  	}
  	p{font-size:12px;}
  	.passwordInfo{height:40px;}
  	.eck{padding-right:0; padding-left:0; font-size:15px; width:75px;}
  	.upFile-div{margin-bottom:10px;}
  	.select-div, .phone-div, .phone-btn{padding:0;} 
  	.p-div{margin-top:4px;}
  	.name-div{padding-right:3px;}
  	
   input[type='radio'] {display: none;}
    #checkGender label {
        padding-top: 10px;
        width: 100px; height: 40px;
        border: 1px solid #28a745;    
        border-radius: 10px 10px 10px 10px;
        color : #28a745;
        width: 80px;
    }
    #man:checked ~ label:nth-of-type(1) {
        color: white;
        background: #28a745;
        border-color: #28a745;
    }
    #woman:checked ~ label:nth-of-type(2) {
        color: white;
        background: #28a745;
        border-color: #28a745;
    }   
    #email2{width: 112px;}
    #phone2{width: 200px;}
    #proImg-div{width:350px; border:1px solid #4BAF4B;}
    #proImg-row{margin:0; margin-bottom:3%;display:none;}
    img#pro_img{max-width:350px;max-height:300px;background-clip: content-box;}
      
input[type="radio"] {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
}
input[type="radio"]:focus + label:before,
input[type="radio"]:hover + label:before {border-color: black;}

input[type="radio"]:active + label:before {
    -webkit-transition-duration: 0;
    transition-duration: 0;
    -webkit-filter: brightness(0.2);
    filter: brightness(0.2);
}

input[type="radio"] + label {
    position: relative;
    padding: 10px;
    padding-left: 2em;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

input[type="radio"] + label:before {
    box-sizing: content-box;
    content: '';
    color: #04B431;
    position: absolute;
    top: 50%;
    left: 0;
    width: 18px;
    height: 18px;
    margin-top: -9px;
    border: 2px solid grey;
    text-align: center;
}

input[type="radio"] + label:after {
    box-sizing: content-box;
    content: '';
    background-color: #04B431;
    position: absolute;
    top: 50%;
    left: 4px;
    width: 14px;
    height: 14px;
    margin-top: -5px;
    -webkit-transform: scale(0);
    transform: scale(0);
    -webkit-transform-origin: 50%;
    transform-origin: 50%;
    -webkit-transition: -webkit-transform 200ms ease-out;
    transition: -webkit-transform 200ms ease-out;
    transition: transform 200ms ease-out;
    transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
}

input[type="radio"]:checked + label:before {
    -webkit-animation: borderscale 300ms ease-in;
    animation: borderscale 300ms ease-in;
    background-color: white;
}

input[type="radio"]:checked + label:after {
    -webkit-transform: scale(1);
    transform: scale(1);
}

input[type="radio"] + label:before,
input[type="radio"] + label:after {border-radius: 50%;}
button.check-btn{
    max-width: 58px;
    font-size: 14px
}
#sub-btn{padding-left:5%; padding-right:5%;}

div.container{
	font-family: S-CoreDream-3Light;
}
    
    </style>
    
     
<script>
 $(function(){
   
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
     $("#birth" ).datepicker({changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+200d"   
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
  	 //ID 4자리~12자리 소문자, 숫자 가능 확인하기 
      var idReg =/^[A-Za-z0-9]{4,12}$/;
      if (!idReg.test($("input[name=memberId]").val())) {
         alert("아이디는 영문자 또는 숫자  4~12자리로 입력해주세요.");
         return false;
      	}   
     
      //이름 유효성 검사
      //var nameCk=/^[가-힣]{2,6}||[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
      var name=$('#memberName').val().trim();
       if(name.length>7){
          alert("정확한 이름을 입력해주세요.");
          return false;
    	  }
       //프로필 이미지 검사
       if($('#temp').val()==0){
    	   alert("알맞은 사진을 넣어주세요.");
    	   return false;
       }
     	//이메일 도메인 정규식 받기    
        var mC= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
        if(!mC.test($("input[name=email2]").val())){
          alert("정확한 이메일 형식을 입력해주세요.");
          return false;
       }  
        //비밀번호 체크 
        var pw1=$("#password_").val().trim();
        var pw2=$("#password2").val().trim();
        if(pw1!=pw2){
           alert("정확한 비밀번호 입력하세요.");
          return false;       
       } 
        //ID 중복확인 체크
        if($('#checkStatus').val()==0){
           alert('ID 중복확인해주세요.');
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
    	    console.log($('#temp').val());
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
      
      

  //프로필 사진 클릭시 파일 업로드 가능하게 하는 이벤트.
  $(function(){  
 	$('#pro_img').on('click', function() {
 			$('#upFile').trigger('click');			
 		})	 
 });
         
    //프로필 사진을 이미지 타입 파일로만 받기
     function fileCheck(obj) {
     	var fileKind = obj.value.lastIndexOf('.');
     	var fileName = obj.value.substring(fileKind + 1, obj.length);
     	var fileType = fileName.toLowerCase();
     	var ckFileType = new Array();
     	ckFileType = ['jpg','png', 'jpeg', 'jpeg', 'bmp'];
     	
			
		if(fileName==''){return true;}	
		if (ckFileType.indexOf(fileType) == -1) {
	   		alert("이미지 파일만 선택할 수 있습니다. 'gif' 파일은 불가합니다.");
	   		var parentObj = obj.parentNode;
	   		var node = parentObj.replaceChild(obj.cloneNode(true), obj);
	   		return;
	     }
		 else{
     			var filenames=obj.files[0].name;
        		var fileReader = new FileReader();    
        		
	      		fileReader.readAsDataURL(obj.files[0]);   	      		
	      		fileReader.onload = function(e){
     	 		var result = e.target.result;	
     	 		$('#pro_img').attr('src',result);
     	 		$('#proImg-row').show();
     	 		
     		 	var formData=new FormData();
      		 		formData.append('upFile',obj.files[0]);  
      		
      	 	 	$.ajax({
     	 			url:"${path}/member/profileTest.do",
     	 			data:formData,
     	 			dataType:'json',
     	 			processData:false,
     	 			contentType:false,
     	 			type:'POST',
     	 			success:function(data){
     	 				if(data[1]=='no'){
     	 					document.getElementById('temp').value='0'; 
     	 					alert("인물 사진을 넣어주세요.");
     	 					return false;
     	 				}if(data[1]=='many'){
     	 					document.getElementById('temp').value='0'; 
     	 					alert("하나의 인물이 나온 사진을 넣어주세요.");
     	 					return false;
     	 				} else{
     	 					document.getElementById('temp').value='1'; 
     	 					return true;
     	 				}      	 			
     	 			}
     	 		});  
      		}
     	}
     }
     function backBtn(){
    		history.back(); 	
    	}     
     
</script>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">오다가다와 함께하기</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/member.png">
</section>
      <div id="enroll-container" class="container">
         <form name="memberEnrollFrm" action="${path }/member/signUpEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
            <input type="text" class="form-control" placeholder="아이디 (4~12자리 영소문자,숫자만 가능)" name="memberId" id="memberId_" maxlength="12" required>
            <span class="guide ok">ID 사용 가능 </span>
            <span class="guide error">ID 중복 사용 불가 </span>
            <input type="hidden" name="checkId" value="0"/>
            <input type="hidden" id="checkStatus" value="0"/>
            <div class="row">
               <div class="col-5 dL">
                  <div>
                     <input type="password" class="form-control" placeholder="비밀번호" name="memberPw" id="password_" onchange="passwordCheck(this)" maxlength="15" required>                
                  </div>                       
               </div>
               <div class="col-7 dR">
                  <div>
                     <input type="password" class="form-control" placeholder="비밀번호확인" id="password2" maxlength="15" required>
                     <span class="ck ckOk">비밀번호 일치</span>
                     <span class="ck ckNo">비밀번호 불일치</span>                      
                  </div>                       
               </div>           
            </div>
            <div class="row passwordInfo">    	
           		<div class="ptext col-5">
           			<p class="badge badge-secondary p_pass">비밀번호 변경 시 유의사항</p>&nbsp&nbsp  
       			</div>  
       			<div class="col-7 p-div">      	
          				<p>숫자/영문자/특수문자 조합 6~15자</p>
          		</div> 		
            </div>
             <div class="row">                     
                  <div class="upFile-div custom-file col-12">
                      <input type="file" class="custom-file-input" accept="image/*" name="upFile" onchange="fileCheck(this)" required>
                      <input type="hidden" id="temp" name="temp" value="0"/>
                      <label class="custom-file-label profile" for="upFile">프로필 사진 등록</label>
                  </div>                      
             </div>
             <div class="row" id="proImg-row">
             	<div id="proImg-div">
					<img  class="img-thumbnail mx-auto d-block" id="pro_img">            	
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
               		<button type="button" class="eck btn btn-success check-btn" onclick="checkEmail();">중복확인</button>
               </div>
          </div>
          <div class="row">
               <div class="col-6 name-div">
                  <div>
                     <input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" maxlength="8" required>
                  </div>                       
               </div>
               <div class="col-6 dR" id="birth-div">
                  <div>
                     <input type="text" class="form-control" placeholder="생년월일" name="birth" id="birth" readonly required>
                  </div>                       
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
             	<button type="button" class="eck btn btn-success check-btn" onclick="checkPhone();">중복확인</button>
             </div>
          </div>
           <input type="hidden" id="phoneStatus" value="0"/>              
               <div class="row genderRow">         
             		<div class="gender form-check-inline from-control">
             	   		 <input id="radio1" type="radio" class="radio" name="gender" value="M" checked="checked"> <label for="radio1">남자</label>&nbsp;
           				 <input id="radio2" type="radio" class="radio" name="gender" value="F"> <label for="radio2">여자</label>&nbsp;
             	   </div>
               </div>  	                 	                
                <br/>
                <div class="row" id="sub-btn">  
                  <input type="submit" class="btn btn-success btn-sm btn-block" value="가입">
				  <input type="reset" class="btn btn-outline-success btn-sm btn-block" onclick='backBtn();' value="취소">
               </div>
            </form>
         </div>
         
      

      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>