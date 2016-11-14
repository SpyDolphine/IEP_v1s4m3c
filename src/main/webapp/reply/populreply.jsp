<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="../css/style.css">

<c:forEach var="replyVO" begin="0" end="5" step="1" items="${populreply}">
    <ul class="recent_tab_list">
        <li>
            <a href="#">${replyVO.rcontent}</a>
            <i>${fn:substring(replyVO.rdate, 0, 16)}</i>
        </li>
    </ul>
</c:forEach>  
