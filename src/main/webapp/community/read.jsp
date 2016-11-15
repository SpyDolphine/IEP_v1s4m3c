<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {
     $('#file2').load(function() {
       if ($('#file2').width() > screen.width * 0.8){
         $('#file2').width('50%');
       }
     });
   });
  
  // 좋아요
  function likeit(cm_no){ // 응답 처리 함수
     var params = 'cm_no=' + cm_no;
     $.get('./likeit.do', params, likeit_res, 'json');
     alert('성공' + cm_no);
  }
  
  function likeit_res(data){ // 응답 처리 함수
    if(data.cookie != null) {
      $('#likeit').html('<i class="fa fa-heart" style="color:#ff1ab3"></i> 좋아요 <SPAN id="likeit_test" style="font-weight: bold;">${commuVO.cm_likeit }</SPAN>');
      $('#likeit_test').html(data.cm_likeit);
    } else {
      $('#likeit').html('<i class="fa fa-heart-o" style="color:#ff1ab3"></i> 좋아요 <SPAN id="likeit_test" style="font-weight: bold;">${commuVO.cm_likeit }</SPAN>');
      $('#likeit_test').html(data.cm_likeit);      
    }
  }  
  
//--------댓글관련 ---------------------------------------------------  
 //iframe resize
  function autoResize(i)
 {
     var iframeHeight=
     (i).contentWindow.document.body.scrollHeight;
     (i).height= iframeHeight/2 + 120;
 }  

$(document).ready(function(){
  $(".menu>a").click(function(){
      $(this).next("div").toggleClass("hide");
  });
});
  
</script>
<style>
hr {
    margin: 0;
    padding: 0;
}

