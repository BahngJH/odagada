<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*,com.spring.odagada.driver.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
	System.out.println(m);

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
		background-image: url(${pageContext.request.contextPath}/resources/images/driver1.png);
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

	.profile{
		margin-left:13px;
		margin-right:13px;
	}

	li { list-style: none }
	
	li.li_pass{
		font-size:14px;
		margin-top:-10px;
		margin-left:-10px;
	}

	label {
		text-align: left;
		padding-left : 0px;
	}
	#label_id {
		padding-left: 0px;
	}
	#label_name{
		padding-left: 0px;
	}
	.mar-div{
		margin-top:100px;
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

	function validate(){
	//자동차 사진 필수 입력
      var file_name = $('.custom-file-label').val();
      if(file_name == null){
    	  alert('자동차 사진을 첨부해주세요.');
    	  return false;
      }
      var carModelExp = /[ㄱ-ㅎ가-힣A-Za-z]/g;
      if(!carModelExp.test($("input[name=carModel]").val())){
    	  alert("자동차모델은 한글/영어만 입력해주세요");
    	  return false;
      }

      var carNum = $('#carNum').val();
      var carNumTest = /[0-9]{2} [가-힣]{1} [0-9]{4}/g;
      if(!carNumTest.test($("input[name=carNum]").val()))
    	  {
    	  	alert("정확한 자동차번호를 입력해주세요");
    	  	return false;
    	  }
	}
</script>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">나의 오다, 가다</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/driver1.png">
</section>
<div class="col-md-4 offset-md-4 mar-div">
	<form name="driverModify" action="${path }/member/myDriverModifyEnd" method="post" onsubmit="return validate();" enctype="multipart/form-data">
        <c:set value="${driver}" var="d"/>         
         <div id ="row">
         	<div id="col">
	         	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${carImg}" var="c" varStatus="t">					    
							<div class="carousel-item ${c.active}">
								<img class="d-block w-100" style="width: 500px;height: 350px;" src="${path }/resources/upload/car/${c.CARIMAGERE}" >
							</div>
						</c:forEach>
					</div>
				 	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			  			<span class="sr-only">이전</span>
				  	</a>
				  	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
				    	<span class="sr-only">다음</span>
				  	</a>
				</div>
			</div>
		</div>
		<br/>
		<div class="custom-file form-group row" style="margin-bottom: 10px;">
               <input multiple="multiple" type="file" class="custom-file-input" accept="image/*" name="upFile" id="upFile1" onchange="fileCheck(this)" required>
               <label class="custom-file-label profile" for="upFile1">자동차 사진</label>
	    </div>
	    <br/>
		<div class="form-group row">          		
			<!-- <label for="memberName" class="col-sm-3 col-form-label" id="label_birth">운전면허</label> -->
			<input type="text" class="form-control" value="${d.LICENSENUM}" name="licenseNum" id="licenseNum" readonly required>
		</div>
		<div class="form-group row">            		
			<!-- <label for="memberId" class="col-sm-3 col-form-label" id="label_id">자동차번호</label> -->
			<input type="text" class="form-control" name="carNum" id="carNum" maxlength="12" value="${d.CARNUM }" placeholder="자동차번호(ex. 12 가 1234)" required>
		</div>
        <div class="form-group row">
        	<!-- <label for="memberName" class="col-sm-3 col-form-label" id="label_name">자동차 모델</label> -->
      		<input type="text" class="form-control" value="${d.CARMODEL}" placeholder="자동차모델(ex. 아우디)" name="carModel" id="carModel" required>
        </div>
        <br/>
        <div class="row submitB">
        	<input type="hidden" name="oldCarNum" value="${d.CARNUM}"/>
          	<input type="hidden" name="memberNum" value="${logined.memberNum}"/>
          	<div class="col-12 text-center">
	            <input type="submit" class="btn btn-outline-success" id="enrollBtn" value="수정" >&nbsp;
	            <input type="reset" class="btn btn-outline-success" onclick="location.href='${path}/member/myDriver'" value="취소">
            </div>
        </div>
	</form>
</div>
<br/>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>