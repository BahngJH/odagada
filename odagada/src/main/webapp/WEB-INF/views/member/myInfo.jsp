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
		background-image: url(${pageContext.request.contextPath}/resources/images/person.png);
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



 div#enroll-container{width:400px; margin:0 auto;}
 div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
 .menu{text-align:center; font-weight:bold;}
 .info{margin-top:50px; margin-bottom: 50px;}
 #answer{height:50%;}
 .alert-div{size:10px;}
 #ttMessage-div{padding-bottom:0px;}
 #pw-modal-div{padding-bottom:0px; padding-top:0px;}
 #ttQ{margin-left:60%;}
 tr::before,tr::after {box-sizing: none; // 1}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">나의 오다, 가다</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/person.png">
</section>
<section class="container"  style="margin-top: 0px;">
   <div class="row">
      <div class="col-12 col-md-3">
         <div class="menu_list info list-group">
            <a class="list-group-item list-group-item-action active">나의 정보</a>
            <c:if test="${logined.isAdmin eq '0'}">
            <a href="${path }/member/myCarpool" class="list-group-item list-group-item-action">카풀 동승 내역</a>
            <c:if test="${driver ne null}">
            <a href="${path}/member/myDriver" class="list-group-item list-group-item-action">나의 드라이버 정보</a>
            <a href="${path }/driver/driverCarpool" id="driverCarpool" class="list-group-item list-group-item-action">등록한 카풀 내역</a>
         	</c:if>
         	</c:if>
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
			  <div class="menu card-body">
			  	<button type="button" class="btn btn-success btn-sm btn-block" data-toggle="modal" data-target="#changeInfo">정보변경</button>
		 		<button type="button" class="btn btn-outline-success btn-sm btn-block" id="tt-btn" data-toggle="modal" data-target="#delete">회원탈퇴</button>		 	   
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
				        	<button type="button" class="btn btn-success" onclick="updateCheck('change');">정보변경</button>
				        	<button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>					    			       
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
					        <button type="button" class="btn btn-outline-success" id="delete" onclick="updateCheck('delete');">탈퇴하기</button>					        
					        <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
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
						           		 <p><%=m.getEmail() %></p>
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



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>