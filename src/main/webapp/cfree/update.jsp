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
                              <i class="fa fa-arrow-circle-right"> 자유게시판</i> 
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

<DIV class='title'>새 글 등 록</DIV>
 
<DIV class='content' style='width: 50%;'>
<FORM name='frm' method='POST' action='./update.do'>
<input type="hidden" name="cm_no" id="cm_no" value="${cmVO.cm_no}"> 
  <fieldset>
    <ul>
      <li>
        <label for='cm_nick'>닉네임</label>
        <input type='text' name='cm_nick' id='cm_nick' value='${cmVO.cm_nick }' required="required">
      </li>
      <li>
        <label for='cm_title'>글 제목</label>
        <input type='text' name='cm_title' id='cm_title' value='${cmVO.cm_title }' required="required">
      </li>
      <li>
        <label for='cm_content'>글 내용</label><br>
        <textarea name='cm_content' id='cm_content' rows='10' style='width: 100%;' required="required">
        ${cmVO.cm_content }</textarea>
      </li>       
      <li class='right'>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
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
 