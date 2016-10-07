<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
$(function(){
 
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>공지사항 등록</DIV>
 
<DIV class='content' style='width: 50%;'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='nt_title'>제목</label>
        <input type='text' name='nt_title' id='nt_title' value='제목' required="required">
      </li>
      <li>
        <label for='nt_content'>글 내용</label><br>
        <textarea name='nt_content' id='nt_content' rows='10' style='width: 100%;' placeholder="내용을 입력해주세요" required="required"></textarea>
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