<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>취업 성공후기 게시판</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li></i>
                            <i class="fa fa-arrow-circle-right"> 취업 성공 후기 게시판 </i> 
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<div class="col-xs-12">
 <div style='width:500px; float:right;'>
  <jsp:include page="createboot.jsp" flush='false' />
 </div> 
</div>
 <div style="clear:both;"></div>

<div class="col-xs-12">
 <div style='width:550px; float:right;'>
  <form name="frmSearch" method="get" action="./list.do"> 
  <select class='content_menu' name="col">
        <option value="">선택</option> 
        <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
        <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
        <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
        <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
      </select>
      <c:choose>
        <c:when test="${searchDTO.col != 'total' }"> <!-- 검색 상태 -->
          <input type="text" name="word" size="15" value="${searchDTO.word }">
        </c:when>
        <c:when test="${searchDTO.col == 'total' }"> <!-- 전체 레코드 -->
          <input type="text" name="word" size="15" value="">
        </c:when>
      </c:choose>
      <input type="image" class="btn-sch" src="../seico/images/search_ico.gif" onclick="./list.do""/>
  </form>
 </div> 
</div>
<div style="clear:both;"></div>
   <c:forEach var="seicoVO" items="${list }">
    <section class="content blog">
      <div class="container">
       <input type="hidden" name="sc_no" value="${seicoVO.sc_no}">
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
            <div class="blog_medium">
              <article class="post">
                <div class="post_date">
                  <span class="day">${fn:substring(seicoVO.sc_date, 8, 10)}</span>
                  <span class="month">${fn:substring(seicoVO.sc_date, 5, 7)}월</span>
                </div>
                <figure class="post_img">
                  <a href="#">
                    <img src="./images/apartmentcoffee.jpg" alt="blog post">
                  </a>
                </figure>                  
                <div class="post_content">
                  <div class="post_meta">
                    <c:choose>
                      <c:when test="${fn:length(seicoVO.sc_title) > 50}">
                         <h2><a href="#">"<c:out value="${fn:substring(seicoVO.sc_title,0,50)}"/>..."</a></h2>
                           </c:when>
                             <c:otherwise>
                               <h2><a href="#">"${seicoVO.sc_title}"</a></h2>
                             </c:otherwise> 
                    </c:choose>
                    <div class="metaInfo">
                      <span><i class=""></i>취업지원직종<a href="#">&nbsp; ${seicoVO.sc_jobs}</a> </span><br>
                      <span><i class=""></i>지원직무<a href="#">&nbsp; ${seicoVO.sc_position}</a></span>
                      <span><i class=""></i>난이도<a href="#">&nbsp; ${seicoVO.sc_stars}</a></span>
                      <span><i class=""></i>근무지역<a href="#">&nbsp; ${seicoVO.sc_area}</a></span>
                    </div>
                  </div>
                    <c:choose>
                      <c:when test="${fn:length(seicoVO.sc_q) > 145}">
                         <c:out value="${fn:substring(seicoVO.sc_tip,0,145)}"/>....
                      </c:when>
                      <c:otherwise>
                         <p>${seicoVO.sc_q}</p>
                      </c:otherwise> 
                    </c:choose>
                  </div>
                  <div style='text-align:right; position:absolute; top:65%; right:0;'>
                  <a class="btn btn-small btn-default" href="./read.do?sc_no=${seicoVO.sc_no }">Read More</a>
                  </div>
              </article> 
              </div> 
              </div>
              </div>
              </div>
              </section>

   </c:forEach>
    <DIV class='bottom'>${paging}</DIV>
    
    

</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 