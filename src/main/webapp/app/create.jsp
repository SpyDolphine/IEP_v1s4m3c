<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>APP 공부 게시판</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
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
                                <i class="fa fa-arrow-circle-right">APP 공부 게시판</i>
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
    <A href='../app/list.do'>게시판 목록</A> > 
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
  <DIV class='content' style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do'
              enctype="multipart/form-data">
      <div class="form-group">   
        <label for="ap_title" class="col-xs-2 col-lg-2 control-label">APP공부 게시판</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ap_title' id='title' value='EX)안드로이드' size='60' required="required">
      </div>
      <div class="form-group">   
        <label for="content" class="col-xs-2 col-lg-2 control-label">APP</label>
        <div class="col-xs-10 col-lg-10">
          <textarea class="form-control" name='ap_content' id='content'  rows='10' cols='70'>APP을 등록해주세요</textarea>
        </div>
      </div>   
      <div class="form-group">   
        <label for="file2MF" class="col-xs-2 col-lg-2 control-label">사진을 올려주세요</label>
        <div class="col-xs-10 col-lg-10">
          <input type="file" class="form-control" name='file2MF' id='file2MF' size='40' >
          <br>
          Preview(미리보기) 이미지 자동 생성됩니다.
        </div>
      </div>    
      </div>   

      <DIV style='text-align: right;'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">취소[목록]</button>
      </DIV>
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