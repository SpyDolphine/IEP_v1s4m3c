<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class = 'content'>
  <FORM name='frm' method='POST' action='./delete.do'
             onsubmit = 'return send();'>
    <input type='hidden' name='cm_no' value='${cm_no}'>
    <input type='hidden' name='cm_ch' id='cm_ch' value='${commuVO.cm_ch}'>
    
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
</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html> 