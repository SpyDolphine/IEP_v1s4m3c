<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<%
String url_address = request.getParameter("url_address"); // 로그인 후 이동할 주소
String me_no = request.getParameter("me_no"); // 로그인 후 이동할 주소
String me_nick = request.getParameter("me_nick"); // 로그인 후 이동할 주소
String me_grade = request.getParameter("me_grade"); // 로그인 후 이동할 주소


Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String ck_id = "";
String ck_id_save = "";
String ck_passwd = "";
String ck_passwd_save = "";
 
for (int i=0; i < cookies.length; i++){
  cookie = cookies[i];
  
  if (cookie.getName().equals("ck_id")){
    ck_id = cookie.getValue();         // test1
  }else if(cookie.getName().equals("ck_id_save")){
    ck_id_save = cookie.getValue();  // Y, N
  }else if (cookie.getName().equals("ck_passwd")){
    ck_passwd = cookie.getValue();         // test1@mail.com
  }else if(cookie.getName().equals("ck_passwd_save")){
    ck_passwd_save = cookie.getValue();  // Y, N
  }
}
%>
<title></title> 
 <style type="text/css">
 
 </style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">

</script>
</head> 
<!-- ----------------------------------------- -->
<body>
<!-- ----------------------------------------- -->
<div id="login">
<FORM name='frm' method='POST' action='./login.do'>
  <input type='hidden' name='url_address' value='<%=url_address %>'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='me_id'>아이디</label>
        <input type='text' name='me_id' id='me_id' value='<%=ck_id %>' style='width: 40%;' autocomplete="off" required="required">
        <label>
          <%
          if (ck_id_save.equals("Y")){
          %>
            <input type='checkbox' name='id_save' value='Y' checked="checked"> 저장
          <%
          }else{
          %>
            <input type='checkbox' name='id_save' value='Y'> 저장
          <%  
          }
          %>
        
        </label>
      </li>
      <li>
        <label class='label' for='me_pw'>패스워드</label>
        <input type='password' name='me_pw' id='me_pw' value='<%=ck_passwd %>' style='width: 40%;' autocomplete="off" required="required">
        <label>
          <%
          if (ck_passwd_save.equals("Y")){
          %>
            <input type='checkbox' name='passwd_save' value='Y' checked="checked"> 저장
          <%
          }else{
          %>
            <input type='checkbox' name='passwd_save' value='Y'> 저장
          <%  
          }
          %>
        </label>
      </li>
      <li class='center'>
        <button type='submit'>로그인</button>
        <button type='button' onclick="history.back();">취소</button>
        <a href="./create.do">회원가입</a>
      </li>
    </ul>
  </fieldset>
</FORM>
</div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 