.map {
  margin : 30px 30px 50px 38px;
  
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
                              <c:choose>
                                <c:when test="${commuVO.cm_ch eq 'A'}">
                                  <li><A href='./listA.do'>목록</A></li>
                                  <i class="fa fa-arrow-circle-right"> ${chA }</i> 
                                </c:when>
                                <c:when test="${commuVO.cm_ch eq 'B'}">
                                  <li><A href='./listB.do'>목록</A></li>
                                  <i class="fa fa-arrow-circle-right"> ${chB }</i> 
                                </c:when>
                                <c:when test="${commuVO.cm_ch eq 'C'}">
                                  <li><A href='./listC.do'>목록</A></li>
                                  <i class="fa fa-arrow-circle-right"> ${chC }</i> 
                                </c:when>                                
                              </c:choose>
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>

<body>
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">

   <!-- 게시글 상단 버튼 -->
     <div class="left" style='position: relative; left: 5%;'>
      <c:choose>
        <c:when test="${commuVO.cm_ch eq 'A'}">
           <c:choose>
           <c:when test="${commuVO.cm_no == minlistA }">
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">이전글</button>
           </c:when>
           <c:otherwise>
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${ejun.cm_no}'">
             이전글</button>
           </c:otherwise>
           </c:choose>
           
           <c:choose>
           <c:when test="${commuVO.cm_no == maxlistA }">
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">다음글</button>
           </c:when>
           <c:otherwise>
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${daum.cm_no}'">
             다음글</button>   
           </c:otherwise>
           </c:choose>
        </c:when>
        
        <c:when test="${commuVO.cm_ch eq 'B'}">
           <c:choose>
           <c:when test="${commuVO.cm_no == minlistB }">
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">이전글</button>
           </c:when>
           <c:otherwise>
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${ejun.cm_no}'">
             이전글</button>
           </c:otherwise>
           </c:choose>
           
           <c:choose>
           <c:when test="${commuVO.cm_no == maxlistB }">
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">다음글</button>
           </c:when>
           <c:otherwise>
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${daum.cm_no}'">
             다음글</button>   
           </c:otherwise>
           </c:choose>         
        </c:when>
        
        <c:when test="${commuVO.cm_ch eq 'C'}">
           <c:choose>
           <c:when test="${commuVO.cm_no == minlistC }">
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">이전글</button>
           </c:when>
           <c:otherwise>
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${ejun.cm_no}'">
             이전글</button>
           </c:otherwise>
           </c:choose>
           
           <c:choose>
           <c:when test="${commuVO.cm_no == maxlistC }">
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">다음글</button>
           </c:when>
           <c:otherwise>
             <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${daum.cm_no}'">
             다음글</button>   
           </c:otherwise>
           </c:choose>         
        </c:when>        
      </c:choose>
     </div>
     <div style='clear: both;'></div>

    <div class="write_content" style='width: 90%;'>
      <input type="hidden" name="cm_no" value="${commuVO.cm_no}">
      <div style='text-align: left;'>&nbsp;&nbsp;${commuVO.cm_title}</div><p style='text-align: right;'>
        <span style='color: #cccccc;'>${commuVO.cm_date.substring(0, 16)}</span> |
        <A href="./update.do?cm_no=${commuVO.cm_no}">수정</A> |
        <A href="./delete.do?arr=${commuVO.cm_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}"
            onclick="return confirm('삭제 하시겠습니까?')">삭제</A>
      </p>      
      <hr>
      &nbsp;<i class="fa fa-leaf"> ${commuVO.cm_nick}</i>
      <fieldset style='margin: 50px 0 0 0;'>
        <ul>
          <li>
            ${commuVO.cm_content}
          </li>

          <li>
            <label for="file1" style="width:150px;">업로드 파일: </label>
            <span>
            <c:if test="${commuVO.size2 > 0}">
             <A href='${pageContext.request.contextPath}/download?dir=/community/storage&filename=${commuVO.file2}'>${commuVO.file2}</A> (${commuVO.size2}KB)
            </c:if>
            </span>    
            <div id='fild2Panel'>
              <c:set var='file2' value="${fn:toLowerCase(commuVO.file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <IMG id='file2' src='./storage/${commuVO.file2}' >
                </c:when>
                <c:when test="${fn:endsWith(file2, '.gif')}">
                  <IMG id='file2'  src='./storage/${commuVO.file2}' >
                </c:when>
                <c:when test="${fn:endsWith(file2, '.png')}">
                  <IMG id='file2'  src='./storage/${commuVO.file2}' >
                </c:when>
              </c:choose>
            </div>
          </li>
        </ul>
      <br>
      <div class='map'>  
        ${commuVO.cm_map}
      </div>        
      <div class='right'>                   
        출처 : ${commuVO.cm_url}
      </div>  
      </fieldset>
      
      <div class='right'>
       <button id="likeit" onclick="likeit(${commuVO.cm_no})" class="btn btn-default btn-xs btn-alt" >
       <i class="fa fa-heart-o" style="color:#ff1ab3"></i> 좋아요 <SPAN id='likeit_test' style='font-weight: bold;'>${commuVO.cm_likeit }</SPAN></button>
         
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./reply.do?cm_no=${commuVO.cm_no}'">답글</button>
        <c:choose>
          <c:when test="${commuVO.cm_ch eq 'A'}">
            <button type="button" class="btn btn-default btn-xs" onclick="location.href='./listA.do'">목록</button>
          </c:when>
          <c:when test="${commuVO.cm_ch eq 'B'}">
            <button type="button" class="btn btn-default btn-xs" onclick="location.href='./listB.do'">목록</button>
          </c:when>
          <c:when test="${commuVO.cm_ch eq 'C'}">
            <button type="button" class="btn btn-default btn-xs" onclick="location.href='./listC.do'">목록</button>
          </c:when>          
        </c:choose>         
      </div>
<!------------------------------------------------- 댓글 시작  --------------------------------------------->      
      <div class="menu">
        <a href='#' onclick="alert('로그인이 필요합니다'); return false;" class="btn btn-primary btn-xs btn-alt">
        <i class="fa fa-comments-o"></i> 댓글 ${replycnt}</a> 
         <div class="hide"> 
         <iframe id="iframe" width="100%" onload="autoResize(this)" frameborder="0" src="../commuReply/replylist.do?cm_no=${commuVO.cm_no }"></iframe>
         </div>
      </div> 
<!------------------------------------------------- 댓글 종료  --------------------------------------------->   
      <div style='clear: both;'></div>
<div style= 'margin: 5px 0 0 0;  position: relative;'> 
  <c:choose>
    <c:when test="${commuVO.cm_ch eq 'A'}">
      <jsp:include page="./listmenuA.jsp" flush='false' />
    </c:when>
    <c:when test="${commuVO.cm_ch eq 'B'}">
      <jsp:include page="./listmenuB.jsp" flush='false' />
    </c:when>
    <c:when test="${commuVO.cm_ch eq 'C'}">
      <jsp:include page="./listmenuC.jsp" flush='false' />
    </c:when>    
  </c:choose>
</div> 
  </DIV>
  </div>
 </div>
</div>
  <!-- -------------------------------------------- -->
</body>
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
    <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>     
<!-- -------------------------------------------- -->
</html>