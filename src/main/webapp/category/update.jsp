<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>대분류 수정</title> 
 
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
 
<DIV class='title'>대분류 수정</DIV>
 
<DIV class='content' style='width: 60%;'>
<FORM name='form_grp' method='POST' action='./update.do'>
<input type='hidden' name='categoryno' id='categoryno' value='${categoryVO.categoryno}'>
  <fieldset>
    <ul>
      <li>
        <label for='sort'>분류</label>
        <input type='text' name='sort' id='sort' value='${categoryVO.sort}' required="required">
      </li>
      <li>
        <label for='content'>출력 순서</label>
        <input type='text' name='seqno' id='seqno' value='${categoryVO.seqno}' required="required">
      </li>
      <li class='right'>
        <button type="submit">등록</button>
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