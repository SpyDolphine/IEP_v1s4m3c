<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>설문조사</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
// iframe resize
function autoResize(i)
{
    var iframeHeight=
    (i).contentWindow.document.body.scrollHeight;
    (i).height=iframeHeight+20;
}
</script>
<style>
hr {
    margin: 0;
    padding: 0;
}
</style>
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 설문조사</i> 
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
   
  <div class="write_content" style='width: 90%;'>
    <input type="hidden" name="sb_no" value="${serveyboardVO.sb_no}">
    <div style='text-align: left;'>&nbsp;&nbsp;${serveyboardVO.title}</div>
    <p style='text-align: right;'>
      <A href='./update.do?sb_no=${serveyboardVO.sb_no}'>수정</A> |
      <A href='./delete.do?sb_no=${serveyboardVO.sb_no}' onclick="return confirm('삭제 하시겠습니까?')">삭제</A>
    </p>   
    <hr>
    
  <fieldset class="fieldset" style='margin: 50px 0 0 0;'>
   <ul>
    <li>
      <blockquote class="default" style="background-color: bule;">${serveyboardVO.content}</blockquote>
    </li>
    <li>
        <iframe src="../servey/list.do?sb_no=${serveyboardVO.sb_no}" onload="autoResize(this)" scrolling="no" frameborder="0"></iframe> 
    </li>
   </ul>
   </fieldset>

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