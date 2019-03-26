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



  <style>
     div#enroll-container{max-width:500px; margin:0 auto; text-align:center;}
     div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
  
    /*비밀번호 체크 */
    div#enroll-container span.ck {display:none;font-size: 12px;position:absolute; top:58px; right:10px;}
    div#enroll-container span.ckOk{color:green;}
    div#enroll-container span.ckNo{color:red;}
    
    .ckOk, .ckNo{padding-right:13px; }
    .phone{margin-left:0; margin-right:0;}
    #pro_img{width: 400px; height: auto;}
    .profileDiv{padding-right:0; width:100px;}
    .pPassword{font-size:13px; margin-top:1px;}
  	.passwordInfo{height:40px; align:left;}
  	.oriEmail,.oriPhone,.oriName {font-size:17px; text-align:left; padding-left:15%;} 	
  	.alert{padding:0; }
  	.cg {font-size:13px;}
  	.btns{padding-top:3px; padding-right:0; padding-left:0;}
  	#chgMailInfoP{margin-top:10px; margin-bottom:0;}
  	#chgPhoneInfoP{margin-bottom:10px;}
    .chgBtnDiv{padding-right:0px;} 
    #chgEmailBtn{width:117px;}
    #sentEmailDiv, #sentTxtDiv, #sentPhoneDiv{margin-bottom:0; margin-top:20px;}  
    ul{list-style:none;} 
    p{margin-bottom:0;}
    #chgName-btn{width:115px;} 
    #upFile{height:3px;}
    #nameInfo-div{padding-top:4px;}
    </style>  
     
<script>
//프로필 사진을 이미지 타입 파일로만 받기
/* function fileCheck(obj) {
	var fileKind = obj.value.lastIndexOf('.');
	var fileName = obj.value.substring(fileKind + 1, obj.length);
	var fileType = fileName.toLowerCase();

	var ckFileType = new Array();
	ckFileType = [ 'jpg', 'gif', 'png', 'jpeg', 'jpeg', 'bmp' ];

	if (ckFileType.indexOf(fileType) == -1) {
		alert("이미지 파일만 선택할 수 있습니다.");
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
 		};
      console.log(filenames);
	}
	console.log($('#upFile').val());
}
*/
//프로필 이미지 검사
function validate(){
    if($('#temp').val()==0){
 	   alert("알맞은 사진을 넣어주세요.");
 	   return false;
    }
}
  //프로필 사진 클릭시 파일 업로드 가능하게 하는 이벤트.
 $(function(){  
	$('#pro_img').on('click', function() {
			$('#upFile').trigger('click');			
		})	 
});
 
 
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
 
 
 
 //비밀번호 유효성 검사
 function passwordCheck(password){
    var pw=$(password).val().trim();
    var ckPw =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
      if(!ckPw.test(pw)){        
         alert('숫자,영문자,특수문자 조합으로 6~15자');
         $('#password1').val('').focus();
         return false;
     }  
      if(pw==null){
    	  return false;
      }
     return true;
 }

	$(function() {	
		//이메일(아이디부분) 알파벳만 입력 받게 하기    
		$("#email1").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});
		
		$(document).ready(function(){
			$("#chgEmailInfo").hide();
			$("#chgMailInfoP").hide();
			$("#sentEmailDiv").hide();
			$("#alertEmail").hide();
			$("#inputPhone").hide();
			$("#sentPhoneDiv").hide();
			$("#alertPhone").hide();
			$("#pass-div").hide();//패스워드 변경 입력창
			$("#name-div").hide();//이름 변경 입력창
		})
		
		//이름 변경 버튼
		$("#chgName-btn").on("click", function(){
			$("#name-div").show();
			$("#oriName-div").hide();
		})
		
		//이름 변경 취소 버튼
		$("#cancleName-btn").on("click",function(){
			$("#name-div").hide();
			$("#oriName-div").show();
		})
		
		
		//패스워드 변경 버튼
		$("#chgPass-btn").on("click", function(){
			$("#pass-div").show();//패스워드 변경 입력창
		})
		
		//이메일 변경 버튼 
		$("#chgEmailBtn").on("click",function(){
			$("#oriEmailDiv").hide();
			$("#chgEmailInfo").show();
			$("#chgMailInfoP").show();
			
		});
		
		//이메일 변경 취소 버튼 
		$("#backEmail").on("click", function(){
			$("#oriEmailDiv").show();
			$("#chgEmailInfo").hide();
			$("#chgMailInfoP").hide();
			
		});
		
		//인증 메일 발송 취소 버튼
		$("#backEmail").on("click", function(){
			$("#alertEmail").hide();
    		$("#sentEmailDiv").hide();
    		$("#reMail").attr("readonly",false);
		})
		
		//핸드폰 번호 변경 버튼
		$("#chgPhoneBtn").on("click", function(){
			$("#inputPhone").show();
		    $("#oriPhoneDiv").hide(); 
		});
		
		//핸드폰 번호 변경 취소 버튼
		$("#backPhone").on("click", function(){
			$("#inputPhone").hide();
     	    $("#oriPhoneDiv").show();
		})
			 
		//인증 번호 발송 취소 버튼
		$("#backOriPhone").on("click", function(){
			$("#sentPhoneDiv").hide();
			$("#sentTxtDiv").show();			
		})

	});
	
