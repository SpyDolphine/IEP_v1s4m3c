<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>FnQ</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
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
                                <i class="fa fa-arrow-circle-right">FnQ 
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
<DIV class='title'>삭제</DIV>
 
<DIV class='message' style='width: 60%;'>
<FORM name='frm' method='POST' action='./delete.do'>
  <input type='hidden' name='fq_no' value='${fq_no}'>
  
  삭제하면 복구 할 수 없습니다.
  <br><br>
  <button type="submit">삭제</button>
  <button type="button" onclick="location.href='./list.do'">취소[목록]</button>
</FORM>
</DIV>
   </div>
 </div>
</div>
</body>

 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html> 