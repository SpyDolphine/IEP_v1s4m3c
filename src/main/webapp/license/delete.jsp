<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>자격증 게시판</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/javascript">

</script>

<!-- ----------------------------------------- -->
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right">자격증 게시판</i>
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<body>
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
   
<DIV class = 'content'>
  <FORM name='frm' method='POST' action='./delete.do'
             onsubmit = 'return send();'>
    <input type='hidden' name='lc_no' value='${lc_no}'>
    
    <div class="form-group">
      <div class="col-xs-12 col-lg-12" style='text-align: center;'>
          <br><br>
          
         <b style="color:red;">삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.</b><br>
         
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
   </div>
 </div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html>