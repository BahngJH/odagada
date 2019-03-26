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
		background-image: url(${pageContext.request.contextPath}/resources/images/boardList3.png);
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
	table thead th#boardTitle{
	/* font-weight: bold; */
	font-size: 25px;
	text-align: center;
	font-family: silgothic;
	}
	div div#bTITLE{
	font-weight: bold;
	font-size: 30px;
	text-align: center;
	color:#393939;
	
	}
	hr {
  	border-top: 1px dashed #bbb;
	}
	#board-container{
		margin-top: 50px;
		margin-bottom: 30px;
	}

   section div h2 {
      text-align: center;
      font-weight: bold;
   }
</style>
<script>
$(function(){
      $('[name=upFile]').on('change',function(){
         var filename=this.files[0].name;
         $(this).next('.custom-file-label').html(filename);
      });
    });   
   function validate(){
      var content = $("[name=boardContent]").val();
      if(content.trim().length==0)
         {
            alert("내용을 입력하세요.");
            return false;
         }
      return true;
   }
</script>

<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다의 새로운 소식</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/boardList3.png">
</section>

<section id="board-container" class="container">
   <form name="boardFrm" action="${path}/board/boardModifyEnd?boardNo=${board.BOARDNO}" method="post" onsubmit="return validate();" enctype="multipart/form-data">
   <div class="col-8 col-md-8 offset-md-2" style="padding-left: 0px;padding-right: 0px;">
      <hr/>      
   </div>
   <div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
      <input type="text" class="form-control" placeholder="제목" name="bTitle" id="bTitle" value="${board.BTITLE}" required/>      
   </div>
      <div class="col-md-6 offset-md-3" style="padding:0px;">
         <div class="input-group mb-3">
            <div class="custom-file">
               <div class="input-group-prepend" style="padding:0px;">
                  <span class="input-group-text">첨부파일</span>
               </div>
               <div class="custom-file">
                       <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                       <label class="custom-file-label" for="upFile1"><c:out value="${board.BORIFILENAME}"/></label>
                       <input type="hidden" name="upFile2" id="upFile2" value="${board.BORIFILENAME}"/>
                       <input type="hidden" name="upFile3" id="upFile3" value="${board.REFILENAME }"/>
                    </div>
                </div>
         </div>
      </div>
      <br/>
      <div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
         <textarea class="form-control" name="bContent" placeholder="내용" required>${board.BCONTENT}</textarea><br/>
      </div>      
      <div class="col-6 col-md-6 offset-md-3" style="text-align: center;">
         <input type="hidden" name="boardNo" value="${board.BOARDNO}"/>
         <input type="submit" class="btn btn-outline-success" value="수정">
         <input type="button" class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/boardList';" value="취소">
      </div>
   </form>
</section>
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 