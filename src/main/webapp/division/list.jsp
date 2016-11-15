<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>게시판 목록</title> 
  
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
<DIV class='title' style="width=">게시판 목록</DIV>
 
<TABLE class='table'>
  <caption>관리자만 접근 할 수 있습니다.</caption>
  <TR>
    <TH>번호</TH>
    <TH>대분류 코드</TH>
    <TH>대분류명</TH>
    <TH>게시판</TH>
    <TH>순서</TH>
    <TH>모드</TH>
    <TH>접근계정</TH>
    <TH>글수</TH>
    <TH>기타</TH>
  </TR>

  <c:forEach var="divisionVO" items="${list}">
  <TR>
    <TD>${divisionVO.divisionno}</TD>
    <TD>${divisionVO.categoryno}</TD>
    <TD>${divisionVO.sort}</TD>    
    <TD><a href="../board/list.do?divisionno=${divisionVO.divisionno}">${divisionVO.title}</a></TD>
    <TD>${divisionVO.seqno}</TD>
    <TD>${divisionVO.visible}</TD>
    <TD>${divisionVO.ids}</TD>
    <TD>${divisionVO.cnt}</TD>
    <TD>
      <A href="./update.do?divisionno=${divisionVO.divisionno}"><IMG src='../menu/images/update.png' title='수정'></A>
      <A href="./delete.do?divisionno=${divisionVO.divisionno}"><IMG src='../menu/images/delete.png' title='삭제'></A>
      <A href="./up.do?divisionno=${divisionVO.divisionno}"><IMG src='../menu/images/up.jpg' title='우선 순위 증가' style='width: 20px;'></A>
      <A href="./down.do?divisionno=${divisionVO.divisionno}"><IMG src='../menu/images/down.jpg' title='우선 순위 감소' style='width: 20px;'></A>
    </TD>
    
  </TR>
  </c:forEach>
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<!-- -------------------------------------------- -->
</html>