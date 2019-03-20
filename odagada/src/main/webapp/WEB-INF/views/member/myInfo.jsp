<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
	System.out.println(m);
    String eDate []=m.getEnrollDate().split(" ");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<style>

  div#enroll-container{width:400px; margin:0 auto;}
  div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
  .menu{text-align:center; font-weight:bold;}
  .info{margin-top:50px; margin-bottom: 50px;}
  #answer{height:50%;}
  .alert-div{size:10px;}
  #ttMessage-div{padding-bottom:0px;}
  #pw-modal-div{padding-bottom:0px; padding-top:0px;}
  #ttQ{margin-left:60%;}
 tr::before,
tr::after {
  box-sizing: none; // 1
}
</style>

<section class="container">
   <div class="row">

      <div class="col-12 col-md-3">
         <div class="menu_list info list-group">
            <a class="list-group-item list-group-item-action active">회원 정보 관리</a>
            <a href="${path}/member/myDriver" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
            <a href="${path }/member/myCarpool" class="list-group-item list-group-item-action">카풀 내역</a>
            <a href="${path }/driver/driverCarpool" id="driverCarpool" class="list-group-item list-group-item-action">드라이버 카풀 등록 내역</a>
         </div>
      </div>
      
      <div class="col-12 col-md-9" id="enroll-container">   
         <div class="info col-12 col-sm-12 col-md-9">
           <img class="img-thumbnail mx-auto d-block" src="${path }/resources/upload/profile/${logined.profileImageRe}" alt="Card image cap">
            <div class="card-group">
               <div class="card">
                    <table class="table table-hover" >
                      <tr>
                      <th scope="row">아이디</th>
				      <td colspan="2"><c:out value="${logined.memberId }"></c:out></td>  
			    	</tr>
				    <tr>
					   <th scope="row">이름</th>
				       <td colspan="2"><c:out value="${logined.memberName }"></c:out></td>
				    </tr>
				    <tr>
				       <th scope="row">가입날짜</th>
			     	   <td colspan="2"><%=eDate[0] %></td>
				    </tr>
				     <tr>
				       <th scope="row">E-mail</th>
				       <td><c:out value="${logined.email }"></c:out></td>
				      <td>
				      	<c:choose>
				      		<c:when test="${logined.isEmailAuth eq 'N'}">
				      			<a href="#" class="ck badge badge-danger" data-toggle="modal" data-target="#sendEmail">인증하기</a>
		      				</c:when>
				      		<c:when test="${logined.isEmailAuth eq 'Y'}">
				      			<div class="ck badge badge-success" role="alert">인증완료</div>
			      			</c:when>
				      	</c:choose> 
				      </td>				       
				    </tr>
				     <tr>				       
				      <th scope="row">Phone</th>
				        <td><c:out value="${logined.phone }"></c:out></td>
				      <td>		
			       	 	<c:choose>
			       	 		<c:when test="${logined.isPhoneAuth eq 'N'}">				      			
				      			<a href="#" class="ck badge badge-danger" onclick="sendSms();"  data-toggle="modal" data-target="#sendPhone">인증하기</a>
				      			<script>
					      			function sendSms(){
					      				console.log("문자인증");
					      				$.ajax({
					      					url:"${path}/member/sendSms",
					      					data:{
					      						"receiver": "${logined.phone }",
					      					},
					      					type:"post",
					      					success:function(result){
					      						if(result == "true"){
					      							console.log(result);
					      						}else{
					      							alert("인증번호 전송 실패");
					      						}					      						
					      					}
					      				});
					      			}
				      			</script>
				      		</c:when>
				      		<c:when test="${logined.isPhoneAuth eq 'Y'}">
				      			<div class="ck badge badge-success" role="alert">인증완료</div>
				      		</c:when>
			      		</c:choose>   
				      </td>
				    </tr>		 
				</table>
				<a href="${path }/member/updateInfo.do" class="btn btn-primary" >정보변경하자좀</a>		
			  <div class="menu card-body">		 	   
			 	 <button type="button" class="btn btn-outline-success"  data-toggle="modal" data-target="#changeInfo">정보 변경</button>
				 <button type="button" class="btn btn-outline-success" id="tt-btn" data-toggle="modal" data-target="#delete">회원 탈퇴</button>						
					<!--회원정보 변경  -->
					<div class="modal fade" id="changeInfo" tabindex="-1" role="dialog" aria-labelledby="changeInfoModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">정보변경</h5>				        
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					          <div class="form-group">
					            <label for="answer" class="form-control-label">보안을 위해 비밀번호를 한 번 더 입력해주세요.</label>
					            <input type="password" class="form-control" id="answer1" name="answer1" style="resize: none;">
					          </div>
					      </div>
					      <div class="modal-footer">					      	
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" onclick="updateCheck('change');">정보변경 하러가기</button>					        
					      </div>
					    </div>
					  </div>
					</div>										
					<!--탈퇴하기  -->
					<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>				        
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="ttMessage-div">
					          <div class="form-group">
					            <label for="answer" class="form-control-label">탈퇴하시면 2주 동안 가입이 제한됩니다.</label>
					            <label for="answer" class="form-control-label">보안을 위해 비밀번호를 한 번 더 입력해주세요.</label>
					          </div>
				              <div class="modal-body" id="pw-modal-div">
						          <div class="form-group">
						            <input type="password" class="form-control" id="answer2" name="answer2" style="resize: none;">
						          </div>
						      </div>
					      </div>
			       		<label for="answer" class="form-control-label" id="ttQ">탈퇴하시겠습니까?</label>					      	
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" id="delete" onclick="updateCheck('delete');">탈퇴하기</button>					        
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 이메일 인증 -->
											<div class="modal fade" id="sendEmail" tabindex="-1" role="dialog" aria-labelledby="sendEmailLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="sendEmailLabel">E-mail 인증하기</h5>				        
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						          <div class="form-group">
						          	 <div class="row"></div>
						           		 <label for="answer" class="form-control-label">E-mail을 확인해주세요.</label>
				           		 </div>
					           		 <div>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								        <button type="button" class="btn btn-primary" onclick="location.href='${path}/member/mailAuth'">인증메일 전송</button>
							        </div>					        
					          </div>
						      </div>
					    </div>
					  </div>
					</div>
					<!-- 문자인증 -->
					<div class="modal fade" id="sendPhone" tabindex="-1" role="dialog" aria-labelledby="sendPhoneLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="sendPhoneLabel">번호 인증하기</h5>				        
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					          <div class="form-group">
					            <label for="answer" class="form-control-label">문자로 전송된 인증번호를 입력해주세요.</label>
					            <input type="password" class="form-control" id="smsAnswer" name="smsAnswer" style="resize: none;">
					          </div>
					      </div>
					      <div class="modal-footer">					      	
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" onclick="phoneCheck();">인증하기</button>					        
					      </div>
					    </div>
					  </div>
					</div>
					<script>
						function phoneCheck(){
							$.ajax({
								url:"${path}/member/smsCheck",
								type:"post",
								data:{
									"code":$("#smsAnswer").val()
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
											
					  </div>
					</div>
				</div>		
			</div>
		</div>
		
		
</section>

<script>

 function updateCheck(answer) {
		var tt2="";
		if(answer==='change'){
			tt2=$('#answer1').val();
			console.log('1번:'+tt2);
		}
		else if(answer==='delete'){
			tt2=$('#answer2').val();
			console.log('2번:'+tt2);
		}
		console.log("last:"+tt2);
	    $.ajax({
	    	url:"${path}/member/checkPw.do",
	    	data:{"password":tt2, //입력받은 비밀번호
					"answer":answer}, //delete인지 아닌지
	    	success:function(data){
	    		console.log("이건데이타:"+data);
	    		if(data =='no'){
					alert("비밀번호가 올바르지 않습니다.");
					return;
	    		}
				else if(data=='ok'){
    				location.href="${path}/member/updateInfo.do";
				}		    			
				else if(data==='delete'){
    				alert('탈퇴되었습니다.');
    				location.href="${path}/";
    			}
    			else if(data==='noDelete'){
    				alert('탈퇴실패! 다시 시도해 주세요');
    				location.href="${path}/member/myInfo.do"
    			}
	    	}
	    });      
	}

</script>




<%-- <div class="card" style="width: 20rem;">
  <img class="img-thumbnail mx-auto d-block" src="${path }/resources/upload/profile/${logined.profileImageRe}" alt="Card image cap">
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
 --%>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>