<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>취업실패후기 게시판</title> 
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<div class="col-xs-12 col-lg-4 col-sm-4 col-md-offset-8">
<jsp:include page="createboot.jsp" flush='false' />
</div>

  <c:forEach var="ifVO" items="${list }">
    <section class="content blog">
      <div class="container">
       <input type="hidden" name="if_no" value="${ifVO.if_no}">
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
            <div class="blog_medium">
              <article class="post">
                <div class="post_date">
                  <span class="day">${fn:substring(ifVO.if_date, 8, 10)}</span>
                  <span class="month">${fn:substring(ifVO.if_date, 5, 7)}월</span>
                </div>
                <figure class="post_img">
                  <a href="#">
                    <img src="./images/apartmentcoffee.jpg" alt="blog post">
                  </a>
                </figure>                  
                <div class="post_content">
                  <div class="post_meta">
                    <c:choose>
                      <c:when test="${fn:length(ifVO.if_title) > 50}">
                         <h2><a href="#">"<c:out value="${fn:substring(ifVO.if_title,0,50)}"/>..."</a></h2>
                           </c:when>
                             <c:otherwise>
                               <h2><a href="#">"${ifVO.if_title}"</a></h2>
                             </c:otherwise> 
                    </c:choose>
                    <div class="metaInfo">
                      <span><i class=""></i>취업지원직종<a href="#">&nbsp; ${ifVO.if_company}</a> </span><br>
                      <span><i class=""></i>지원직무<a href="#">&nbsp; ${ifVO.if_position}</a></span>
                      <span><i class=""></i>난이도<a href="#">&nbsp; ${ifVO.if_level}</a></span>
                      <span><i class=""></i>근무지역<a href="#">&nbsp; ${ifVO.if_region}</a></span>
                    </div>
                  </div>
                    <c:choose>
                      <c:when test="${fn:length(ifVO.if_q) > 145}">
                         <c:out value="${fn:substring(ifVO.if_q,0,145)}"/>....
                      </c:when>
                      <c:otherwise>
                         <p>${ifVO.if_q}</p>
                      </c:otherwise> 
                    </c:choose>
                  </div>
                  <div style='text-align:right; position:absolute; top:65%; right:0;'>
                  <a class="btn btn-small btn-default" href="./read.do?if_no=${ifVO.if_no }">Read More</a>
                  </div>
              </article> 
              </div>
              </div>
              </div>
              </div>
              </section>
   </c:forEach>
</body>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html> 
 