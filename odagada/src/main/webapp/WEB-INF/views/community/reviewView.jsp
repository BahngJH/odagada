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
	div#review-container {
	width: 500px;
	margin: 0 auto;
	}
	div#review-container ul{
	list-style:none;
	padding-left:0px;
	}
	div#review-container h3{
	text-align:center;
	}
	div#review-context{
	border: 1px solid #DDD;
    border-radius: 16px;
    height: 180px;
    margin-bottom: 10px;
    padding:10px;
    height: auto;
	}
	div#writerNum{
	text-align: left;
	margin-bottom:5px;
	}
	span#review-content{
	text-align: Left;
	}
	#rating{
	text-align:center;
	}
	#star{
	width:20px;
	height:20px;
	margin-bottom:3px;
	}
	/* 별점 css 테스트 */
	.star-rating 
	{ 
		width:150px; 
	}
	.star-rating,.star-rating span 
	{ 
		display:inline-block; 
		height:21px; 
		overflow:hidden; 
		background:url(${pageContext.request.contextPath}/resources/images/star1.png)no-repeat; 
	}
	.star-rating span
	{ 
		background-position:left bottom; 
		line-height:0; 
		vertical-align:top; 
	} 
	.star-rating span
	{ 
		background-position:left bottom; 
		line-height:0; 
		vertical-align:top; 
	}
	
	
