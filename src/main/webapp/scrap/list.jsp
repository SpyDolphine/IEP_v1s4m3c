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
function scrapDeletePop(sp_no) {
  var winObject = null;
  var settings = "width=400, height=400";
  winObject = window.open("./delete.do?sp_no="+sp_no,"",settings);
   
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body style="text-align: center">
<!-- ----------------------------------------- -->
<DIV class='title'>회원 목록</DIV>
 <div>
<TABLE class='table' style="width: 80%; text-align: center">
  <caption>${sessionScope.me_nick }님 환영합니다..</caption>
  <colgroup>
    <col style='width: 30%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>제목</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
    
  </TR>
 
<c:forEach var= "vo" items="${list }">
  <input type="hidden" id="sp_no" name="sp_no" value="${vo.sp_no }">
  <TR>
    <TD class='td'><A href='${vo.sp_content }'>${vo.sp_title}</A></TD>
    <TD class='td'>${vo.sp_date.substring(0, 10) }</TD>
    <td class="td">
     <A onclick = "javascript:scrapDeletePop('${vo.sp_no}')">삭제</A>
    </td>
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