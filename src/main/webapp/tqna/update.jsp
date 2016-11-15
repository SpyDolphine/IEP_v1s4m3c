<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>Q&A 게시판</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
   // content: textarea name
   if (CKEDITOR.instances['qa_content'].getData() == '') {
     window.alert('내용을 입력해 주세요.');
     CKEDITOR.instances['qa_content'].focus();
     return false;
   }
  };
  

</script>

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
                                <i class="fa fa-arrow-circle-right">Q&A 게시판</i>
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
    <A href='../tqna/list.do'>게시판 목록</A> > 
    <A href='./list.do?qa_no=${tqnaVO.qa_no }'></A>｜
    <A href="javascript:history.back();">취소</A>
  </div>
  

  
  <DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
      <input type='hidden' name='qa_no' id='qa_no' value='${tqnaVO.qa_no}'>
      <ul>
      <li>
      <li>
        <label class='form_grp' for='qa_title'>제목</label>
        <input type='text' name='qa_title' id='qa_title' value='${tqnaVO.qa_title}' size='60' required="required">
      </li>
      <li>
        <label class='form_grp' for='qa_content'>내용</label><br>
        <TEXTAREA name='qa_content' id='qa_content' rows='10' cols='70'>${tqnaVO.qa_content}</TEXTAREA>
      </li> 
 
      <li class='right'>
         <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do?qa_no=${tqnaVO.qa_no}'">목록[취소]</button>
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