<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title> 기업정보 목록</title>    

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
</head>
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 기업정보 목록 </i>
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<body>
        
<div class="col-xs-12">
 <div style='width:500px; float:right;'>
  <button type='button' class="btn btn-default" onclick="location.href='./create.do'">기업 정보 등록</button>
 </div> 
</div>
 <div style="clear:both;"></div> 
 
  <input type='hidden' name='col' id='col' value='${searchDTO.col }'> 
  <input type='hidden' name='word' id='word' value='${searchDTO.word }'>
  <input type='hidden' name='nowPage' id='nowPage' value='${searchDTO.nowPage }'>

  <c:forEach var="vo" items="${list }">
    <section class="content blog">
      <div class="container">
       <input type="hidden" name="ei_no" value="${vo.ei_no }">
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
            <div class="blog_medium">
              <article class="post">
                <div class="post_date">
                  <span class="day">${fn:substring(vo.ei_date, 8, 10)}</span>
                  <span class="month">${fn:substring(vo.ei_date, 5, 7)}월</span>
                </div>
                <figure class="post_img">
                  <a href="#">
                     <c:choose>
                        <c:when test="${vo.ei_logofile1 == null}"></c:when>
                        <c:when test="${vo.ei_logofile1 != null}">
                          <c:set var='ei_logofile2' value="${fn:toLowerCase(vo.ei_logofile2)}" />
                          <c:choose>
                            <c:when test="${fn:endsWith(ei_logofile2, '.jpg')}">
                              <IMG id='file2' src='./storage/${vo.ei_logofile2}' >
                            </c:when>
                            <c:when test="${fn:endsWith(ei_logofile2, '.gif')}">
                              <IMG id='file2'  src='./storage/${vo.ei_logofile2}' >
                            </c:when>
                            <c:when test="${fn:endsWith(ei_logofile2, '.png')}">
                              <IMG id='file2'  src='./storage/${vo.ei_logofile2}' >
                            </c:when>
                            <c:otherwise>
                              ${vo.ei_logofile1}
                            </c:otherwise>
                          </c:choose>
                          </c:when>
                      </c:choose> 
                  </a>
                </figure>                  
                <div class="post_content">
                  <div class="post_meta">
                     <h2><a href="./read.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><i class='fa fa-building-o'></i> ${vo.ei_corporationname }</a></h2>
                    <div class="metaInfo">
                      <span><i class="fa fa-rocket"></i> 회사홈페이지<a href="#">&nbsp; ${vo.ei_url }</a></span><br>
                      <span><i class="fa fa-group"></i>사원수<a href="#">&nbsp; ${vo.ei_employees}</a></span><br>
                      <span><i class="fa fa-desktop"></i>업종<a href="#">&nbsp; ${vo.ei_business}</a> </span><br>
                      <span><i class="fa fa-desktop"></i>주요업무<br><a href="#">
                        <c:choose>
                          <c:when test="${fn:length(vo.ei_majorbusiness ) > 60}">
                            <div style='margin: 0 0 0 10px;'>
                             <c:out value="${fn:substring(vo.ei_majorbusiness ,0, 60)}"/>.... 
                            </div> 
                          </c:when>
                          <c:otherwise>
                            <div style='margin: 0 0 0 10px;'>
                             ${vo.ei_majorbusiness}
                             </div>
                          </c:otherwise> 
                        </c:choose>    
                       </a></span><br>     
                      <span><i class="fa fa-globe"></i>기업 소개 (Company Introduction)<br><a href="#">
                        <c:choose>
                          <c:when test="${fn:length(vo.ei_ci ) > 60}">
                            <div style='margin: 0 0 0 10px;'>
                             <c:out value="${fn:substring(vo.ei_ci ,0, 60)}"/>....
                            </div> 
                          </c:when>
                          <c:otherwise>
                            <div style='margin: 0 0 0 10px;'>
                             ${vo.ei_ci}
                            </div>
                          </c:otherwise> 
                        </c:choose>    
                       </a></span><br>
                    </div>
                  </div>
                  </div>
                  <div style='text-align:right; position:absolute; top:65%; right:0;'>
                    <a class="btn btn-small btn-default" href="./update.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }">수정</A>
                    <A class="btn btn-small btn-default" href="./delete.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }">삭제</A>
                    <a class="btn btn-small btn-info" href="./read.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }">자세한 기업정보</a>
                  </div>
              </article> 
              </div>
              </div>
              </div>
              </div>
              </section>
   </c:forEach>

   <form name="frmSearch" method="get" action="./list.do"> 
    <select name="col"> 
      <option value="">선택</option> 
      <option value="name" ${searchDTO.col == "name" ? "selected=selected" : "" }>회사 이름</option> 
      <option value="business" ${searchDTO.col == "business" ? "selected=selected" : "" }>업종</option>
      <option value="name_business" ${searchDTO.col == "name_business" ? "selected=selected" : "" }>회사 이름+업종</option>
      <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
    </select>
    <c:choose>
      <c:when test="${searchDTO.col != 'total' }">
        <input type="text" name="word" size="15" value="${searchDTO.word }">
      </c:when>
      <c:when test="${searchDTO.col == 'total' }">
        <input type="text" name="word" size="15" value="">
      </c:when>
    </c:choose>
     <input type="submit" value="검색">｜
  </form> 
  <DIV class='bottom'>${paging}</DIV>
</body>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html>  
