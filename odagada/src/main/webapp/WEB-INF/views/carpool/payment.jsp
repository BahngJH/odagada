<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<section>

</section>

<script>



$(function(){
	var imp = window.IMP;
	imp.init('imp87992639');
	
	imp.request_pay({
		pg : 'inicis',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '주문명: 결제테스트',
		amount : 100,
		buyer_email : 'test@naver.com',
		buyer_name : '테스트',
		buyer_tel : '01028257863',
		buyer_addr : '서울시 강남구 삼성동',
		m_redirect_url : '${path}/'
	}, function(rsp){
		if(rsp.success){
			console.log(rsp);
		}else{
			console.log(rsp);
		}
	}
	
	
	)
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>