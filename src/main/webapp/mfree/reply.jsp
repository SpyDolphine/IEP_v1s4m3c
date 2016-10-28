<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<jsp:include page="/menu/top.jsp" flush='false' /> 
</head> 
 
<body>
  <DIV class='content' style='width: 80%;'>
    <FORM name='frm' method='POST' action='./reply.do' enctype="multipart/form-data">
      <input type='hidden' name='cm_no' id='cm_no' value='${mfVO.cm_no }'>
      <div class="form-group">   
        <label for="title" class="col-xs-2 col-lg-2 control-label">글 제목</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='title' id='title' value='봄' size='60' required="required">
        </div>  
      </div>
      <div class="form-group">   
        <label for="content" class="col-xs-2 col-lg-2 control-label">내용</label>
        <div class="col-xs-10 col-lg-10">
          <textarea class="form-control" name='content' id='content'  rows='10' cols='70'>미시령 단풍</textarea>
        </div>
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
        <button type="button" onclick="location.href='./list.do?cm_no=${mfVO.cm_no}'">취소[목록]</button>
      </DIV>
    </FORM>
  </DIV>
 
 
</body>
<jsp:include page="/menu/bottom.jsp" flush='false' />     
 
</html> 
 