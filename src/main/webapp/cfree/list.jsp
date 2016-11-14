<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/JavaScript" src="../js/jquery.easing.1.3.js"></script>     
<script type="text/javascript">

 // 추천
 function likeup(cm_no){ // 응답 처리 함수
    var params = 'cm_no=' + cm_no;
    $.get('./likeup.do', params, likeup_res, 'json');
    //alert('성공' + cm_no);
 }
 
 function likeup_res(data){ // 응답 처리 함수
   //alert('로그인이 필요합니다');
   //return false;
   $('#test_like' + data.cm_no).html(data.likeup);  
 }
 
 // 비추천
 function likedown(cm_no){ // 응답 처리 함수
   var params = 'cm_no=' + cm_no;
   $.get('./likedown.do', params, likedown_res, 'json');
   //alert('성공' + cm_no);
 }

 function likedown_res(data){ // 응답 처리 함수
   $('#test_unlike' + data.cm_no).html(data.likedown);  
 }
 
//-----------------------------------------------------------------------------------------------------------------//

 //iframe resize
  function autoResize(i)
 {
     var iframeHeight=
     (i).contentWindow.document.body.scrollHeight;
     (i).height= iframeHeight/2 + 120;
 }   
 
/*   function autoResize(i){
   var resizeHeight = $("#reply").height();
   (i).contentWindow.document.body.scrollHeight + 200;
   (i).height= resizeHeight + 150;
 } */
 
 $(document).ready(function(){
   $(".menu>a").click(function(){
       $(this).next("div").toggleClass("hide");
   });
});
 
</script>
<style>
.hr > hr {
 margin: 10px 0 10px 0;
 padding: 0;
}

.comment_area > hr {
 margin: 0;
 padding: 0;
}

.comment_area {
    background-color: #fafafa;
}


</style>
<style>
.hr > hr {
 margin: 10px 0 10px 0;
 padding: 0;
}

.comment_area > hr {
 margin: 0;
 padding: 0;
}

.comment_area {
    background-color: #fafafa;
}


</style>
</head>
 
<section class="wrapper">
  <section class="page_head">
      <div class="container">
           <div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12">
                      <nav id="breadcrumbs">
                          <ul>
                              <li><a href="../index.jsp">Home</a>/</li>
                              <li><A href='./list.do'>목록</A></li>
                              <i class="fa fa-arrow-circle-right"> 자유게시판</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>
        
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
     <div class="write_content" style='width: 90%;'>
        <FORM name='frm' id='frm' method='POST' action='./create.do'>
          <input type="hidden" name="cm_no" value="0"> 
          <input type="hidden" name="cm_nick" value="nick"> <!-- 임시값 -->
                <div class="span3 offset1">
                  <label for='cm_nick'><i class="fa fa-leaf"> nick </i></label> 
                </div>
                <div class="span3 offset2">                  
                  <input type="text" class="form-control" name='cm_title' id='cm_title' placeholder='제목을 입력하세요' required="required">
                </div>
                <br>
                <textarea  rows="5" class="form-control" name='cm_content' id='cm_content' 
                placeholder='취업 준비생들의 소통 공간을 위한 자유 게시판 입니다. 저작권등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정계층/민족,종교등을 비하하는 댓글은 임의로 삭제될 수 있습니다.' required="required"></textarea>
                <button type="submit" id='submit' class="btn btn-success btn-xs" style='float:right; margin: 5px;'>
                <i class="fa fa-pencil"></i> 등록</button>
                <div style='clear:both;'></div>
        </FORM>
     </div>
  <hr>

<!-- 리스트 출력 --> 
<div class="write_content" style='width: 90%;'>
<TABLE class='table'>
  <c:forEach var="cmVO" items="${list }">
      <input type="hidden" name="cm_no" value="${cmVO.cm_no}">
      <div style='float: left;'>&nbsp;&nbsp;${cmVO.cm_title}</div> &nbsp;|&nbsp;<i class="fa fa-leaf"> ${cmVO.cm_nick}</i>
      <p style='float: right;'>
        <span style='color: #cccccc;'>${cmVO.cm_rdate.substring(0, 10)}</span> &nbsp; &nbsp;
           <A href="./update.do?cm_no=${cmVO.cm_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}"><i class="fa fa-pencil"></i></A>
           <a href="./delete.do?cm_no=${cmVO.cm_no }" onclick="return confirm('삭제 하시겠습니까?')"><i class="fa fa-trash-o"></i></a>
      </p>      
      <div class="hr"><hr></div>
      <div class='right'>
        <button id="likeup" onclick="likeup(${cmVO.cm_no})" class="btn btn-default btn-xs btn-alt"> 
        <i class="fa fa-thumbs-o-up" style="color:red;"></i> 추천(<SPAN id='test_like${cmVO.cm_no }'>${cmVO.likeup}</SPAN>)</button>
        <button id="likedown" onclick="likedown(${cmVO.cm_no})" class="btn btn-default btn-xs btn-alt" >
        <i class="fa fa-thumbs-o-down" style="color:blue;"></i> 비추천(<SPAN id='test_unlike${cmVO.cm_no }'>${cmVO.likedown}</SPAN>)</button>
      </div>
      <div style='clear: both;'></div>
      <div style='clear: both;'></div>
      
      <fieldset style='margin: 10px 0 0 0;'>
        <ul>
          <li>
            ${cmVO.cm_content}
          </li>
        </ul>
      </fieldset>
<!------------------------------------------------- 댓글 시작  --------------------------------------------->
<div class="menu">
  <a href='#' onclick="alert('로그인이 필요합니다'); return false;" class="btn btn-primary btn-xs btn-alt">
  <i class="fa fa-comments-o"></i> 댓글</a> 
   <div class="hide"> 
   <iframe id="iframe" width="100%" onload="autoResize(this)" frameborder="0" src="../reply/replylist.do?cm_no=${cmVO.cm_no }"></iframe>
   </div>
</div>   
<!------------------------------------------------- 댓글 종료  --------------------------------------------->   
   <hr>   
  </c:forEach>
</TABLE>
</div>
</div>
</div>
</div>
<br>
<form name="frmSearch" method="get" action="./list.do">  
<DIV class='bottom'>
  <div style='text-align: center;'>
     <select name="col"> 
      <option value="">선택</option> 
      <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
      <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
      <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
      <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
    </select>
    <c:choose>
      <c:when test="${searchDTO.col != 'total' }">
        <input type="text" name="word" size="15" value="${searchDTO.word }">
      </c:when>
      <c:when test="${searchDTO.col == 'total' }">
        <input type="text" name="word" size="15" value="">
      </c:when>
      
    </c:choose>
     
    <input type="submit" value="검색"> 
    <DIV class='bottom'>${paging}</DIV>
  </div>
</DIV>
</form>
<!-- -------------------------------------------- -->

<div style= 'margin: 100px 0 0 0;  position: relative;'>      
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 
 