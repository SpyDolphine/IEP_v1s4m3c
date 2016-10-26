<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<H1>결과</h1>
  <c:forEach var="serveyVO" items="${list}">
    <LI>
      <label>${serveyVO.item} - ${serveyVO.aver} %</label>
    </LI>
  </c:forEach>
