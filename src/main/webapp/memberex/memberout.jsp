<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

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
<FORM name='frm' method='POST' action='./memberout.do'>
 <p><b>회원 탈퇴</b></p>
 
 1. 탈퇴 후 동일한 아이디 및 닉네임 사용이 불가합니다.<br><br>
 2. 이전에 스크랩 및 일정에 대한 정보는 복구가 불가합니다.<br><br>
 3. 탈퇴 후 15일 안에 재가입은 불가합니다.<br><br>
 <br><br><br>
 탈퇴 하시겠습니다.<br><br>
 <input type="checkbox" id="agree" name="agree">동의 하시겠습니까?
 <br><br>
 개인정보 보호를 위한 아래 비밀 번호 입력 후 탈퇴 버튼 클릭하여 주시기 바랍니다.
 <br><br>
 비밀번호 : <input type="password" id="me_pw" name="me_pw">
 <br><br>
 <button id = "secession" name="secession"> 탈퇴 </button>
 
 <button id = "secession" name="secession"> 취소 </button>
</FORM>
</div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 