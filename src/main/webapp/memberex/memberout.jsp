<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

<title>회원 탈퇴</title> 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
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
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a></li>
                                <i class="fa fa-arrow-circle-right"> 회원 탈퇴</i>
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<div class="container">
<div class="dividerHeading">
  <h4><span><i class="fa fa-bullhorn"></i> 회원탈퇴(약관동의)</span></h4>
</div>

<div style="background-color: #f4f4f4; padding: 20px 0px;"> 
<div class='title' style='text-align: center;'>탈퇴 약관</div>
  <DIV class='content' style="text-align: center;">
    <FORM name='frm' method='POST' action='./memberout.do' onsubmit="return send();">
    <input type="hidden" id="me_no" name="me_no" value="${memberExVO.me_no }">
    <input type="hidden" id="me_vis" name="me_vis" value="n">
    <textarea cols="100" rows="4" readonly="readonly" style='resize: none;'>
    ① 탈퇴약관
     1. 탈퇴 후 동일한 아이디 및 닉네임 사용이 불가합니다.
     2. 이전에 스크랩 및 일정에 대한 정보는 복구가 불가합니다.
     3. 탈퇴 후 15일 안에 재가입은 불가합니다.
    </textarea> 
     <br>
     탈퇴약관에 동의 하시겠습니까? <br>
     약관에 동의합니다 <input type="checkbox" id="agree" name="agree"><br><br>
     <strong>개인정보 보호를 위한 아래 비밀 번호 입력 후 탈퇴 버튼 클릭하여 주시기 바랍니다.</strong>
     <br><br>
     비밀번호 : <input type="password" id="me_pw" name="me_pw">
     
    <button type="submit" class="btn btn-danger btn-xs"> 탈퇴 </button>
    <button onclick="javascript:history.back();" class="btn btn-default btn-xs"> 취소 </button>
  </FORM>
<!-- -------------------------------------------- -->
 </div>
 </div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 