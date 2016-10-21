<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>대분류 목록</title> 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

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


<DIV>대분류 목록</DIV>
 
<DIV id='panel_frm_delete' style='text-align: center; padding: 10px 0px 10px 0px; 
                                                  background-color: #99c2ff; width: 30%; '>
<FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
  <input type='hidden' name='categoryno' id='categoryno' value='${vo.categoryno}'> 
  
  삭제하면 복구 할 수 없습니다. <br>
  정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="deleteOne_cancel()">취소</button>
</FORM>
</DIV>
 
<TABLE class='table' style='width: 100%;'>

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
 
<!-- -------------------------------------------- -->
</body>
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html> 