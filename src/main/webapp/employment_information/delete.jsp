<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title> 채용정보 삭제 </title>
 
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
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 ! -->
                                <i class="fa fa-arrow-circle-right"> 채용정보 삭제 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! --> 
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
   

   
<!--    ★★★ 내용입니다. -->
   
<DIV class='content' style='width: 500px; text-align: center;'>
<FORM name='frm' method='POST' class="form-horizontal" action='./delete.do'>
  채용정보를 삭제하면 복구 할 수 없습니다.<br><br>
  정말로 삭제하시겠습니까?<br><br>         
  <input type='hidden' name='em_no' id='em_no' value='${em_no }'>        
  <button type="submit" class="btn btn-default">삭제</button>
  <button type="button" class="btn btn-default" onclick="location.href='./list.do'">취소(목록)</button>
 
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