//이메일 변경
	function sendEmail(){		    
    //이전 이메일과 중복여부 확인
    	var reMail=$('#reMail').val().trim();//변경할 이메일
   	    var oriMail=$('.oriEmail').text();//기존 이메일
   	    
   		//이메일 유효성 검사
		var ckMail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!ckMail.test($("input[name=email]").val())){
			alert("정확한 이메일 형식을 입력해주세요.");	
			return false;
		}
				
	 	if(reMail===oriMail){
    		$("#alertEmail").show();
    		$("#sentEmailDiv").hide();	    		
    		 return false;	    		
    	}else{	    		
    		   $.ajax({
		           url:"${path}/member/checkEmail.do",
		           data:{"email":reMail},
		           success:function(data){                 
		               if(data == 'no')
		               {
		              	  alert('이미 사용중인 이메일 입니다. 사용하실 수 없습니다.');          
		                  return false;
		               }else{			            	   
			           		 $.ajax({
			    	    		url:"${path}/member/changeEmail",
			    	    		data:{"email":reMail},
			    	    		type:"post",
			    	    		success:function(result){
			    	    			if(result=="sent"){
			    	    				$("#alertEmail").hide();
			    	    	    		$("#sentEmailDiv").show();
			    	    	    		$("#reMail").attr("readonly",true);
			    	    			}else{
			    	    				alert("메일전송에 실패하였습니다.");
			    	    			}
			        			}    		
			        		});			             	               	   		            	   
		               }
		           }
		        }); 
    		}	    		
   		} 
			
//핸드폰 번호 변경 버튼 클릭시
function sendSms(){		
	 	var p1=$('#selectPhone option:selected').val(); 
		var p2=$('#phone2').val().trim();
		var phone=p1+p2;
	 	//핸드폰 유효성 검사 		
		var regExp = /([0-9]{7,8})$/;
		if (!regExp.test(p2)) {
			alert("정확한 휴대폰 번호를 입력해주세요. '-' 빼고 입력해주세요. ");
			return false;
		} 
				
	 	//핸드폰 번호 중복 검사
		$.ajax({
			url:"${path}/member/phoneCheck.do",
			data:{"phone":phone},
			success:function(data){
				if(data=='Y'){				
					$.ajax({
						url:"${path}/member/sendSms",
						data:{"receiver":phone},
						type:"post",
						success:function(result){
							console.log(result);					
							if(result == "true"){
								$("#sentTxtDiv").hide();
								$("#sentPhoneDiv").show();							
								document.getElementById('phoneNumber').value=phone;							
						}else{
							alert("전송 실패!");
						}
					}						
				});																	
			}else{
				alert("이미 사용중인 번호 입니다. 사용하실 수 없습니다.");
				return false;
			}
		}
	}); 
};
	
$(function(){
//이름 한글만 입력받게 하는 함수       
	$("#memberName").keyup(function(event) {
	      if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
	         var inputVal = $(this).val();
	         $(this).val(inputVal.replace(/[^가-힣]/gis, ''));
		   }
	});		
});
		
//이름 변경
function changeName(){
	//이름 유효성 검사
	var name=$('#memberName').val().trim();
	 if(name.length>7){
	    alert("정확한 이름을 입력해주세요.");
	    return false;
		  }	
	console.log(name);
	$.ajax({
		url:"${path}/member/changeName",
		type:"post",
		data:{"memberName":name},
		success:function(result){
			if(result=='ok'){
			}else{
				alert("이름 변경에 실패했습니다.");
			}
			location.reload();
		}
	});
}		
	 	
