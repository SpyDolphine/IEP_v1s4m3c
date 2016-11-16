<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

<title>회원 복귀</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

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
<!-- ----------------------------------------- -->
<body>
  <div class="container">
     <DIV class = 'content'>
     <FORM name='frm' method='POST' action='./memberin.do'>
      <input type="hidden" id="me_no" name="me_no" value="${memberExVO.me_no }">
      <input type="hidden" id="me_vis" name="me_vis" value="y">
      
      <i class='fa fa-exclamation-circle'> 회원 복귀 알림</i>
      <hr>
      <div class='scrap_pop'> 
        ${memberExVO.me_nick  } 회원을 복귀 시키시겠습니까?
      </div>            
       <DIV class='right' style='margin: 0 50px 0 0;'>
        <button type="submit" class="btn btn-default btn-xs"> 복귀 </button>
        <button onclick="javascript:history.back();" class="btn btn-default btn-xs"> 취소 </button>
       </DIV>  
  </FORM>
  </div>
  </div>
</body>
<!-- -------------------------------------------- -->
</html> 