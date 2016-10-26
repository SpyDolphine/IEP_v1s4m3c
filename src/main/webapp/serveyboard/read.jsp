<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<!-- ----------------------------------------- -->
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
  /* function customize(imgObj){
    alert('file2 '+ imgObj.width());
  } */
  $(function (){
    $('#file2').load(function(){ // 태그 메모리 상주후 작동
      var width = $('#file2').width();
      if ($('#file2').width() > screen.width * 0.6){
        $('#file2').width('80%');      
      }
    });
  });

</script>
</head>

<body>
  <div class='content_menu' style='width: 100%;'>
    <A href='./update.do?sb_no=${serveyboardVO.sb_no}'>수정</A>｜
    <A href='./delete.do?sb_no=${serveyboardVO.sb_no}'>삭제</A> ｜
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get">
      <input type="hidden" name="sb_no" value="${serveyboardVO.sb_no}">
      <fieldset class="fieldset">
        <ul>
      <li>
        <label class='form_grp' for='title'>제목</label>
        <input type='text' name='title' value='${serveyboardVO.title}' size='60' readonly="readonly">
      </li>
      <li>
        <label class='form_grp' for='content'>내용</label><br>
        <TEXTAREA name='content' rows='10' cols='70' readonly="readonly">${serveyboardVO.content}</TEXTAREA>
      </li>
      <li>
          <iframe src="../servey/list.do?sb_no=${serveyboardVO.sb_no}" width="400" height="220"></iframe> 
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
 
</body>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>        
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html> 