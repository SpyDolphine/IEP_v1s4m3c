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
/* function send(){
  // document: HTML 문서 자체를 의미, document 객체를 통해
  //           HTML 태그에 접근 가능
  // <input type="checkbox" name="agree" value="1" >
  if (document.frm.agree.checked == false){
    alert('동의하셔야 탈퇴가 가능합니다.');
    return false; // 서브밋(전송) 중지
  }else {
    return true; // 서브밋(전송) 진행
    // alert('OK');
  }
}
 */
 function send() {
  if(!($('#agree').is(":checked"))){
    alert("위 내용에 동의 않으셨습니다.  동의 후에 탈퇴가 가능합니다.");
    $('#agree').focus();
    return false;
  }else if($.trim($('#me_pw').val())==''){
    alert("비밀번호 입력하여 주시기 바랍니다.");
    $('#me_pw').focus();
    return false;
  }else if($.trim($('#me_pw').val()) != <%=session.getAttribute("me_pw")%>){
    alert("비밀번호가 틀립니다. 다시 확인 후 입력하여 주시기 바랍니다.");
    return false;
  }else{
    return true;
  }
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body>
<!-- ----------------------------------------- -->
<div id="login">
<FORM name='frm' method='POST' action='./memberout.do' onsubmit="return send();">
<input type="hidden" id="me_no" name="me_no" value="${memberExVO.me_no }">
<input type="hidden" id="me_vis" name="me_vis" value="n">
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
 <button type="submit" > 탈퇴 </button>
 <button onclick="javascript:history.back();"> 취소 </button>
</FORM>
</div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 