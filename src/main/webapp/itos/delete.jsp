<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 
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
 
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
  <div class='content_menu'>
    <A href='./list.do?io_no=${itosVO.io_no }'>${itosVO.io_title}</A>｜
    <A href="./create.do?io_no=${itosVO.io_no }">등록</A>｜
    <A href="./update.do?io_no=${itosVO.io_no}">수정</A>｜
    <A href="./delete.do?io_no=${itosVO.io_no}">삭제</A>｜
    <A href="./reply.do?io_no=${itosVO.io_no }">답변</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
 
<DIV class = 'content'>
  <FORM name='frm' method='POST' action='./delete.do'
             onsubmit = 'return send();'>
    <input type='hidden' name='io_no' value='${io_no }'>
    
    <div class="form-group">
      <div class="col-xs-12 col-lg-12" style='text-align: center;'>
          <br><br>
          
         <b style="color:white;">삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.</b><br>
         
          <br><br>
          <button type = "submit" class="btn btn-danger">삭제 진행</button>
          <button type = "button" class="btn btn-primary" onclick = "history.back()">취소</button>
          <br><br>
          <br>
      </div>
    </div>
     <hr>    
  </FORM> 
</DIV>

<!-- -------------------------------------------- -->
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<!-- -------------------------------------------- -->
</html> 