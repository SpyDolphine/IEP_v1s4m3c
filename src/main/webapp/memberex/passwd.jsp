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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
<style>
 .scrap_pop {
    text-align: left;
    margin: 5% 15%;
 }
 
 hr {
  border: 3px solid #004d00;
  margin: 8px 50px;
  paddig: 8px 10px;
 }
 
 i {
  margin: 50px 0 0 55px;
  color : #004d00;
 }
</style>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<i class='fa fa-unlock-alt'> 비밀번호 변경</i>
<hr>
 
<DIV class='content' style='width: 100%;'>
<FORM name='frm' method='POST' action='./passwd.do'   onsubmit = 'return send();'>
  <input type='hidden' name='me_no' value='${me_no}'>     
  <div class='scrap_pop'>    
    <fieldset>
      <ul>
        <li>
          <label for='old_passwd' style='width: 200px;'>현재 패스워드</label>
          <input type='password' name='old_passwd' id='old_passwd' value='${me_pw }' required="required">
        </li>
        <li>
          <label for='me_pw' style='width: 200px;'>새로운 패스워드</label>
          <input type='password' name='me_pw' id='me_pw'  required="required">
          <br>
          
        </li>
        <li>
          <label for='me_pw2' style='width: 200px;'>새로운 패스워드 확인</label>
          <input type='password' name='me_pw2' id='me_pw2'  required="required">
          <span id='panel_passwd'></span>
        </li>    
      </ul>
    </fieldset>
  </div>
        <DIV class='right' style='margin: 0 50px 0 0;'>
          <button type="submit" class="btn btn-default btn-xs" onclick="send();">변경</button>
          <button type="button" class="btn btn-default btn-xs" onclick="location.href=self.close();">취소</button>
        </DIV>      
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 