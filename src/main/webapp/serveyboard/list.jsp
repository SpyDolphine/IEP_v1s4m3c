<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>설문조사 게시판</title> 
 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- --> 
<script type="text/javascript">
  $(function(){
    $('#panel_frm_delete').hide();
  });
   
  function deleteOne(sb_no){
    $('#panel_frm_delete').show();
    $('#sb_no', frm_delete).attr('value', sb_no);
  }
   
  function deleteOne_cancel(){
    $('#panel_frm_delete').hide();
  }
 
</script>
</head> 

<DIV class='title'>대분류 목록</DIV>
 
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
</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html> 
 