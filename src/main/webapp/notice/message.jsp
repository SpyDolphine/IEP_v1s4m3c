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
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
$(function(){ 
  
});
</script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
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
</body>
<!-- -------------------------------------------- -->
</html> 


