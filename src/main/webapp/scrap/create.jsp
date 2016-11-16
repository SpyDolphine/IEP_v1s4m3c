<%@page import="dev.mvc.contest.ContestVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 <% 
 ContestVO contestVO = new ContestVO();
 String ct_url = request.getParameter("ct_url");
 String ct_title = request.getParameter("ct_title");
 int ct_no=Integer.parseInt(request.getParameter("ct_no"));
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>스크랩</title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

<style>
 .scrap_pop {
    text-align: left;
    margin: 5% 15%;
 }
 
 hr {
  border: 3px solid #0077b3;
  margin: 8px 50px;
  paddig: 8px 10px;
 }
 
 i {
  margin: 50px 0 0 55px;
  color : #0077b3;
 }
</style>
</head> 
 
<body>
 <input type="hidden" name="ct_no" value="<%=request.getParameter("ct_no")%>">
  <form action="./create.do" method="post" id = "frm">
    <input type="hidden" name="ct_no" value="<%=ct_no%>">
    <input type="hidden" name="ct_title" value="${contestVO.ct_title}">
    <input type="hidden" name="me_no" value="${sessionScope.me_no}">
    <input type="hidden" id="me_id" name="me_id"  value=" ${sessionScope.me_id }">
    <input type="hidden" id="nowUrl" name="nowUrl"  value=" <%=ct_url %>">
    <input type="hidden" id="me_nick" name="me_nick"  value=" ${sessionScope.me_nick }">
     
     <i class='fa fa-arrow-right'> 나의 스크랩함으로 스크랩</i>
     <hr>
      
     <div class='scrap_pop'> 
      ${sessionScope.me_nick } 님!<br> 선택한 글을 나의 스크랩함에 저장합니다. <br> 담기 버튼을 눌러주세요.
     </div>
     
     <div class="form-group">   
        <div class="col-xs-10 col-lg-10">
          <input type='hidden' class="form-control" name='sp_title' id='sp_title' size='60' value= '<%=ct_title %>'>
        </div>
      </div>   
      <div class="form-group">   
        <div class="col-xs-10 col-lg-10">
          <input type='hidden' class="form-control" name='sp_content' id='sp_content' size='20' value = "<%=ct_url %>" required="required" >
        </div>
      </div>   
       
      <DIV class='right' style='margin: 0 50px 0 0;'>
        <button type="submit" class="btn btn-default btn-xs">담기</button>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href=self.close();">취소[목록]</button>
      </DIV>
    </FORM>
</body>
 
</html> 