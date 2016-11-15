<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
  /* function customize(imgObj){
    alert('file2 '+ imgObj.width());
  } */
  $(function (){
    $('#io_file2').load(function(){ // 태그 메모리 상주후 작동
      var width = $('#io_file2').width();
      if ($('#io_file2').width() > screen.width * 0.6){
        $('#io_file2').width('80%');      
      }
    });
  });

</script>
</head>
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  <div class='content_menu' style='width: 100%;'>
    <A href='./list.do?io_no=${itosVO.io_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}'></A>｜
    <A href='./create.do?io_no=${itosVO.io_no}'>등록</A>｜
    <A href='./update.do?io_no=${itosVO.io_no}&col=${searchDTO.col}&word=${searchDTO.word}'>수정</A>｜
    <A href='./reply.do?io_no=${itosVO.io_no }&col=${searchDTO.col}&word=${searchDTO.word}'>답변</A>｜
    <A href='./delete.do?io_no=${itosVO.io_no}'>삭제</A> ｜
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="io_no" value="${itosVO.io_no}">
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='io_title' class="form_group" style="width:150px;">제목 : </label>
            <span>${itosVO.io_title}</span><br>
          </li>
          <li>
            <label for='io_content' class="form_group" style="width:150px;">내용 : </label>
            <div>${itosVO.io_content}</div>
          </li>
          <li>
            <label for='io_cost' class="form_group" style="width:150px;">금액 : </label>
            <div>${itosVO.io_cost}</div>
          </li>
          <li>
            <label for="io_date" class="form_group" style="width:150px;">등록일 : </label>
            <span>${itosVO.io_date.substring(0, 16)}</span>
          </li>
          <li>
            <label for="io_file1" class="form_group" style="width:150px;">
            업로드 파일: 
            <c:if test="${itosVO.io_size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/itos/storage&filename=${itosVO.io_file2}'>${itosVO.io_file2}</A>  (${itosVO.size2Label})
            </c:if>
            </label>
            <div>
              <c:set var='io_file2' value="${fn:toLowerCase(itosVO.io_file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(io_file2, '.jpg')}">
                  <IMG id='io_file2' src='./storage/${itosVO.io_file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(io_file2, '.gif')}">
                  <IMG id='io_file2'  src='./storage/${itosVO.io_file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(io_file2, '.png')}">
                  <IMG id='io_file2'  src='./storage/${itosVO.io_file2}' onload="customize(this);">
                </c:when>
              </c:choose>
            </div>
          </li>
          <li class='right'>
            <button type="button" onclick="location.href='./reply.do?io_no=${itosVO.io_no }&io_no=${itosVO.io_no}&col=${searchDTO.col}&word=${searchDTO.word}'">답변</button>
            <button type="button" onclick="location.href='./list.do?io_no=${itosVO.io_no}&col=${searchDTO.col}&word=${searchDTO.word}'">목록보기</button>
            <button type="button" onclick="location.href='./update.do?io_no=${itosVO.io_no}&col=${searchDTO.col}&word=${searchDTO.word}'">수정</button>
            <button type="button" onclick="location.href='./delete.do?io_no=${itosVO.io_no}'">삭제</button>
          </li>
        </ul>
      </fieldset>
    </FORM>
  </DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 