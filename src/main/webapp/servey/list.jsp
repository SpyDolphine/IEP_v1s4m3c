<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<H1>리스트</h1>
<FORM name='form_grp' method='POST' action='../servey/vote.do'>
  <c:forEach var="serveyVO" items="${list}">
    <LI>
      <label>
        <input type='radio' name='serveyno'  id='serveyno' value='${serveyVO.serveyno}' 
           ${serveyVO.serveyno == serveyVO.serveyno?"checked='checked'":""}>
        ${serveyVO.item}
      </label>
      <button type="button" onclick="location.href='../servey/delete.do?serveyno=${serveyVO.serveyno}'">삭제</button>
    </LI>
  </c:forEach>
  <button type="submit" >투표</button>
</FORM>