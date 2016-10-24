<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
String root = request.getContextPath();
 MemberExVO memberExVO = new MemberExVO();
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="./css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
  *{
     padding: 0px; margin: 0px;
   }

</style>
<script type="text/javascript">
function open_win(){
  window.open('<%=root%>/memberex/memberexv1_join.jsp','popup', 'width=500, height=300,left=200px,top=200px');
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->

    <c:if test="${empty sessionScope.me_id }">
      <a class='menu_link' href='./memberex/login.do'>로그인</a> |
      <a class='menu_link' href='./memberex/create.do'>회원가입</a> |
      <a class='menu_link'  onclick="javascript:open_win();">회원가입</a> |
  </c:if> 
  <c:if test="${not empty sessionScope.me_id}">
   ${ sessionScope.me_nick} 님 환영합니다. <br>
         <a class='menu_link' href='./memberex/logout.do'>로그 아웃</a> |
    <c:if test="${sessionScope.me_grade eq 'A'}">
      <a class='menu_link' href='./memberex/memberlist.do'>회원 목록</a> |
     </c:if>
      <a class='menu_link' href='./memberex/read.do?me_no=${sessionScope.me_no }'>회원관리 수정</a> |
      <a class='menu_link' href = '<%=root %>/board/list.do'>게시판</a>|
      <a class='menu_link' href = '<%=root %>/scrap/sp_list.do'>스크랩 함</a>|
      <a class='menu_link' href = '<%=root %>/calender/cl_list.do'>일정</a>|
  </c:if>

 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 