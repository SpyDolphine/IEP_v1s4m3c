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
</head> 
<body>
 
  <div class='content_menu' style='width: 100%;'>
    <A href='../division/list.do'>목록</A> > 
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
<DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./create.do'
              enctype="multipart/form-data">
    <input type='hidden' name='me_no' value='1'>
      <!-- <input type='hidden' name='me_no' value='${me_no}'>  -->
    <input type='hidden' name='fq_CH' value='C'>
      <!-- <input type='hidden' name='fq_CH' value='${fq_CH}'>  -->
      <ul>
      <li>
        <label class='form_grp' for='content'>질문</label><br>
        <TEXTAREA name='fq_question' rows='10' cols='70'></TEXTAREA>
      </li>
      <li>
        <label class='form_grp' for='content'>답변</label><br>
        <TEXTAREA name='fq_answer' rows='10' cols='70'></TEXTAREA>
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">취소</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html> 