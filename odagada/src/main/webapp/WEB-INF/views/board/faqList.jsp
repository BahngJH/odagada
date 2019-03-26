<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle" />
</jsp:include>
<style>
#faqFrm {
	font-size: 30px;
	text-align: center;
}

#faqWrite {
	float: rigth;
}

ul.qanda {
	color: #000;
	list-style: none;
	margin: 0;
	padding: 0
}

.qanda li {
	border-radius : 20px;
	border: 1px solid #dddddd;
	margin: 1em 0;
	padding: 0
}

.qanda .question {
	cursor: pointer;
	display: block;
	font-size: 1.3em;
	font-weight: 300;
	padding: .75em 1.25em;
	position: relative
}

.qanda .answer {
	border-top: 1px dashed #dddddd;
	display: block;
	padding: .75em 1.25em
}

.qanda a {
	color: #ccc
}

.qanda .question {
	padding-left: 1.5em
}

.qanda .question:before {
	content: "+";
	font-weight: 700;
	position: absolute;
	left: .5em
}

.qanda .active:before {
	content: "-"
}
.photo-backround{
	background-image: url(${pageContext.request.contextPath}/resources/images/boardList3.png);
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 300px;
	margin-bottom: 30px;
	margin-top: 10px;
}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 자주 묻는 질문들! </h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/boardList3.png">
</section>
<section id="faq-container">
	<div class="col-md-6 offset-md-3" style="margin-top:100px;">
		<span>
		<c:set var="isAdmin" value="${logined.isAdmin}" />
		<c:if test="${isAdmin eq '1'}">
			<button type="button" class="btn btn-outline-success" style="float: right; margin-bottom: 5px;" onclick="location.href='${path}/board/faqForm.do';">글쓰기</button>
		</c:if>
		</span>
		<br/>
		<!-- <p id="faqFrm">자주 묻는 질문들!</p> -->
		<div>
		<ul class="qanda">
			<c:forEach var="f" items="${list}">
				<li>
				<strong class="question">Q : ${f.FTITLE }
					<c:if test="${isAdmin eq '1'}">
						<a style="float:right; font-size:10px; color:orange; margin-top: 7px;" onclick="location.href='${path}/board/faqDelete.do?faqNo=${f.FAQNO }';">삭제</a>
					</c:if>
					<c:if test="${isAdmin eq '1'}">
						<a style="float:right; font-size:10px; margin-right: 5px; margin-top: 7px; color:green" onclick="location.href='${path}/board/faqModify.do?faqNo=${f.FAQNO}';">수정</a>
					</c:if>
				</strong>
				<span class="answer"> A : ${f.FCONTENT } 
					<input type="hidden" name="faqNo" value="${f.FAQNO}" /> 
				</span>
				</li>
			</c:forEach>
		</ul>
		</div>
	</div>
</section>
<script>
	$(document).ready(function() {
		$('.answer').hide();
		$(".question").click(function() {
			var a = $(this).parent('li').find('.answer');
			if (a.css('display') == 'none') {
				$('.question').removeClass('active');
				$('.answer').slideUp('fast');
				a.slideDown();
				$(this).addClass('active');
			} else {
				a.slideUp();
				$(this).removeClass('active')
			}
		});
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>