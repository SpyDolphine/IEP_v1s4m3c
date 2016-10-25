<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/javascript">
  
  $(function (){

  });
</script>

</head> 
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
  <div class='content_menu' style='width: 100%;'>
    <A href='../division/list.do'>목록</A> > 
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
<DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
    <input type='hidden' name='fq_no' value='${fnqVO.fq_no}'>
    <input type='hidden' name='me_no' value='1'>
    <input type='hidden' name='fq_CH' value='${fnqVO.fq_CH}'>
      <ul>
      <li>
        <label class='form_grp' for='content'>질문</label><br>
        <TEXTAREA name='fq_question' rows='10' cols='70'>${fnqVO.fq_question}</TEXTAREA>
      </li>
      <li>
        <label class='form_grp' for='content'>답변</label><br>
        <TEXTAREA name='fq_answer' rows='10' cols='70'>${fnqVO.fq_answer}</TEXTAREA>
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">취소</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 