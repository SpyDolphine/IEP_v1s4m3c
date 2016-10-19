<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.code_category UL{
  width: 100%;
  margin-top : 0px;
  padding-left: 10%; 
  margin: 0px auto; 
  border-left: none; 
  border-right: none; 
  text-align: left;
}
.sort{
  font-weight: bold;
  list-style-image: url("<%=request.getContextPath() %>/blogcategory/images/sort.png");
}
.sort_title{
  list-style-image: url("<%=request.getContextPath() %>/blogcategory/images/title.png");
}
</style>
 
<fieldset class='code_category' >
  <legend style='width:100%; text-size: 1.5em;'>카테고리</legend>
  <UL>
    <c:forEach var="str" items="${list}">
      ${str}
    </c:forEach>
  </UL>
</fieldset>
<br>