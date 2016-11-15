<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dev.mvc.memberEx.MemberExVO" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String root = response.getContentType();
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="./jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
function send(){
  // 패스워드 동일한지 검사
  if ($('#me_pw').val() == $('#me_pw2').val()){ 
    return true; // 변경 계속 진행
  }else{
    $('#panel_passwd').css('color', '#FF0000');
    $('#panel_passwd').html('패스워드가 일치하지 않습니다.');
    $('#me_pw').focus();
    return false;      
  }
}
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<DIV class='title'>패스워드 변경</DIV>
 
<DIV class='content' style='width: 60%;'>
<FORM name='frm' method='POST' action='./passwd.do'   onsubmit = 'return send();'>
  <input type='hidden' name='me_no' value='${me_no}'>         
  <fieldset>
    <ul>
      <li>
        <label class='label' for='old_passwd' style='width: 200px;'>현재 패스워드</label>
        <input type='password' name='old_passwd' id='old_passwd' value='${me_pw }' required="required">
      </li>
      <li>
        <label class='label' for='me_pw' style='width: 200px;'>새로운 패스워드</label>
        <input type='password' name='me_pw' id='me_pw'  required="required">
        <br>
        
      </li>
      <li>
        <label class='label' for='me_pw2' style='width: 200px;'>새로운 패스워드 확인</label>
        <input type='password' name='me_pw2' id='me_pw2'  required="required">
        <span id='panel_passwd'></span>
      </li>    
      <li class='right'>
        <button type="submit" onclick=" self.close();">변경</button>
        <button type="button">취소</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 