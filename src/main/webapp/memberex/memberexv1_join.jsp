<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 <style type="text/css">
.myButton {
  -moz-box-shadow:inset 0px 2px 0px 0px #54a3f7;
  -webkit-box-shadow:inset 0px 2px 0px 0px #54a3f7;
  box-shadow:inset 0px 2px 0px 0px #54a3f7;
  background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #007dc1), color-stop(1, #0061a7));
  background:-moz-linear-gradient(top, #007dc1 5%, #0061a7 100%);
  background:-webkit-linear-gradient(top, #007dc1 5%, #0061a7 100%);
  background:-o-linear-gradient(top, #007dc1 5%, #0061a7 100%);
  background:-ms-linear-gradient(top, #007dc1 5%, #0061a7 100%);
  background:linear-gradient(to bottom, #007dc1 5%, #0061a7 100%);
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#007dc1', endColorstr='#0061a7',GradientType=0);
  background-color:#007dc1;
  -moz-border-radius:8px;
  -webkit-border-radius:8px;
  border-radius:8px;
  display:inline-block; 
  cursor:pointer;
  color:#ffffff;
  font-family:Arial;
  font-size:18px;
  font-weight:bold;
  padding:12px 32px;
  text-decoration:none;
  text-shadow:1px 6px 0px #154682;
}
.myButton:hover {
  background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0061a7), color-stop(1, #007dc1));
  background:-moz-linear-gradient(top, #0061a7 5%, #007dc1 100%);
  background:-webkit-linear-gradient(top, #0061a7 5%, #007dc1 100%);
  background:-o-linear-gradient(top, #0061a7 5%, #007dc1 100%);
  background:-ms-linear-gradient(top, #0061a7 5%, #007dc1 100%);
  background:linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0061a7', endColorstr='#007dc1',GradientType=0);
  background-color:#0061a7;
}
.myButton:active {
  position:relative;
  top:1px;
}

hr {
  border: 3px solid #286090;
  margin: 20px 20px 40px 20px ;
}
 
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

<div style="text-align: center;">
 <h2>IEP 회원가입</h2>
 IT 취업준비생 사이트에 오신것을 환영합니다!<br>
 고객님께 맞는 회원 종류를 선택하신 후, 가입해 주시기 바랍니다.
 <hr>
 <img src='./images/general.jpg' style='width:30%; margin: 0 20px 0 0;'>
 <img src='./images/employee.jpg' style='width:30%; margin: 0 0 0 20px;'>
</div>
<div style="text-align: center;"> 
 <a class="myButton" style='margin: 0 8% 0 0;' onclick="javascript:opener.location.href='./agreement.jsp'; self.close();">사용자회원</a>
 <a class="myButton" style='margin: 0 0 0 8%;' onclick="javascript:opener.location.href='./agreement_com.jsp'; self.close();">기업회원</a>
</div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 









