<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="web.tool.Tool" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">

</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

  <div class='content_menu'>
    <A href='../blogcategory/list.do'>전체 게시판 목록</A> >
    <A href="javascript:location.reload();">새로고침</A>
  </div>

<DIV class='content' style='width: 90%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
    <input type='hidden' name='if_no' id='if_no' value='${ifVO.if_no}'>
  
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' size='70' id='title' value='${blogVO.title}' required="required">
      </li>
      <li>
        <textarea name='content' id='content'  rows='10' style='width: 100%;'>${blogVO.content}</textarea>
      </li>
<!--  <li>
        <label for='file'>Thumb 파일</label>추후 구현
        <input type="file" name='file1' id='file1' size='40' >
      </li> -->
      <li>
        <c:set var='file2' value="${fn:toLowerCase(blogVO.file2)}" />
        <c:choose>
          <c:when test="${fn:endsWith(file2, '.jpg')}">
             <IMG src='./storage/${blogVO.file1}'>
          </c:when>
          <c:when test="${fn:endsWith(file2, '.gif')}">
             <IMG id='file2'  src='./storage/${blogVO.file2}'>
          </c:when>
          <c:when test="${fn:endsWith(file2, '.png')}">
             <IMG id='file2'  src='./storage/${blogVO.file2}'>
          </c:when>
          <c:when test="${blogVO.file2.length() > 0}">
            ${blogVO.file2 } 
          </c:when>
        </c:choose>
      </li>
      
      <li>
        <label for='file2MF'>업로드 파일</label><!-- 추후 구현 -->
         <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
 
      <li class='right'>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do?if_no=${ifVO.if_no}'">목록[취소]</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<!-- -------------------------------------------- -->
</html> 
 