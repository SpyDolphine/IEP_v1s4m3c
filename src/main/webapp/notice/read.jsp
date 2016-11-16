<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공지사항</title>    
  
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<style>
hr {
    margin: 0 0 10px 0;
    padding: 0;
}
</style>
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
                                <i class="fa fa-arrow-circle-right"> 공지사항</i> 
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
   
   <div class="write_content" style='width: 90%;'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="nt_no" value="nt_no=${noticeVO.nt_no}">
      
      <div style='text-align: left;'>&nbsp;&nbsp;${noticeVO.nt_title}</div><p style='text-align: right;'>
        <span style='color: #cccccc;'>${noticeVO.nt_date.substring(0, 16)}</span> |
        <A href="./update.do?nt_no=${noticeVO.nt_no}">수정</A> |
        <A href="./delete.do?arr=${noticeVO.nt_no}" onclick="return confirm('삭제하시겠습니까?')">삭제</A>
      </p>      
      <hr>
      &nbsp;<i class="fa fa-leaf"> 닉네임을 넣어주세요</i>
      <fieldset style='margin: 50px 0 0 0;'>
        <ul>
          <li>
            ${noticeVO.nt_content}
          </li>
        </ul>
      </fieldset>    
      <div class='right'>
        <A href="./list.do" class="btn btn-default btn-xs">목록</A>
      </div>
    <div style='clear:both;'></div>
      <hr>
    </FORM>
  </DIV>
   </div>
 </div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 