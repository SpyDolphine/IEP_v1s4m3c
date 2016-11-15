<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
  
<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/javascript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
  $(function (){
    // content: textarea name
    if (CKEDITOR.instances['content'].getData() == '') {
      window.alert('내용을 입력해 주세요.');
      CKEDITOR.instances['content'].focus();
      return false;
    }
  });
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
  <div class='content_menu' style='width: 100%;'>
    <A href='../division/list.do'>게시판 목록</A> > 
    <A href='./list.do?divisionno=${divisionVO.divisionno }'>${divisionVO.title }</A>｜
    <A href='./create.do?divisionno=${divisionVO.divisionno }'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
<DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./reply.do'
              enctype="multipart/form-data">
    <input type='hidden' name='divisionno' value='${boardVO.divisionno }'>
    <input type='hidden' name='boardno' value='${boardVO.boardno }'>
    
    <!-- 회원연동하면 벨류값바꾸자 -->
    <input type='hidden' name='me_no' value='1'>
      <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' id='title' value='봄' size='60' required="required">
      </li>
      <li>
        <label for='content'>내용</label>
        <textarea name='content' id='content'  rows='5' cols='70'>추위끝</textarea>
      </li>
      <li>
        <label for='file1'>Thumb 파일</label>
        Preview(미리보기) 이미지 자동 생성됩니다.
      </li>
      <li>
        <label for='file2'>업로드 파일</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
      <li class='right'>
        <button type="submit">답변 등록</button>
        <button type="button" onclick="location.href='./list.do?divisionno=${boardVO.divisionno}&col=${searchDTO.col}&word=${searchDTO.word}'">목록</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 