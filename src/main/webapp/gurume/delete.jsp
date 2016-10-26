<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<!-- ----------------------------------------- -->
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
</head> 

 
  <div class='content_menu'>
    <A href='../division/list.do'>전체 게시판 목록</A> >
   <%--  <A href='./list.do?divisionno=${boardVO.divisionno }'>${divisionVO.title}</A>｜ --%>
    <A href="./create.do<%-- ?divisionno=${boardVO.divisionno } --%>">등록</A>｜
    <A href="./update.do?gu_no=${gurumeVO.gu_no}">수정</A>｜
    <A href="./delete.do?gu_no=${gurumeVO.gu_no}<%-- &divisionno=${boardVO.divisionno } --%>">삭제</A>｜
    <%-- <A href="./reply.do?divisionno=${boardVO.divisionno }">답변</A>｜ --%>
    <A href="javascript:location.reload();">새로고침</A>
  </div>
 
<DIV class = 'content'>
  <FORM name='frm' method='POST' action='./delete.do'
             onsubmit = 'return send();'>
    <input type='hidden' name='gu_no' value='${gu_no }'>
    <%-- <input type="hidden" name="divisionno" value="${divisionno }"> --%>
    
    <div class="form-group">
      <div class="col-xs-12 col-lg-12" style='text-align: center;'>
          <br><br>
          
         삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br>
         
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
</body>
<!-- -------------------------------------------- -->
</html> 