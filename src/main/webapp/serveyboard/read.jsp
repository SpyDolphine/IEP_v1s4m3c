<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>설문조사</title>    
 
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
                                <i class="fa fa-arrow-circle-right">설문조사</i> 
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
   
  <div class='content_menu'>
    <A href='./update.do?sb_no=${serveyboardVO.sb_no}'>수정</A>｜
    <A href='./delete.do?sb_no=${serveyboardVO.sb_no}'>삭제</A> ｜
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get">
      <input type="hidden" name="sb_no" value="${serveyboardVO.sb_no}">
      <fieldset class="fieldset">
        <ul>
      <li>
        <label class='form_grp' for='title'>제목</label>
        <input type='text' name='title' value='${serveyboardVO.title}' size='60' readonly="readonly">
      </li>
      <li>
        <label class='form_grp' for='content'>내용</label><br>
        <TEXTAREA name='content' rows='10' cols='70' readonly="readonly">${serveyboardVO.content}</TEXTAREA>
      </li>
      <li>
          <iframe src="../servey/list.do?sb_no=${serveyboardVO.sb_no}" width="400" height="220"></iframe> 
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