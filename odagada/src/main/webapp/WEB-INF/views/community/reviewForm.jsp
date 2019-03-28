<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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



div#review-container {
	text-align: center;
	width: 50%;
}

div#review-container input {
	margin-bottom: 10px;
}

#review-container {
	height: 500px;
}
div#review-container textarea {
	height: 150px;
}
.info {
	margin-top: 50px;
	margin-bottom: 50px;
}


.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: top;
	background:url(${pageContext.request.contextPath}/resources/images/option-icon/star.png)no-repeat;
}

.star-input {
	white-space: nowrap;
}

.star-input>.input {
	display: inline-block;
	width: 100px;
	background-size: 100px;
	height: 19px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 10px;
	height: 0;
	padding: 19px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 100px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label{
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 10px;
	z-index: 10;
}

.star-input>.input>label[for="p2"] {
	width: 20px;
	z-index: 9;
}

.star-input>.input>label[for="p3"] {
	width: 30px;
	z-index: 8;
}

.star-input>.input>label[for="p4"] {
	width: 40px;
	z-index: 7;
}

.star-input>.input>label[for="p5"] {
	width: 50px;
	z-index: 6;
}

.star-input>.input>label[for="p6"] {
	width: 60px;
	z-index: 5;
}

.star-input>.input>label[for="p7"] {
	width: 70px;
	z-index: 4;
}

.star-input>.input>label[for="p8"] {
	width: 80px;
	z-index: 3;
}

.star-input>.input>label[for="p9"] {
	width: 90px;
	z-index: 2;
}

.star-input>.input>label[for="p10"] {
	width: 100px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 36px;
	text-align: right;
}

.star-input>output>b {
	font: bold 18px Helvetica, Arial, sans-serif;
	vertical-align: middle;
}
#rtitle{
	text-align:center;
	font-size:40px;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">나의 오다, 가다</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/person.png">
</section>
<section class="container" style="margin-top: 0px;">
	<div class="row">
		<div class="col-12 col-md-3">
			<div class="menu_list info list-group">
				<a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">나의 정보</a>
				<a href="${path }/member/myCarpool" class="list-group-item list-group-item-action  active">카풀 동승 내역</a>
				<c:if test="${driver ne null}">
				<a href="${path}/member/myDriver" class="list-group-item list-group-item-action">나의 드라이버 정보</a>
				<a href="${path }/driver/driverCarpool" id="driverCarpool" class="list-group-item list-group-item-action">등록한 카풀 내역</a>
				</c:if>
			</div>
		</div>
		<div class="col-12 col-md-9" id="review-container">	
			<div class="info col-12 col-sm-12 col-md-9">
				<form name="reviewFrm" action="${path}/community/reviewFormEnd.do?driverName=${review.driverName }&writerName=${review.memberName}" method="post" onsubmit="return validate();"> 
					<span id="rtitle">리뷰 작성</span>
					<br/>
					<textarea class="form-control" name="rContent" placeholder="내용입력" required></textarea>
					<br/>
					<span class="star-input">
						<span class="input">
							<input class="form-control" type="radio" name="rGrade" id="p1" value="0.5" required><label for="p1">0.5</label>
							<input class="form-control" type="radio" name="rGrade" id="p2" value="1"><label for="p2">1</label>
							<input class="form-control" type="radio" name="rGrade" id="p3" value="1.5"><label for="p3">1.5</label>
							<input class="form-control" type="radio" name="rGrade" id="p4" value="2"><label for="p4">2</label>
							<input class="form-control" type="radio" name="rGrade" id="p5" value="2.5"><label for="p5">2.5</label>
							<input class="form-control" type="radio" name="rGrade" id="p6" value="3"><label for="p6">3</label>
							<input class="form-control" type="radio" name="rGrade" id="p7" value="3.5"><label for="p7">3.5</label>
							<input class="form-control" type="radio" name="rGrade" id="p8" value="4"><label for="p8">4</label>
							<input class="form-control" type="radio" name="rGrade" id="p9" value="4.5"><label for="p9">4.5</label>
							<input class="form-control" type="radio" name="rGrade" id="p10" value="5"><label for="p10">5</label>
						</span>
					<output for="star-input"><b>0</b>점</output>
					</span>
					<br/>
					<br/>
					<input type="hidden" name="memberNum" value="${logined.memberNum}">
					<input type="hidden" name="driverNum" id="driverNum" value="${review.driverNum }"/>
					<input type="hidden" name="carpoolNum" id="carpoolNum" value="${review.carpoolNum }"/>
					<input type="hidden" name="memberName" id="memberName" value="${review.memberName }"/>
					<input type="hidden" name="driverName" id="driverName" value="${review.driverName }"/>
					<input type="submit" class="btn btn-outline-success" value="등록" >
					<input type="button" class="btn btn-outline-success" value="취소" onclick="location.href='${path}/member/myCarpool?memberNum=${logined.memberNum }';">
				</form>
			</div>
		</div>
	</div>
</section>
<script>
	/*별점 */
	var starRating = function(){
	var $star = $(".star-input"),
	    $result = $star.find("output>b");
		
	  	$(document)
		.on("focusin", ".star-input>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star-input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star-input :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".star-input label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".star-input>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("0");
	   		 	} else {
	     	 		$result.text($checked.next().text());
	    		}
	  	});
	};
	starRating();
	
	function validate()
	{
		var content = $("[name=rContent]").val();
		if(content.trim().length==0)
		{
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>