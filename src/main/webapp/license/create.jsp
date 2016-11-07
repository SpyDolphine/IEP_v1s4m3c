<%@ page contentType="text/html; charset=UTF-8" %>

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

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>

</head> 

<body>
  <div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />

  <div class='content_menu' style='width: 100%;'>
    <A href='../license/list.do'>게시판 목록</A> > 
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
  <DIV class='content' style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do'
              enctype="multipart/form-data">
      <div class="form-group">   
        <label for="lc_title" class="col-xs-2 col-lg-2 control-label">license(자격증) 게시판</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='lc_title' id='title' value='EX)자격증' size='60' required="required">
      </div>
      <div class="form-group">   
        <label for="content" class="col-xs-2 col-lg-2 control-label">license</label>
        <div class="col-xs-10 col-lg-10">
          <textarea class="form-control" name='lc_content' id='content'  rows='10' cols='70'>license을 등록해주세요</textarea>
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
     <div style= 'margin: 100px 0 0 0;  position: relative;'>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
  </div>
  </div>
</body>

</html> 