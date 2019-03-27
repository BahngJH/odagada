
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
    div.menu-1>ul li{
       display: inline;
       font-family: silgothic;
       font-size: 16px;
       font-weight: lighter;
    }
    div.menu-1>ul li>a{
       color: black;
    }
    div.footer_row{
       margin: 30px 0px 0px 50px;
    }
    @media (max-width: 768px){
       div.info-1{
          order: 2;
       }
       div.menu-1{
          order: 1;
          margin-bottom: 50px;
       }
       div.menu>ul{
          text-align:center;
       }
       div.info-1>address{
          text-align:left;
       }
       li.menu_list{
          margin-left: 8%;
       }
       
       div.footer_row{
       margin: 30px 0px 0px 0px;
         }
    }
    @media (min-width: 768px){
       div.menu>ul{
          float:right;
       }
       div.info-1>address{
          text-align:left;
       }
       li.menu_list{
          margin-left: 10%;
       }
       li.menu_list:nth-of-type(3) {
         margin-right: 120px;
      }
      div.footer_row{
          padding: 30px 0px 0px 50px;
          padding-bottom:50px;
       }
    }
}
	div address{
		font-family: silgothic;
	}
	.footer-mar{
		margin-top:10%;
		background-color:#f8f9fa;
	}
    </style>
      <footer class="footer-mar" id="footer-mar">
         <div class="row footer_row">
               <div class="col-12 col-md-6 info-1">
                <address style="font-family: BMJUA;">
                   (주)오다가다 (주)ODA-GADA  | 대표이사 : 송정하 <br/>
                   	 서울특별시 강남구 강남구 테헤란로14길 6 | 사업자등록번호 : 113-66-38270 <br/>
                  	 대표 전화 : 02-1234-5678(발신자 부담전화) | 팩스 : 987-654321 (지역번호공통)<br/>
                   Email : Oda-Gada0329@OdaGada.com<br/>
              </address>
             </div> 
            <div class="col-12 col-md-6 menu-1">
               <ul>
                  <li class="menu_list">
                     <a href="${pageContext.request.contextPath}/board/boardList" style="font-family: BMJUA;text-decoration: none;"><strong>공지사항</strong></a>
                  </li>
                  <li class="menu_list">
                     <a href="${pageContext.request.contextPath}/board/qnaList" style="font-family: BMJUA;text-decoration: none;"><strong>Q&A</strong></a>
                  </li>
                  <li class="menu_list" style="font-family: BMJUA;text-decoration: none;">
                     <strong>자주 묻는 질문</strong>
                  </li>                  
               </ul>
            </div>
          </div>          
      </footer>
</body>
</html>