</style>
<div id="review-container">
	<h3>리뷰</h3>
	<div style="overflow: scroll; height: 500px;">
		<div id="rating">
			<p><img id="star" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANUAAADsCAMAAADU6xPUAAAAe1BMVEX/////1QT/0wD+1gD//vj///z/3lP/+N3+/O//99r//fP/7ar//vb++uX+54v+7rL/4Wv+9c7/5YH/8b/+66L+5Xz++eL/9tP+8r3+++r+6Zf/2jD+3lb+2jn+43P/3EL/4GP+1x//6ZX/31//8b3+657+2j7+5of/88iVsIiQAAAGC0lEQVR4nO2dWXviOgxAsShLoQ17GZYEUpby/3/hDTDDdCghkm1Zzv10nvqoUyUmtmW50VAURVEURVEURVEURVEURVEURVGUckbJrgkFzXVyakkH44f3cWFkflP8lb1KR+ROd3szuomt36WjcmR673QV+5SOy4VW+6FUobXpScdmTTcvkSpo1vUpXJQqXfiQjs+Kl+Zzq2ZXOkIbNs+ljEmlI7Tgq/yd+g3MpGMkM6+UKrRG0lFSyauljMmloyTSR6SqSNZUOk4aFePfDek4SRxQqSqS1ZeOlEALm6paJevxN+3DZA2kY0XTQmeqTsPgEp2qIll76WiRvBBSZcxKOlwkn4RUFcmaSMeLgpaqunzkUt6qS7JO0hEjeCOmypiNdMgIErIVzKVjrqRHljJmLR10JQnxrbokK/Z1zzcLKWO20mFXYJOqIlkd6bif0rWSMiaTDvwpY0sriHnN0zZVcS832aaq0Ip3ybNnLWXgSzr4Umb2VgZi3SRZOEgZSKTDLyFzkCp4k47/IU6pKpK1lBZ4iGOq4lxEc0xVpMvTzqkyTWmFn2DXoJ8l6yAtccfbzl3KQESr7q3FfECf1Zd4ZfLD++tpmqxXxb/YQ55uDD/3rxKlTq3efL/M2pdyK486f7hUce3Gg1E3jFzv/dRPdkcunZ9um+F08sH3THYmy/Em9/ysIeVMvksGc99uH8t2iORUuIFpZ/3J4sWP0+AoK/Sds1uaDRauTv1mNEo3ANK+S8o6q/icLgAk1nNM/OZueMBYfgpnEUsVwNHm/RrGLXWGXgXlsrASCvhFlBrUQIq8S+k8rw0EkN6ttXS4WChlDaOapIpWGN+WDpYAen2+Lm/VGfz6/EE6VAqAnVtWlmzHBLYUj14GIsoOZ/VRo9fqDM5qUi8r5JYyrmg7GpCVeHWzwi34/j+tftXMCjcrfq2ZFS5XXek4aWDrdnPpQEkA8iThWDpQGsgPwfpMr860cVL4Y0YxgN+f9LDHGwx8pRDl9Io0W6xU3IvR/0IqRF5JR4sFObu60qlJsoiVrfUYMMh1JzXYPTCA/q26UYdFQYu9ufi1rMrFyxqJRILtUaC4s2V9CiPibDUdWpnEq+VUdRHpQ5g7HlWIUit3LumP7yGE1EONXXRaGy+Fg3Fpga+DuDFpAWnu8VxL2uUGbL1JxZMtGHqUajTWUWjB2KtUo/GjuaGElP8DdfLTSJZeitJaTMdIZLXYDpFIajG2OJLTIlc41kGLuQuLjBZ7txKRtWr2Fiz78MkK0KpEYBfI77ffY4J/vwfp3jkMbYXdznYieE1kkI5hoaWCdBgUqIkM0KYkfE1kiLZGdg2XnKwCtO7chZYK0nhfoG5myy5l3XHJAf7OnZhW3t5ht5KomuEfBGfhpQJ0WT1KWHF3/5E5Q8Ldh0/mDAn3ICgwEy4AZqvw30sXK+aeieG/ly5WzLNhESnurloObQ+d4O1vKVXpzttpeiojxbwgI/G9dIa3F6lU6TTvICi10cM6yRc7c+t97/47cmcDOTu4f0pJsbaBlGvmAZ5agT0il7Pi25eTWF/6Y8U3CEqeDOTrxyzZzshfVeA9MlPGK3zbPaL9tNiswu+d/oVvaJe0MmxWok8gm5XkaIFuUETGZWQHxz6sfB+C9r/CYGb9ST9x6F3KV55gcwnU1Wl8bcLbWhpbL8YJVmonNf676tCzvEeFczJMvTHuEs/s3/NfC6sKQ8416XdyQDD8eaatY1Hxz7orQqw3g+Hjf/EopV4TyHp3AGkUhG35gcpJTvPive4GP8eH9fM96j5hOGRdYmrg3yxoV1aVtpb4n2Xu2xBQ7cKgjVpmeEMO8wEKmarbS8MGvX6MGua9HiQro+LmEEhJBfWd6vNqYa7qffb/hZRc8TE6PvWCFeNS4HdK+5TAyupi5/2TYR7SYPemPG6yD7n1CZXSYR6CXuQ4uPcC2DhdwP3wax7y0PdEj7LC5BLKeT6YLl3rwl4O988h5CKXEXUGyXi7m31NR36e/XmSw41mVocronF05/1DwfQU8w2iiqIoiqIoiqIoiqIoiqIoiqIoiqIodeI/mLZvwjw/4IIAAAAASUVORK5CYII=">총${count}개의 리뷰가 있습니다.</p>
		</div>
		<c:if test="${empty list}">
			<h2 style="color: red; text-align: center;">달린 리뷰가 없습니다.</h2>
		</c:if>
		<c:forEach items="${list }" var="r">
			<ul id="review-list">
				<div id="review-context">
				<div id="driverNum">아이디
					<div class="star-div">
						<fmt:parseNumber value="${r.RGRADE}" type="number" var="rg" />
						<c:choose>
							<c:when test="${rg >=0 && rg <= 0.5 }">
								<span class="star-rating"> <span style="width: 7.6%"></span>
								</span>
							</c:when>
							<c:when test="${rg >0.5 && rg <= 1 }">
								<span class="star-rating"> <span style="width: 15.2%"></span>
								</span>
							</c:when>
							<c:when test="${rg >1 && rg <= 1.5 }">
								<span class="star-rating"> <span style="width: 22.8%">
								</span>
								</span>
							</c:when>
							<c:when test="${rg >1.5 && rg <= 2 }">
								<span class="star-rating"> <span style="width: 30.4%"></span>
								</span>
							</c:when>
							<c:when test="${rg >2 && rg <= 2.5 }">
								<span class="star-rating"> <span style="width: 38%"></span>
								</span>
							</c:when>
							<c:when test="${rg >2.5 && rg <=3.0 }">
								<span class="star-rating"> <span style="width: 45.6%"></span>
								</span>
							</c:when>
							<c:when test="${rg >3.0 && rg <= 3.5 }">
								<span class="star-rating"> <span style="width: 53.2%"></span>
								</span>
							</c:when>
							<c:when test="${rg >3.5 && rg <= 4.0 }">
								<span class="star-rating"> <span style="width: 60.8%"></span>
								</span>
							</c:when>
							<c:when test="${rg >4.0 && rg <= 4.5 }">
								<span class="star-rating"> <span style="width: 68.4%"></span>
								</span>
							</c:when>
							<c:when test="${rg >4.5 && rg <= 5.0 }">
								<span class="star-rating"> <span style="width: 76%;"></span>
								</span>
							</c:when>
						</c:choose>
					</div>
					<div id="review-content">
						<span id="rContent" name="rContent"><c:out value="${r.RCONTENT}"/></span>
						<br/>
						<br/>
						<span id="rDate"name="rDate"><c:out value="${r.RDATE }" /></span> <br /> 
					</div>
					</div>
				</div>
			</ul>
		</c:forEach>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>