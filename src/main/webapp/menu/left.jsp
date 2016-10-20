<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    <div class="row">
      <div class="col-md-2">
        <img src='${pageContext.request.contextPath}/menu/images/myimage.jpg' style='width: 100%;'>
        <div style='margin-top: 5px;'>
          <img src='${pageContext.request.contextPath}/menu/images/siba24.jpg' style='width: 20%;'>시바견
        </div>
        블로그 소개 ▷
        <c:import url="/blogcategory/index_list.do" /> 
      </div>
      <div class="col-md-10 cont">