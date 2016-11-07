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
      <A href='../list.do'>게시판 목록</A> > 
      <A href='./list.do?nt_no=${noticeVO.nt_no }'>${noticeVO.nt_title }</A>｜
      <A href="javascript:history.back();">취소</A>
    </div>
    <DIV class='content' style='width: 70%;'>
      <FORM name='frm' method='POST' action='./update.do'
                  enctype="multipart/form-data">
        <input type='hidden' name='nt_no' value='${noticeVO.nt_no}'><!-- 현재 글 번호 -->
        <input type='hidden' name='me_no' value='${sessionScope.me_no}'><!-- 현재 접속한 유저의 번호 -->
          <ul>
          <li>
            <label class='form_grp' for='title'>제목</label>
            <input type='text' name='nt_title' value='${noticeVO.nt_title}' size='60' required="required">
          </li>
          <li>
            <label class='form_grp' for='content'>내용</label><br>
            <TEXTAREA name='nt_content' cols="100" rows="10">${noticeVO.nt_content}</TEXTAREA>
          </li>
          <li class='right'>
             <button type="submit">수정</button>
            <button type="button" onclick="location.href='./list.do'">목록[취소]</button>
          </li>         
        </ul>
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