</script>
      <div id="enroll-container" class="container">
			<div class="card" >
					  <ul class="list-group list-group-flush">
						 <li class="list-group-item">
       						 <form action="${path }/member/updateProfile.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">                	                     
								 <div class="custom-file" > 
									 <input type="file" class="custom-file-input" accept="image/*" id="upFile" name="upFile" onchange="fileCheck(this)" required>
									 <img class="img-thumbnail mx-auto d-block" id="pro_img" src="${path }/resources/upload/profile/${logined.profileImageRe}" alt="Card image cap">
				                     <input type="hidden" id="temp" name="temp" value="0"/>
							  		 <input type="submit" class="btn btn-success btn-sm btn-block" id="img-btn" value="사진 저장">
							  	 </div>
							  	 <div>
							  	 </div> 
				  			 </form>				  			 				  		 				  			 
					  	 </li>				  
					    <li class="list-group-item">
					    	<button type="button" class="btn  btn-outline-success btn-sm btn-block" data-toggle="modal" data-target="#chgPass">비밀번호 변경하기</button>   
					    </li>					   
					    <!--이름 변경  -->	
					     <li class="list-group-item">
						     <div class="row" id="oriName-div">    	
					    		<div class="ptext col-6" id="nameInfo-div">
					    			<p class="oriName font-weight-bold"><%=m.getMemberName() %></p>
								</div>  
								<div class="col-6 chgBtnDiv">
									<button type="button" id="chgName-btn" class="cg btn   btn-outline-success btn-sm">이름 변경 </button>      	
					   			</div> 		
					   		 </div>			   		 			   		    		 
				     		 <!--이름 변경 버튼 클릭시  -->
					   		 <div class="row" id="name-div">    	
					    		<div class="ptext col-7">
								  <input type="text" class="form-control" value="${logined.memberName }" name="memberName" id="memberName" maxlength="8" required>
								</div>  
								<div class="btns col-5">
								  <button type="button" id="" class="cg btn btn-secondary btn-sm" onclick="changeName()">변경하기</button>
								  <button type="reset" id="cancleName-btn" class="cg btn btn-secondary btn-sm">취소</button>
					   			</div> 		
					   		 </div>				 
					    </li>  			        
					    <li class="list-group-item">
							<!--기존 Email 정보  -->
						     <div class="row" id="oriEmailDiv">    	
					    		<div class="ptext col-6">
					    			<p class="oriEmail font-weight-bold"><%=m.getEmail() %></p>
								</div>  
								<div class="col-6 chgBtnDiv">
									<button type="button" id="chgEmailBtn" class="cg btn btn-outline-success btn-sm">이메일변경</button>      	
					   			</div> 		
					   		 </div>
					   		 <!--Email 변경 버튼 클릭시  -->
					   		 <div class="row" id="chgEmailInfo">    	
					    		<div class="ptext col-7">
								  <input type="email" class="form-control" value="${logined.email }" id="reMail" name="email" maxlength="30" required>
								</div>  
								<div class="btns col-5">
								  <button type="button" class="cg btn btn-secondary btn-sm" id="sendMail-btn" onclick="sendEmail();">인증 메일 발송</button>
								  <button type="reset" id="backEmail" class="cg btn btn-secondary btn-sm">취소</button>
					   			</div> 		
					   		 </div>
						 	 <div class="alert alert-danger text-danger" id="alertEmail" role="alert">이전과 동일한 메일주소 입니다.</div>          		 
							 <div><p class="pPassword" id="chgMailInfoP">이메일 주소를 인증하시면 변경이 완료됩니다.</p></div>
					   		  <!--Email 변경 인증 메일 전송 후  -->      			  
							  <div id="sentEmailDiv">
					 			 <div class="alert alert-success text-success" role="alert">인증메일이 발송되었습니다.</div>
					  				<p class="pPassword">유효시간: 이메일 발송 후 3분 이내.</p>
					   			    <button type="button" class="cg btn btn-secondary btn-sm">인증 메일 재발송</button>
							  </div> 
					    </li>
					    <li class="list-group-item">
					    	   <!--기존 Phone 정보  -->
		           			<div class="row" id="oriPhoneDiv">    	
				           		<div class="ptext col-6">
				           			<p class="oriPhone font-weight-bold"><%=m.getPhone() %></p>
				       			</div>  
				       			<div class="col-6 chgBtnDiv">
				       				<button type="button" id="chgPhoneBtn" class="cg btn  btn-outline-success btn-sm">핸드폰 번호 변경</button>      	
				          		</div> 		
		           			 </div>
		           		 <!--핸드폰번호 변경 버튼 클릭시  -->
			           		 <div id="inputPhone">
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
					                		<input type="text" class="tel form-control col-sm-7" name="phone2" id="phone2" value="${fn:substring(phone, 3,12)}" maxlength="8" required>
					           			 </c:if>
					           			 <c:if test="${fn:length(phone) eq 10}">
					                		<input type="text" class="tel form-control col-sm-7" name="phone2" id="phone2" value="${fn:substring(phone, 3,11)}" maxlength="8" required>
					           			</c:if>
			         	    	 </div>			         		 	       			
			       			 	<div class="alert alert-danger text-danger" id="alertPhone" role="alert">이전과 동일한 번호 입니다.</div>          		 		       			
				   			    <div><p class="pPassword" id="chgPhoneInfoP">핸드폰 번호를 인증하시면 변경이 완료됩니다.</p></div>
				   			    <div id="sentTxtDiv">
				       				<button type="button" class="cg btn btn-secondary btn-sm" id="sentTxtBtn" onclick="sendSms();">인증 번호 발송</button>
				       				<button type="reset" id="backPhone" class="cg btn btn-secondary btn-sm">취소</button>
				       			</div>   
			       			    <!--핸드폰 변경 문자 인증 전송 후  -->      			  
				       			  <div id="sentPhoneDiv">
					    			  <div class="alert alert-success text-success" role="alert">인증번호가 발송되었습니다.</div>
				    			  	  <div class="row">
							           	  <input type="text" class="col-8 form-control" id="smsAnswer" placeholder="핸드폰으로 전송된 인증번호 3분이내 입력하세요." name="phoneCk">
							           	  <button type="button" class="col-4 cg btn btn-secondary btn-sm" onclick="phoneCheck();">인증하기</button>
				    			      </div>
				    			      <button type="button" class="cg btn btn-secondary btn-sm" onclick="sendSms();">인증 문자 재발송</button>
				    			      <button type="reset" id="backOriPhone" class="cg btn btn-secondary btn-sm">취소</button>
				       			  </div>
				       			  <input type="hidden" id="phoneNumber" value="0" required>
					  		</div>			    
				    </li> 
				  </ul>		 	
			 </div>            
 		 
	</div>       
