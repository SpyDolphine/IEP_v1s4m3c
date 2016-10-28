<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<!-- ----------------------------------------- -->
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

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

<body>
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
</body>
    <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html>
