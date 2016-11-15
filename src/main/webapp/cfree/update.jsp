<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
                              <i class="fa fa-arrow-circle-right"> 자유게시판 수정</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>
        
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
   
<div class="write_content" style='width: 90%;'>
  <FORM name='frm' method='POST' action='./update.do'>
  <input type="hidden" name="cm_no" id="cm_no" value="${cmVO.cm_no}"> 
      <div class="span3 offset1">
         <label for='cm_nick'><i class="fa fa-leaf"> nick </i></label> 
      </div>
      <div class="span3 offset2"> 
         <input type="text" class="form-control" name='cm_title' id='cm_title' value='${cmVO.cm_title }' required="required"></td>
      </div>   
      <br>
      <textarea  rows="5" class="form-control" name='cm_content' id='cm_content' required="required">${cmVO.cm_content }</textarea>
      <div class='right'>
        <button type="submit" class="btn btn-default btn-xs">수정</button>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./list.do'">목록</button>
      </div>
      <br>
  </FORM>
</DIV>
</div>
</div>
</div>
<!-- -------------------------------------------- -->
</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html> 
 