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
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
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
 
</head> 
 
<body>
  <div class="container">
    <jsp:include page="/menu/top.jsp" flush='false' />
     
     
  <div class='content_menu' style='width: 100%;'>
    <A href='../tqna/list.do'>게시판 목록</A> > 
    <A href='./list.do?qa_no=${tqnaVO.qa_no }'>${tqnaVO.qa_title }</A>｜
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
      <li>
        <label class='form_grp' for='qa_file2'>등록된 파일</label>
          <c:set var='qa_file2' value="${fn:toLowerCase(tqnaVO.qa_file2)}" />
          <c:choose>
            <c:when test="${fn:endsWith(qa_file2, '.jpg')}">
              <IMG src='./storage/${tqnaVO.qa_file1}'>
            </c:when>
            <c:when test="${fn:endsWith(qa_file2, '.gif')}">
              <IMG id='qa_file2'  src='./storage/${tqnaVO.qa_file1}'>
            </c:when>
            <c:when test="${fn:endsWith(qa_file2, '.png')}">
              <IMG id='qa_file2'  src='./storage/${tqnaVO.qa_file1}'>
            </c:when>
            <c:when test="${tqnaVO.qa_file2.length() > 0}">
              ${tqnaVO.qa_file1 } 
            </c:when>
          </c:choose>
      </li>
      <li>
        <label class='label' for='qa_file2'>업로드 파일</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
      <li class='right'>
         <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do?qa_no=${tqnaVO.qa_no}'">목록[취소]</button>
      </li>         
    </ul>
  </FORM>
</DIV>


     <jsp:include page="/menu/bottom.jsp" flush='false' />     
  </div>
</body>
 
</html> 