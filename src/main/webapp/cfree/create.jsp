<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>자유게시판</title> 
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>새 글 등 록</DIV>
 
<DIV class='content' style='width: 50%;'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label for='cm_nick'>닉네임</label>
        <input type='text' name='cm_nick' id='cm_nick' value='닉네임' required="required">
      </li>
      <li>
        <label for='cm_title'>글 제목</label>
        <input type='text' name='cm_title' id='cm_title' value='제목' required="required">
      </li>
      <li>
        <label for='cm_content'>글 내용</label><br>
        <textarea name='cm_content' id='cm_content' rows='10' style='width: 100%;' placeholder="내용을 입력해주세요" required="required"></textarea>
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