<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<jsp:include page="/menu/top.jsp" flush='false' />
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
   // content: textarea name
   if (CKEDITOR.instances['content'].getData() == '') {
     window.alert('내용을 입력해 주세요.');
     CKEDITOR.instances['content'].focus();
     return false;
   }
  };
</script>
</head> 
 
<body>
  <div class='content_menu' style='width: 100%;'>
    <A href='../division/list.do'>게시판 목록</A> > 
    <A href='./list.do?nt_no=${noticeVO.nt_no }'>${noticeVO.nt_title }</A>｜
    <A href="javascript:history.back();">취소</A>
  </div>
  
  <DIV class='content' style='width: 70%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
    <input type='hidden' name='nt_no' value='${noticeVO.nt_no}'>
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


</body>
 
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
</html> 