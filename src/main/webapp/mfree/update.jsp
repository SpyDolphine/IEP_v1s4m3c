<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="web.tool.Tool" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
</head> 

<DIV class='content' style='width: 90%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
    <input type='hidden' name='cm_no' id='cm_no' value='${mfVO.cm_no}'>
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' size='70' id='title' value='${mfVO.cm_title}' required="required">
      </li>
      <li>
        <textarea name='content' id='content'  rows='10' style='width: 100%;'>${mfVO.cm_content}</textarea>
      </li>
<!--  <li>
        <label for='file'>Thumb 파일</label>추후 구현
        <input type="file" name='file1' id='file1' size='40' >
      </li> -->
      <li>
        <c:set var='file2' value="${fn:toLowerCase(mfVO.cm_file2)}" />
        <c:choose>
          <c:when test="${fn:endsWith(cm_file2, '.jpg')}">
             <IMG src='./storage/${mfVO.cm_file1}'>
          </c:when>
          <c:when test="${fn:endsWith(cm_file2, '.gif')}">
             <IMG id='file2'  src='./storage/${mfVO.cm_file2}'>
          </c:when>
          <c:when test="${fn:endsWith(cm_file2, '.png')}">
             <IMG id='file2'  src='./storage/${mfVO.cm_file2}'>
          </c:when>
          <c:when test="${mfVO.cm_file2.length() > 0}">
            ${mfVO.cm_file2 } 
          </c:when>
        </c:choose>
      </li>
      
      <li>
        <label for='file2MF'>업로드 파일</label><!-- 추후 구현 -->
         <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
 
      <li class='right'>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do?col=${searchDTO.col}&word=${searchDTO.word}'">목록[취소]</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html> 
 