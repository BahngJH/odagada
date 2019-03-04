<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   "}
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
  
  /* 
   $('#selectEmail').change(function(){
	$('#selectEmail option:selected').each(function(){
		if($(this).val()=='selfEmail'){
			$('#email2').val('');
			$('#email2').prop('readonly', false);
		}else{
			$('#email2').val($(this).text());
			$('#email2').prop('readonly', true);
		}
	});
	});  
		
 
	function selectMail(email2) {
		console.log(email2);
		if (email2.val() == 'self') {
			document.getElementById('#email2').innerHTML = '<input type="text" name="self" />';
		} else {
			document.getElementById('#email2').innerHTML = '';
		}
	} 
	*/	
</script>      
      <div id="enroll-container">
         <form name="memberEnrollFrm" action="#" method="post" onsubmit="return validate();" >
            <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="member" id="userId_" required>
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
            <div class="row">
            	<div class="col-6">
            		<div>
			            <input type="password" class="form-control" placeholder="비밀번호" name="password" id="password_" required>          		
            		</div>          	       	
            	</div>
            	<div class="col-6">
            		<div>
			            <input type="password" class="form-control" placeholder="비밀번호확인" id="password2" required>
            		</div>          	       	
            	</div>           
            </div>
            <div class="row">
            	<div class="col-6">
            		<div>
			            <input type="text" class="form-control" placeholder="이름" name="userName" id="userName" required>
            		</div>          	       	
            	</div>
            	<div class="col-6">
            		<div>
			            <input type="number" class="form-control" placeholder="생년월일" name="age" id="birth">
            		</div>          	       	
            	</div>           
            </div>
            
            

     	


			<div class="row row-email">
				<div class="col-6 div-email">
					<div class="input-group div-email">
						<input type="text" class="select-C form-control" placeholder="이메일" name="email1" id="email1" maxlength="20" required>
						<span class="input-group-addon addon-email" id="basic-addon1">@</span>
					</div>
				</div>
				<div class="col-6 div-email">
					<input type="text" class="select-C form-control" name="email2" id="email2">		
				<!-- 	<input type="text" class="select-C form-control" name="email2" id="email2" readonly>	
					<select class="select-C form-control" name="selectEmail" id="selectEmail" onchange="selectMail(this.options[this.selectedIndex].value)">
						<option selected>선택</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="paran.com">paran.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="self">직접입력</option>
					</select> -->
				</div>
			</div>
            <input type="number" class="form-control" placeholder="이메일 인증번호 3분이내 입력하세요." name="emailCk" required>
            
            <div class="row">
            	<div class="col-6">      	
					<select class="tel" name="phone" id="selectPhone" placeholder="전화번호 (예:01012345678)"  maxlength="" required>											  		  				   	         	
						<option value="" disabled selected>전화번호</option>
						<option  value="010">010</option>
						<option  value="011">011</option>
						<option  value="016">016</option>
						<option  value="017">017</option>
						<option  value="018">018</option>
						<option  value="019">019</option>			
						<option  value="070">070</option> 
					</select>
            	</div>       	
            	<div class="col-6">
    				 <input type="text" class="tel" name="tel1" id="tel1">      	
            	</div>
            </div>
            <div class="row">   		            
               <div class="custom-file col-12">
                   <input type="file" class="custom-file-input" name="upFile">
                   <label class="custom-file-label profile" for="upFile">프로필 사진 등록</label>
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