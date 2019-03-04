<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    footer.fot{
      background-color: #f8f9fa;
    }
    footer button.btn.btn-success{
      background-color: rgb(0, 175, 76);
    }
    footer div#btn{
      margin-left: 35.3%;margin-right:30%;	
    }
    footer div address{
      text-align: center;
    }
    </style>
		<footer>
			<div class="row" id="btn">
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<a href="${pageContext.request.contextPath}/board/boardList"><strong>공지사항</strong></a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><strong>자주 묻는 질문</strong></div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"><strong>고객센터</strong></div>
			</div>
			<hr/>
			<div class="row">
      			<div class="col-md-8 offset-md-2">
       			 <address>
			          (주)오다가다 (주)ODA-GADA 서울시 강남구 테헤란로 대표이사 : 송정하 
			          <br/>
			          사업자등록번호 : 000-0000 <br/>
			          대표 전화 : 02-1234-5678(발신자 부담전화) 팩스 : 987-654321 (지역번호공통)<br/>
			          Email : Oda-Gada0329@OdaGada.com<br/>
			     </address>
			    </div> 
			 </div> 			
		</footer>
</body>
</html>