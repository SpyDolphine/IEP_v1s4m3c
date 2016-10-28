<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정모방</title>
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
                              <i class="fa fa-arrow-circle-right"> 글 쓰 기</i> 
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
    <div class="write_content" style='width: 90%;'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="cm_no" value="${cmVO.cm_no}">
      <p style='text-align: right;'>
        <A href="./reply.do?cm_no=${mfVO.cm_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">답변</A>｜
        <A href="./update.do?cm_no=${mfVO.cm_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">수정</A>｜
        <A href="./delete.do?cm_no=${mfVO.cm_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}"
            onclick="return confirm('삭제 하시겠습니까?')">삭제</A>
      </p>      
      <hr>
      <fieldset>
        <ul>
          <li>
            <label style="width:150px;">제목 : </label>
            <span>${cmVO.cm_title}</span><br>
          </li>
          <li>
            <label for='content' style="width:150px;">내용 : </label>
            <span>${cmVO.cm_content}</span>
          </li>
          <li>
            <label for="likeit" style="width:150px;">추천 수 : </label>
            <span>${cmVO.cm_likeit}</span>
          </li>
          <li>
            <label for="rdate" style="width:150px;">등록일 : </label>
            <span>${cmVO.cm_date.substring(0, 16)}</span>
          </li>
          <li>
            <label for="file1" style="width:150px;">업로드 파일: </label>
            <span>
            <c:if test="${cmVO.cm_size2 > 0}">
             <A href='${pageContext.request.contextPath}/download?dir=/mfree/storage&filename=${cmVO.cm_file2}'>${cmVO.cm_file2}</A> (${cmVO.cm_size2}KB)
            </c:if>
            </span>    
            <div id='fild2Panel'>
              <c:set var='file2' value="${fn:toLowerCase(cmVO.cm_file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(cm_file2, '.jpg')}">
                  <IMG id='file2' src='./storage/${cmVO.cm_file2}' >
                </c:when>
                <c:when test="${fn:endsWith(cm_file2, '.gif')}">
                  <IMG id='file2'  src='./storage/${cmVO.cm_file2}' >
                </c:when>
                <c:when test="${fn:endsWith(cm_file2, '.png')}">
                  <IMG id='file2'  src='./storage/${cmVO.cm_file2}' >
                </c:when>
              </c:choose>
            </div>
          </li>
          <li>
            <label for="replycnt" style="width:150px;">댓글수 : </label>
            <span>${cmVO.replycnt}</span>
          </li>
          <li class='right'>
            <button type="button" class="btn btn-default btn-xs" onclick="location.href='./reply.do?cm_no=${mfVO.cm_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}'">답변</button>
            <button type="button" class="btn btn-default btn-xs" onclick="location.href='./list.do'">목록</button>
          </li>
        </ul>
      </fieldset>
      
    </FORM>
  </DIV>
  </div>
 </div>
</div>
 
  <!-- -------------------------------------------- -->
</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html>