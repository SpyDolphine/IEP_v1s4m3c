<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>대분류 목록</title> 
 
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
   
  function deleteOne(categoryno){
    $('#panel_frm_delete').show();
    $('#categoryno', frm_delete).attr('value', categoryno);
  
  }
   
  function deleteOne_cancel(){
    $('#panel_frm_delete').hide();
  }
 
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<DIV class='title'>대분류 목록</DIV>
 
<DIV id='panel_frm_delete' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 100%; text-align: center;'>
<FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
  <input type='hidden' name='categoryno' id='categoryno' value='${vo.categoryno}'> 
  
  삭제하면 복구 할 수 없습니다. <br>
  정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="deleteOne_cancel()">취소</button>
</FORM>
</DIV>
 
<TABLE class='table' style='width: 60%;'>

  <TR>
    <TH>코드</TH>
    <TH>대분류명</TH>
    <TH>출력 순서</TH>
    <TH>기타</TH>
  </TR>
 
  <c:forEach var="vo" items="${list }">
  <TR>
    <TD>${vo.categoryno}</TD>
    <TD>${vo.sort}</TD>
    <TD>${vo.seqno}</TD>
    <TD>
      <A href="./update.do?categoryno=${vo.categoryno}"><IMG src='../menu/images/update.png' title='수정'></A>
      <A href="javascript:deleteOne(${vo.categoryno})"><IMG src='../menu/images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
  </c:forEach>
 
</TABLE>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
 
<DIV class='bottom'>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 