<script>
function phoneCheck(){
	
 	var p1=$('#selectPhone option:selected').val(); 
	var p2=$('#phone2').val().trim();
	var phone=p1+p2;
	console.log(phone);  
	
	$.ajax({
		url:"${path}/member/phoneUpdate",
		type:"post",
		data:{
			"code":$("#smsAnswer").val(),
			"phone":$("#phoneNumber").val()
		},
		success:function(result){
			if(result == "ok"){
				alert("번호 인증 성공");
				
			}else{
				alert("번호 인증 실패");ㅣ
			}		
			location.reload();
		}
	})							
}


</script>      
<!--비밀번호 변경하기 모달창  -->
<div class="modal fade" id="chgPass" tabindex="-1" role="dialog" aria-labelledby="chgPassLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="row form-group">
       		<div class="ptext col-5">
       			<p class="badge badge-secondary">비밀번호 변경 시 유의사항</p>&nbsp&nbsp  
   			</div>  
   			<div class="col-7">      	
   				<p class="pPassword">숫자/영문자/특수문자 조합 6~15자</p>
      		</div> 		             
          </div>
          <input type="password" class="form-control password" placeholder="새 비밀번호" name="memberPw" id="password1" onchange="passwordCheck(this)" maxlength="15" required>                         
          <input type="password" class="form-control password" placeholder="새 비밀번호확인" id="password2" maxlength="15" required>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <a href="#" class="btn btn-primary" data-dismiss="modal" onclick="changePass();">변경하기</a>
         <script>
        	function changePass(){
        		var pass1=$("#password1").val().trim();
        		var pass2=$("#password2").val().trim();
        		console.log("패스워드 들어오는 값?"+pass1);
        		if(pass1==pass2&&pass1!=''){
        			console.log("ajax실행 차례");     			
        		 	$.ajax({
        				url:"${path}/member/changePass",
        				data:{"password":pass1},
        				success:function(result){
        					console.log(result);       				
        					if(result=="update"){
        						alert("비밀번호 변경 성공");       					
	        				}else{
	        					alert("비밀번호 변경 실패");
	        				}	
       					}
        			});        			
        		}else{
        			alert("비밀번호가 올바르지 않습니다.");
        		 	return false; 
        		}
        	}
        </script> 
      </div>
    </div>
  </div>
</div>







<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>