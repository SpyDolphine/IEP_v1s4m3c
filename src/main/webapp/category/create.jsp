<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>대분류 등록</title> 
 
</head> 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>대분류 등록</DIV>
 
<DIV class='content' style='width: 60%;'>
<FORM name='form_grp' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label for='sort'>분류</label>
        <input type='text' name='sort' id='sort' value='카테고리' required="required">
      </li>
      <li>
        <label for='content'>출력 순서</label>
        <input type='text' name='seqno' id='seqno' value='1' required="required">
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
</body>
<!-- -------------------------------------------- -->
</html> 