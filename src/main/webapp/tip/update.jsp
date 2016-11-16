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

    <div class='content_menu' style='width: 100%;'>
      <A href='../division/list.do'>목록</A> > 
      <A href="javascript:location.reload();">새로고침</A>
    </div>
      
    <DIV class='content' style='width: 100%;'>
      <FORM name='frm' method='POST' action='./update.do'
                  enctype="multipart/form-data">
        <input type='hidden' name='tp_no' value='${tipVO.tp_no}'>
        <input type='hidden' name='tp_ch' value='${tipVO.tp_ch}'>
          <ul>
          <li>
            <label class='form_grp' for='content'>제목</label><br>
            <TEXTAREA name='tp_title' rows='10' cols='70'>${tipVO.tp_title}</TEXTAREA>
          </li>
          <li>
            <label class='form_grp' for='content'>내용</label><br>
            <TEXTAREA name='tp_content' rows='10' cols='70'>${tipVO.tp_content}</TEXTAREA>
          </li>
          <li class='right'>
            <button type="submit">등록</button>
            <button type="button" onclick="location.href='./list.do'">취소</button>
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