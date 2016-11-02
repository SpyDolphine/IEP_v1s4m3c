<%@page import="dev.mvc.contest.ContestVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 <% 
 ContestVO contestVO = new ContestVO();
 String nowUrl = request.getParameter("nowUrl");
 String ct_title = request.getParameter("ct_title");
 int ct_no=Integer.parseInt(request.getParameter("ct_no"));
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/JavaScript">
  
</script>
 </head> 
 
<body>
<%=request.getParameter("ct_no")%>
  <form action="./create.do" method="post" id = "frm">
  <div class="form-group">   
        <label for="me_id" class="col-xs-2 col-lg-2 control-label">아이디</label>
       <input type="hidden" name="ct_no" value="<%=ct_no%>">
       <input type="hidden" name="ct_title" value="${contestVO.ct_title}">
        <input type="hidden" name="me_no" value="${sessionScope.me_no}">
        <input type="hidden" id="me_id" name="me_id"  value=" ${sessionScope.me_id }">
        <input type="hidden" id="nowUrl" name="nowUrl"  value=" <%=nowUrl %>">
        <div class="col-xs-10 col-lg-10">
          ${sessionScope.me_id }
        </div>
        </div>
        
         <label for="me_nick" class="col-xs-2 col-lg-2 control-label">닉네임</label>
        <div class="col-xs-10 col-lg-10">
        <input type="hidden" id="me_nick" name="me_nick"  value=" ${sessionScope.me_nick }">
            ${sessionScope.me_nick }
        </div>
        <div class="form-group">   
        <label for="sp_title" class="col-xs-2 col-lg-2 control-label">제목</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='sp_title' id='sp_title' size='60' value= '<%=ct_title %>'>
        </div>
      </div>   
       <div class="form-group">   
        <label for="sp_content" class="col-xs-2 col-lg-2 control-label">스크랩 내용</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name=
          'sp_content' id='sp_content' size='20' value = "<%=nowUrl %>" required="required" >
        </div>
      </div>   
       
      <DIV style='text-align: right;'>
        <button type="submit" >등록</button>
        <button type="button" onclick="location.href=self.close();">취소[목록]</button>
      </DIV>
    </FORM>
</body>
 
</html> 