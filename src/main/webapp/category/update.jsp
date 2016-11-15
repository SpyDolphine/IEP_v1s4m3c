<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>대분류 수정</title> 
 
<script type="text/javascript">
  $(function(){
   
  });
</script>
 
</head> 
<!-- ----------------------------------------- -->
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>대분류 수정</DIV>
 
<DIV class='content' style='width: 60%;'>
<FORM name='form_grp' method='POST' action='./update.do'>
<input type='hidden' name='categoryno' id='categoryno' value='${categoryVO.categoryno}'>
  <fieldset>
    <ul>
      <li>
        <label for='sort'>분류</label>
        <input type='text' name='sort' id='sort' value='${categoryVO.sort}' required="required">
      </li>
      <li>
        <label for='content'>출력 순서</label>
        <input type='text' name='seqno' id='seqno' value='${categoryVO.seqno}' required="required">
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