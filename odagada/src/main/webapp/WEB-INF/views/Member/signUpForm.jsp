
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.kh.spring.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

   <style>
      div#enroll-container{width:400px; margin:0 auto; text-align:center;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}

    /*중복아이디체크관련*/
    div#enroll-container{position:relative; padding:0px;}
    div#enroll-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.ok{color:green;}
    div#enroll-container span.error{color:red;}
    
    div#board-continer{width:400px;margin:0 auto; text-align:center}
    div#board-continer input{margin-bottom:15px;}
    
  .select-C{
    
    
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
    
    
/*     
    .form-control {
    display: block;
    width: 100%;
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
     */
    
  
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
  function validate(){
        var content = $("[name=boardContent]").val();
        if(content.trim().length==0){
            alert("내용을 입력하세요");
            return false;
        }
        return true;
    }
 </script>      
      <div id="enroll-container">
         <form name="memberEnrollFrm" action="#" method="post" onsubmit="return validate();" >
            <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="userId" id="userId_" required>
            <span class="guide ok">이 아이디는 사용할 수 있음 </span>
            <span class="guide error">이 아이디는 사용할 수 없음 </span>
            <input type="hidden" name="checkId" value="0"/>
            <script>
            	$(function(){ 
            		$("#userId_").keyup(function(){
            			var userId=$("#userId_").val().trim();
            			if(userId.length<4)
            			{
            				$(".guide").hide();
            				return;
            			}
            			$.ajax({
            				url:"${path}/member/checkId.do",
            				data:{"userId":userId},
            				success:function(data){
            					console.log(data);
            					console.log(data.num+" : "+typeof data.num);
            					console.log(decodeURI(data['char'])+" : "+typeof data['char']);
            					console.log(data.isId+" : "+typeof data.isId);
            					console.log(data.list+" : "+typeof data.list);
            					
            					for(var i=0;i<data.list.length;i++)
            					{
            						console.log("for : "+data.list[i]);	
            					}          					         					
            					if(data.isId==true)
            					{
            						$(".guide.ok").hide();
            						$(".guide.error").show();            					
            					}
            					else{
            						$(".guide.ok").show();
            						$(".guide.error").hide();
            					}	
            				}
            			});
            		});
            	});
                       
            </script>
            <input type="password" class="form-control" placeholder="비밀번호" name="password" id="password_" required>
            <input type="password" class="form-control" placeholder="비밀번호확인" id="password2" required>
            <input type="text" class="form-control" placeholder="이름" name="userName" id="userName" required>
            <input type="number" class="form-control" placeholder="생년월일" name="age" id="birth">
			<div class="row row-email">
				<div class="col-6 div-email">
					<div class="input-group div-email">
						<input type="email" class="select-C form-control" placeholder="이메일" name="email" id="email" required>
						<span class="input-group-addon addon-email" id="basic-addon1">@</span>
					</div>
				</div>
				<div class="col-6 div-email">
					<select class="select-C form-control" name="email" placeholder="E-mail" maxlength="" required>
						<option value="" disabled selected>선택</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="paran.com">paran.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option id="self" value="">직접입력</option>
					</select>
				</div>
			</div>
			<select class="select-C" name="phone" placeholder="전화번호 (예:01012345678)"  maxlength="" required>											  		  
				<option value="" disabled selected>전화번호</option>
				<option  value="010">010</option>
				<option  value="011">011</option>
				<option  value="016">016</option>
				<option  value="017">017</option>
				<option  value="018">018</option>
				<option  value="019">019</option>			
				<option  id="self" value="">직접입력</option> 
			</select>
			 <input type="number" class="select-C" name="tel1" id="tel1">
			 <input type="number" class="select-C" name="tel2" id="tel2">
            <input type="number" class="form-control" placeholder="이메일 인증번호 3분이내 입력하세요." name="emailCk" required>
            <input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" required> 
            
	   		 <div class="input-group mb-3" style="padding:0px;">
	               <div class="input-group-prepend" style="padding:0px;">
	                   <span class="input-group-text">프로필사진 등록</span>
	               </div>
	               <div class="custom-file">
	                   <input type="file" class="custom-file-input" name="upFile" id="upFile1">
	                   <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
	               </div>    
	   	      </div>
	            
           
            
		 <div class="form-check-inline form-check">성별 : &nbsp; 
               <input type="radio" class="form-check-input" name="gender" id="gender0" value="여자"><label for="gender0" class="form-check-label">여자</label>&nbsp;
               <input type="radio" class="form-check-input" name="gender" id="gender1" value="남자"><label for="gender1" class="form-check-label">남자</label>&nbsp;
            </div>
            <br/>
            <input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
            <input type="reset" class="btn btn-outline-success" value="취소">
         </form>
      </div>
      
      
      
      
      



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      <!--  보류 셀렉트
      
      
          .select-C{
    
    
    display: block;
    width: 50%;
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
    
    
      
          <input type="email" class="select-C" placeholder="이메일" name="email" id="email" required>
             <select class="select-C" name="email" placeholder="E-mail"  maxlength="" required>
            	<option value="" disabled selected>선택</option>											  		  
				<option  value="hanmail.net">hanmail.net</option>
				<option  value="hotmail.com">hotmail.com</option>
				<option  value="naver.com">naver.com</option>
				<option  value="yahoo.co.kr">yahoo.co.kr</option>
				<option  value="paran.com">paran.com</option>
				<option  value="gmail.com">gmail.com</option>
				<option  value="nate.com">nate.com</option>
				<option  id="self" value="">직접입력</option>
			</select>	
            <select class="select-C" name="phone" placeholder="전화번호 (예:01012345678)"  maxlength="" required>											  		  
				<option value="" disabled selected>전화번호</option>
				<option  value="010">010</option>
				<option  value="011">011</option>
				<option  value="016">016</option>
				<option  value="017">017</option>
				<option  value="018">018</option>
				<option  value="019">019</option>			
				<option  id="self" value="">직접입력</option>
			</select>
			 <input type="number" class="select-C" name="tel1" id="tel1">
			 <input type="number" class="select-C" name="tel2" id="tel2">
 



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>-->