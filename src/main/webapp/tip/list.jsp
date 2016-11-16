<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>Tip</title>    
 
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
                                <li><A href='./list.do?tp_ch=${tp_ch}'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> ${ch }</i> 
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
   
   <DIV class='content' style='width: 80%;'>
    <DIV class='left'>
       <div class="widget_title">
          <h4><i class="fa fa-lightbulb-o"></i> ${ch } TIP !<br></h4>
       </div>
    </DIV>
    <div style='clear: both;'></div> 
    <div class='right'>
      <A href='./create.do' class="btn btn-default btn-xs"><i class="fa fa-pencil"> 글쓰기</i></A>
    </div> 
    <div style='clear: both;'></div>     
    
      <div class="widget widget_tab">
          <div class="velocity-tab sidebar-tab">
              <ul class="nav nav-tabs">
                <c:forEach var="tipVO" items="${list }">
                  <c:set var="string" value="${tipVO.tp_title}" />
                <li class="" ><a href="#${tipVO.tp_no}" data-toggle="tab">${fn:substring(string,0,10)}</a></li>
                </c:forEach>
              </ul>

              <div class="tab-content clearfix">
              <div class="tab-pane fade active in">
                <div style='border: 30px solid #f4f4f4; margin: 0 0 20px 0;'>
                <!-- 면접카테고리 기본 이미지 --><img src = "./images/tipimage.jpg" style='margin: 30px 0 0 0; width: 80%;'>
                <!-- 면접카테고리 기본 이미지 --><img src = "./images/7.jpg" style='margin: 10px 0 10px 0; width: 80%;'>
                </div>
              </div>
                <c:forEach var="tipVO" items="${list }">
                  <div class="tab-pane fade" id="${tipVO.tp_no}">
                    <ul class="recent_tab_list" >
                      <div class="right">
                        <A href='./update.do?tp_no=${tipVO.tp_no}'>수정 |</A>
                        <A href='./delete.do?tp_no=${tipVO.tp_no}'>삭제</A>
                      </div>  
                        <li class="comments_list clearfix">
                              <a href="#">${tipVO.tp_content}</a>
                        </li>
                    </ul>
                  </div>
                </c:forEach>
              </div>
          </div>
      </div>
    </div> 
<!-- ------------------------------------------------------------------------------- -->
   </div>
 </div>
</div>
</body>
<form name="frmSearch" method="get" action="./list.do?tp_ch=${tp_ch}"> 
<DIV class='bottom'>
  <input type="hidden" name="tp_ch" value="${tp_ch}">
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