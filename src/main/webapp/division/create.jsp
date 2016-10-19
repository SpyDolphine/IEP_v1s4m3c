<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>게시판 등록</title> 
 
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
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
     <jsp:include page="/menu/left.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>게시판 등록</DIV>
 
<DIV class='content' style='width: 100%;'>
<FORM name='frm' method='POST' action='./create.do'>
  <input type='hidden' name='me_no' id='me_no' value='1'> <!-- 타입이 안맞는데 -->
  <fieldset>
    <ul>
      <li>
        <label for='id'></label>
        카테고리를 등록할 코드(그룹)을 선택하세요.
      </li>  
      <c:forEach var="divisionVO" items="${category_list}">
          <LI>
            <label>
              <input type='radio' name='categoryno'  id='categoryno' value='${divisionVO.categoryno}' 
                 ${divisionVO.categoryno == divisionVO.categoryno?"checked='checked'":""}>
              ${divisionVO.seqno} - ${divisionVO.sort}
            </label>
          </LI>
      </c:forEach>
      <li>
        <label for='title'>게시판 제목</label>
        <input type='text' name='title' id='title' value='경기도' required="required">
      </li>
      <li>
        <label for='orderno'>출력 순서</label>
        <input type="number" name='seqno' id='seqno' value='1' step="1" min="1">
      </li>
      <li>
        <label for='visible'>출력 모드</label>
        <input type='text' name='visible' id='visible' value='Y' placeholder="Y or N">
      </li>
      <li>
        <label for='ids'>접근 계정</label>
        <input type='text' name='ids' id='ids' value='A' size='40' placeholder="A/U/G/C">  
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">취소</button>
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
