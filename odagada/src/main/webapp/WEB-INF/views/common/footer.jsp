
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    @font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }	
    @font-face { font-family: 'BMJUA'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); font-weight: normal; font-style: normal; }   
    footer.fot{
      background-color: #f8f9fa;
    }
    footer button.btn.btn-success{
      background-color: rgb(0, 175, 76);
    }
    footer div address{
      text-align: center;
    }
    div.menu>ul li{
       display: inline;
       font-family: silgothic;
       font-size: 16px;
       font-weight: lighter;
    }
    div.menu>ul li>a{
       color: black;
    }
    div.footer_row{
       margin: 30px 0px 50px 50px;
    }
    @media (max-width: 768px){
       div.info{
          order: 2;
       }
       div.menu{
          order: 1;
          margin-bottom: 50px;
       }
       div.menu>ul{
          text-align:center;
       }
       div.info>address{
          text-align:left;
       }
       li.menu_list{
          margin-left: 8%;
       }
       
       div.footer_row{
       margin: 30px 0px 50px 0px;
         }
    }
    @media (min-width: 768px){
       div.menu>ul{
          float:right;
       }
       div.info>address{
          text-align:left;
       }
       li.menu_list{
          margin-left: 10%;
       }
       li.menu_list:nth-of-type(3) {
         margin-right: 120px;
      }
      div.footer_row{
          margin: 30px 0px 50px 50px;
       }
    }
}
	div address{
		font-family: silgothic;
	}
	
    </style>
      <footer>
         <div class="row footer_row">
               <div class="col-12 col-md-6 info">
                <address style="font-family: silgothic;">
                   (주)오다가다 (주)ODA-GADA 서울시 강남구 테헤란로 대표이사 : 송정하 <br/>
                   사업자등록번호 : 000-0000 <br/>
                   대표 전화 : 02-1234-5678(발신자 부담전화) 팩스 : 987-654321 (지역번호공통)<br/>
                   Email : Oda-Gada0329@OdaGada.com<br/>
              </address>
             </div> 
            <div class="col-12 col-md-6 menu">
               <ul>
                  <li class="menu_list">
                     <a href="${pageContext.request.contextPath}/board/boardList"><strong>공지사항</strong></a>
                  </li>
                  <li class="menu_list">
                     <a href="${pageContext.request.contextPath}/board/qnaList"><strong>Q&A</strong></a>
                  </li>
                  <li class="menu_list">
                     <a href="${pageContext.request.contextPath}/board/faqList.do"><strong>자주 묻는 질문</strong></a>
                  </li>                  
               </ul>
            </div>
          </div>          
      </footer>
</body>
</html>