<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>자소서</title>    
 
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
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right">자소서</i> 
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<body>
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
    <DIV class='title'>자소서 쓰는 요령</DIV>
    <button type='button' onclick="location.href='./create.do'">등록</button>
      <div class="widget widget_tab">
          <div class="velocity-tab sidebar-tab">
              <ul class="nav nav-tabs">
                <c:forEach var="aboutmeVO" items="${list }">
                  <c:set var="string" value="${aboutmeVO.am_title}" />
                <li class="" ><a href="#${aboutmeVO.am_no}" data-toggle="tab">${fn:substring(string,0,10)}</a></li>
                </c:forEach>
              </ul>
      
              <div  class="tab-content clearfix">
                <c:forEach var="aboutmeVO" items="${list }">
                  <div class="tab-pane fade" id="${aboutmeVO.am_no}">
                    <ul class="recent_tab_list" >
                        <li class="comments_list clearfix">
                              <a href="#">${aboutmeVO.am_no} ${aboutmeVO.am_content}</a>
                        </li>
                    </ul>
                  </div>
                </c:forEach>
              </div>
          </div>
      </div>
<!-- ------------------------------------------------------------------------------- -->
   </div>
 </div>
</div>
</body>
<form name="frmSearch" method="get" action="./list.do">  
<DIV class='bottom'>
  <div style='text-align: center;'>
     <select name="col"> 
      <option value="">선택</option> 
      <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
      <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
      <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
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
     
    <input type="submit" value="검색"> 
    <DIV class='bottom'>${paging}</DIV>
  </div>
</DIV>
</form>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 