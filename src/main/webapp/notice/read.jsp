<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공지사항</title>    
 
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
                                <i class="fa fa-arrow-circle-right">공지사항</i> 
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
  <div class='content_menu' style='width: 100%;'>
            <A href="./update.do?nt_no=${noticeVO.nt_no}">수정 |</A>
            <A href="./delete.do?nt_no=${noticeVO.nt_no}" onclick="return confirm('삭제할꺼냐')">삭제 |</A>
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="nt_no" value="nt_no=${noticeVO.nt_no}">
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='nt_title' class="form_group" style="width:150px;">제목 : </label>
            <span>${noticeVO.nt_title}</span><br>
          </li>
          <li>
            <label for='nt_content' class="form_group" style="width:150px;">내용 : </label>
            <div>${noticeVO.nt_content}</div>
          </li>
          <li>
            <label for="nt_date" class="form_group" style="width:150px;">등록일 : </label>
            <span>${noticeVO.nt_date.substring(0, 16)}</span>
          </li>
          <li class='right'>
            <A href="./list.do">목록 |</A>
            <A href="./update.do?nt_no=${noticeVO.nt_no}">수정 |</A>
            <A href="./delete.do?nt_no=${noticeVO.nt_no}" onclick="return confirm('삭제할꺼냐')">삭제</A>
          </li>
        </ul>
      </fieldset>
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