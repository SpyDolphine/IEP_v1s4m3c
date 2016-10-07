<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
  $('#panel_frm').hide();
  $('#panel_frm_remove').hide();
});

function update(nt_no, nt_title, nt_content){
  location.href='./read.do?nt_no=' + nt_no;
}

function remove(nt_no){
  $('#panel_frm_remove').show();
  $('#nt_no', frm_remove).attr('value', nt_no);
  
  // alert 창 형태의 경우, GET
  /*   
  var sw = confirm('정말로 삭제하시겠습니까?');
  
  if (sw == true){
    location.href='./delete.do?nt_no=' + nt_no;
  }else{
    return;
  } */
}
 
function remove_cancel(){
  $('#panel_frm_remove').hide();
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>공지사항 목록</DIV>
 
<DIV id='panel_frm' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
<FORM name='frm' id='frm' method='POST' >
  <input type='hidden' name='nt_no' id='nt_no' value='0'>
  
  <label for='nt_title'>제목</label>
  <input type='text' name='nt_title' id='nt_title' size='15' value='제목' required="required">
 
  <label for='content'>내용</label>
  <input type='text' name='nt_content' id='nt_content' required="required">
 
  <button type="submit" id='submit'>등록</button>
  <button type="button" onclick="create_cancel()">취소</button>
</FORM>
</DIV>
<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='nt_no' id='nt_no'> 
  
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="delete_cancel()">취소</button>
</FORM>
</DIV>
<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 60%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>제목</TH>
    <TH class='th'>내용</TH>
    <TH class='th'>기타</TH>
  </TR>
  <c:forEach var="vo" items="${list }">
  <TR>
    <TD class='td'>${vo.nt_no}</TD>
    <TD class='td'>${vo.nt_title}</TD>
    <TD class='td'>${vo.nt_content}</TD>
    <TD class='td'>
      <A href="./read.do?nt_no=${vo.nt_no}"><IMG src='../menu/images/update.png' title='수정'></A>
      <A href="javascript:remove(${vo.nt_no})"><IMG src='../menu/images/delete.png' title='삭제'></A>
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
</body>
<!-- -------------------------------------------- -->
</html> 