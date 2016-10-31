<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<div class="dividerHeading">
  <c:forEach var="serveyVO" items="${list}">
    <LI>
      ${serveyVO.item}
        <div class="progress">
          <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${serveyVO.aver}" aria-valuemin="0" aria-valuemax="100" style="width: ${serveyVO.aver}%">
          ${serveyVO.aver}%
            <span class="sr-only">${serveyVO.aver}% Complete</span>
          </div>
        </div>
    </LI>
  </c:forEach>
</div>
