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
 
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
 function openerCloRel() {
   window.parent.location.reload();
   window.close();
}
</script>
<style>
 .scrap_pop {
    text-align: left;
    margin: 5% 15%;
 }
 
 hr {
  border: 3px solid #ff0066;
  margin: 8px 50px;
  paddig: 8px 10px;
 }
 
 i {
  margin: 50px 0 0 55px;
  color : #ff0066;
 }
</style> 
</head> 
 
<body>
  <div class="container">
     <DIV class = 'content'>
      <FORM name='frm' method='POST' action='./delete.do' onsubmit = 'return send();'>
        <input type='hidden' name='sp_no' value='${sp_no}'>
        
          <i class='fa fa-exclamation-circle'> 알림</i>
          <hr>
          <div class='scrap_pop'> 
            삭제하시겠습니까? <br> 삭제하시면 복구 할 수 없습니다.
          </div>  
          <DIV class='right' style='margin: 0 50px 0 0;'>
            <button type = "submit" class="btn btn-default btn-xs">삭제 진행</button>
            <button type = "button" class="btn btn-default btn-xs" onclick = "openerCloRel()">취소</button>
          </DIV>  
      </FORM>
    </DIV>
  </div>
</body>
</html> 
 
 