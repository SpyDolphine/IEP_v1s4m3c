<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

<title></title> 
 <style type="text/css">
 
 </style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">

</script>
</head> 
<!-- ----------------------------------------- -->
<body>
<!-- ----------------------------------------- -->
<div id="login">
<FORM name='frm' method='POST' action='./memberin.do'>
<input type="hidden" id="me_no" name="me_no" value="${memberExVO.me_no }">
<input type="hidden" id="me_vis" name="me_vis" value="y">
   <p><b>회원 복귀</b></p>
 ${memberExVO.me_nick  } 회원을 복귀 시키시겠습니까?
 <button type="submit" > 복귀 </button>
 <button onclick="javascript:history.back();"> 취소 </button>
</FORM>
</div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 