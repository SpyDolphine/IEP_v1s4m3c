<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

<script type="text/javascript">
$(function(){

});
</script>

</head> 

<body>
  <div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />



  <div class='content_menu' style='width: 100%;'>
    <A href='./list.do'>게시판 목록</A> > ｜
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
  <DIV class='content' style='width: 80%;'>
    <FORM name='frm' method='POST' action='./reply.do'
              enctype="multipart/form-data">
      <input type='hidden' name='io_no' id='io_no' value='${itosVO.io_no }'>
      <div class="form-group">   
        <label for="title" class="col-xs-2 col-lg-2 control-label">글 제목</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='io_title' id='title' value='봄' size='60' required="required">
        </div>  
      </div>
      <div class="form-group">   
        <label for="content" class="col-xs-2 col-lg-2 control-label">내용</label>
        <div class="col-xs-10 col-lg-10">
          <textarea class="form-control" name='io_content' id='content'  rows='10' cols='70'>미시령 단풍</textarea>
        </div>
      </div>   
      <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='io_cost'  value='금액' size='60' required="required">
      </div>
      <div class="form-group">   
        <label for="file2MF" class="col-xs-2 col-lg-2 control-label">업로드 파일</label>
        <div class="col-xs-10 col-lg-10">
          <input type="file" class="form-control" name='file2MF' id='file2MF' size='40' >
          <br>
          Preview(미리보기) 이미지 자동 생성됩니다.
        </div>
      </div>
      <DIV style='text-align: right;'>
        <button type="submit">답변 등록</button>
        <button type="button" onclick="location.href='./list.do'">취소[목록]</button>
      </DIV>
    </FORM>
  </DIV>


     <jsp:include page="/menu/bottom.jsp" flush='false' />     
  </div>
</body>

</html> 

