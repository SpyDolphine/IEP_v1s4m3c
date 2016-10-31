<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상담공감방</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/JavaScript">
<script type="text/javascript">
  $(function() {
     $('#file2').load(function() {
       if ($('#file2').width() > screen.width * 0.8){
         $('#file2').width('50%');
       }
     });
   });
</script>
<style>
hr {
    margin: 0;
    padding: 0;
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
                              <i class="fa fa-arrow-circle-right"> 상담공감방</i> 
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
     <c:when test="${gfreeVO.cm_no == minlist }">
       <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">이전글</button>
     </c:when>
     <c:otherwise>
       <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${ejun.cm_no}'">
       이전글</button>
     </c:otherwise>
     </c:choose>
     
     <c:choose>
     <c:when test="${gfreeVO.cm_no == maxlist }">
       <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs">다음글</button>
     </c:when>
     <c:otherwise>
       <button style='font-size: 12px; color:black;' class="btn btn-default btn-xs" onclick="location.href='./read.do?cm_no=${daum.cm_no}'">
       다음글</button>   
     </c:otherwise>
     </c:choose>     
     </div>
     <div style='clear: both;'></div>

    <div class="write_content" style='width: 90%;'>
      <input type="hidden" name="cm_no" value="${gfreeVO.cm_no}">
      <div style='text-align: left;'>&nbsp;&nbsp;${gfreeVO.cm_title}</div><p style='text-align: right;'>
        <span style='color: #cccccc;'>${gfreeVO.cm_date.substring(0, 16)}</span> |
        <A href="./update.do?cm_no=${gfreeVO.cm_no}">수정</A> |
        <A href="./delete.do?cm_no=${gfreeVO.cm_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}"
            onclick="return confirm('삭제 하시겠습니까?')">삭제</A>
      </p>      
      <hr>
      &nbsp;<i class="fa fa-leaf"> ${gfreeVO.cm_nick}</i>
      <fieldset style='margin: 50px 0 0 0;'>
        <ul>
          <li>
            ${gfreeVO.cm_content}
          </li>

          <li>
            <label for="file1" style="width:150px;">업로드 파일: </label>
            <span>
            <c:if test="${gfreeVO.size2 > 0}">
             <A href='${pageContext.request.contextPath}/download?dir=/ifree/storage&filename=${gfreeVO.file2}'>${gfreeVO.file2}</A> (${gfreeVO.size2}KB)
            </c:if>
            </span>    
            <div id='fild2Panel'>
              <c:set var='file2' value="${fn:toLowerCase(gfreeVO.file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <IMG id='file2' src='./storage/${gfreeVO.file2}' >
                </c:when>
                <c:when test="${fn:endsWith(file2, '.gif')}">
                  <IMG id='file2'  src='./storage/${gfreeVO.file2}' >
                </c:when>
                <c:when test="${fn:endsWith(file2, '.png')}">
                  <IMG id='file2'  src='./storage/${gfreeVO.file2}' >
                </c:when>
              </c:choose>
            </div>
          </li>

        </ul>
      </fieldset>
      
      <div class='right'>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./reply.do?cm_no=${gfreeVO.cm_no}'">답글</button>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./list.do'">목록</button>
      </div>
      <div class='left'>
        댓글  
        ${gfreeVO.replycnt} | 
        좋아요
        ${gfreeVO.cm_likeit}    
      </div>
      <div style='clear: both;'></div>
<div style= 'margin: 5px 0 0 0;  position: relative;'> 
   <jsp:include page="./listmenu.jsp" flush='false' />
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