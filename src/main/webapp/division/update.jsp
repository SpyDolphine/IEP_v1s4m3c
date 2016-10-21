<%@page import="dev.mvc.division.DivisionVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
 
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>게시판 변경</DIV>
 
<DIV class='content' style='width: 60%;'>
<FORM name='frm' method='POST' action='./update.do'>
  <input type='hidden' name='divisionno' id='divisionno' value='${divisionVO.divisionno}'>
  <fieldset>
    <ul>
      <li>
        <label for='id'>그룹</label>
        게시판을 등록할 그룹을 선택하세요.
      </li>
      <c:forEach var="categoryVO" items="${category_list}">
          <LI>
            <label>
              <input type='radio' name='categoryno'  id='categoryno' value='${categoryVO.categoryno}' 
                 ${categoryVO.categoryno == divisionVO.categoryno?"checked='checked'":""}>
              ${categoryVO.seqno} - ${categoryVO.sort}
            </label>
          </LI>
      </c:forEach>
 
      <li>
        <label for='title'>게시판 제목</label>
        <input type='text' name='title' id='title' value='${divisionVO.title}' required="required">
      </li>
      <li>
        <label for='seqno'>출력 순서</label>
        <input type="number" name='seqno' id='seqno' value='${divisionVO.seqno }' step="1" min="1">
      </li>
      <li>
        <label for='visible'>출력 모드</label>
        <input type='text' name='visible' id='visible' value='${divisionVO.visible }' placeholder="Y or N">
      </li>
      <li>
        <label for='ids'>접근 계정</label>
        <input type='text' name='ids' id='ids' value='${divisionVO.ids}' size='40' placeholder="A/U/G/C">  
      </li>
      <li class='right'>
        <button type="submit">저장</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
<!-- -------------------------------------------- -->
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<!-- -------------------------------------------- -->
</html>