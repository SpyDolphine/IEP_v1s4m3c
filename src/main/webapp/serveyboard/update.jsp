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
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right">설문조사</i> 
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
<FORM name='form_grp' method='POST' action='./update.do'>
<input type='hidden' name='sb_no' id='sb_no' value='${serveyboardVO.sb_no}'>
  <fieldset>
    <ul>
      <li>
        <label class='form_grp' for='title'>제목</label>
        <input type='text' name='title' value='${serveyboardVO.title}' size='60' required="required">
      </li>
      <li>
        <label class='form_grp' for='content'>내용</label><br>
        <TEXTAREA name='content' rows='10' cols='70'>${serveyboardVO.content}</TEXTAREA>
      </li>
      <li>
          <iframe src="../servey/list.do?sb_no=${serveyboardVO.sb_no}" onload="autoResize(this)" scrolling="no" frameborder="0"></iframe> 
      </li>
    </ul>
  </fieldset>
</FORM>
    <FORM name='form_grp' method='POST' action='../servey/create.do'>
      <input type='hidden' name='sb_no' value='${serveyboardVO.sb_no}'>
        <fieldset>
          <ul>
            <li>
              <label for='sort'>항목</label>
              <input type='text' name='item' value='항목' required="required">
              <button type="submit">등록</button>
            </li>         
            <li class='right'>
              <button type="button" onclick="location.href='./update.do?sb_no=${serveyboardVO.sb_no}'">수정</button>
              <button type="button" onclick="location.href='./delete.do?sb_no=${serveyboardVO.sb_no}'">삭제</button>
              <button type="button" onclick="location.href='./list.do'">목록</button>
            </li>
          </ul>
        </fieldset>
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