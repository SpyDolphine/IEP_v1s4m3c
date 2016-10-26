<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>등록</title> 
 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
</head> 

 
<DIV class='title'>등록</DIV>
 
<DIV class='content' style='width: 80%;'>
<FORM name='form_grp' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='form_grp' >제목</label>
        <input type='text' name='title' value='' size='60' required="required">
      </li>
      <li>
        <label class='form_grp' >내용</label><br>
        <TEXTAREA name='content' rows='10' cols='70'></TEXTAREA>
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