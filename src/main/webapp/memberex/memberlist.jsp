<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.memberEx.MemberExVO" %>
  <%
  String root = request.getContextPath();
 %>
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
<body style="text-align: center">
<!-- ----------------------------------------- -->

<DIV class='title'>회원 목록</DIV>
 <div>
<TABLE class='table' style="width: 80%; text-align: center">
  <caption>최고 관리자님 환영합니다..</caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 30%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
<col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>아이디</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>권한</TH>
    
  </TR>
 
<c:forEach var= "vo" items="${memberlist }">

 
  <TR>
    <TD class='td'>${vo.me_no }</TD>
    <TD class='td'><A href="./read.do?me_no=${vo.me_no }">${vo.me_id}</A></TD>
    <TD class='td'><A href="./read.do?me_no=${vo.me_no }">${vo.me_name } </A></TD>
    <TD class='td'>${vo.me_nick } </TD>
    <TD class='td'>
     <c:choose>
        <c:when test="${vo.me_addr1.length() > 15 }">
         ${vo.me_addr1.substring(0,15) }...
        </c:when>
        <c:otherwise>
        ${vo.me_addr1 }
        </c:otherwise>
     </c:choose>
    </TD>
    <TD class='td'>${vo.me_tel }</TD>
    
    <TD class='td'>${vo.me_date.substring(0, 10) }</TD>
    <TD class='td'>
  <c:choose>
          <c:when test="${vo.me_grade eq 'A' }"> 
            최고 관리자
          </c:when>
           <c:when test="${vo.me_grade eq 'C' }"> 
            기업회원
          </c:when>
          <c:when test="${vo.me_grade eq 'M' }"> 
            일반회원
          </c:when>
      </c:choose>
    </TD>
    
  </TR>
</c:forEach>
 
</TABLE>
 </div>
<DIV class='bottom'>
  <button type='button' onclick="location.href='<%=root%>/index.do'">홈으로</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 