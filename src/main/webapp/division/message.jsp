<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>알림</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function(){ 
  
});
</script>

</head> 
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>알림</DIV>

<DIV class='message'>
  <fieldset>
    <ul>
      <li>
      <c:forEach var="msgs" items="${msgs }">
        ${msgs }<br>
      </c:forEach>
      </li>
      <li>
      <c:forEach var="links" items="${links }">
      ${links }
      </c:forEach>
      </li>
    </ul>
  </fieldset>
</DIV>

<!-- -------------------------------------------- -->
    <jsp:include page="/menu/bottom.jsp" flush='false' />     
  </div>
</body>
<!-- -------------------------------------------- -->
</html> 


