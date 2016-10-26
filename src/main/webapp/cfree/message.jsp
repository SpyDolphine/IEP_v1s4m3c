<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>알림</title> 
 
 
</head> 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>알림</DIV>
 
<DIV class='message'>
  <fieldset>
    <ul>
      <c:forEach var="msgs" items='${msgs }'>
       ${msgs }<br><br>
      </c:forEach>
      
      <c:forEach var="links" items='${links }'>
       ${links }
      </c:forEach>
    </ul>
  </fieldset>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html> 