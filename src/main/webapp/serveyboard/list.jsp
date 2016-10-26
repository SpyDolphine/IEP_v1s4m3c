<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>설문조사 게시판</title> 
 
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
<script type="text/javascript">
  $(function(){
    $('#panel_frm_delete').hide();
  });
   
  function deleteOne(sb_no){
    $('#panel_frm_delete').show();
    $('#sb_no', frm_remove).attr('value', sb_no);
  }
   
  function deleteOne_cancel(){
    $('#panel_frm_delete').hide();
  }
 
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<DIV class='title'>대분류 목록</DIV>
<DIV id='panel_frm_delete' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='sb_no' id='sb_no'> 
  
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="delete_cancel()">취소</button>
</FORM>
</DIV>
<TABLE class='table' style='width: 60%;'>

  <TR>
    <TH>번호</TH>
    <TH>제목</TH>
    <TH>기타</TH>
  </TR>
 
  <c:forEach var="vo" items="${list }">
  <TR>
    <TD>${vo.sb_no}</TD>
    <TD><a href="./read.do?sb_no=${vo.sb_no}">${vo.title}</a></TD>
    <TD>
      <A href="./update.do?sb_no=${vo.sb_no}"><IMG src='../menu/images/update.png' title='수정'></A>
      <A href="javascript:deleteOne(${vo.sb_no})"><IMG src='../menu/images/delete.png' title='삭제'></A>
    </TD>
  </TR>
  </c:forEach>
 
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>

<!-- -------------------------------------------- -->
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<!-- -------------------------------------------- -->
</html> 
 