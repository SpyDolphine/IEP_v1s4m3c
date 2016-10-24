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
window.onload=function(){
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
};
$(function (){
  // content: textarea name
  if (CKEDITOR.instances['content'].getData() == '') {
    window.alert('내용을 입력해 주세요.');
    CKEDITOR.instances['content'].focus();
    return false;
  }
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>공지사항 등록</DIV>
 
<DIV class='content' style='width: 70%;'>
<FORM name='frm' method='POST' action='./create.do'>
<input type='hidden' name='me_no' value='1'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='nt_title'>제목</label>
        <input type='text' name='nt_title' value='제목' required="required">
      </li>
      <li>
        <label class='label' for='content'>내용</label>
        <textarea name='nt_content' required="required" cols="100" rows="10"></textarea>
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
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
