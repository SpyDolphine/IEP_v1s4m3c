<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공부 게시판</title>    
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
  /* function customize(imgObj){
    alert('file2 '+ imgObj.width());
  } */
  $(function (){
    $('#sy_file2').load(function(){ // 태그 메모리 상주후 작동
      var width = $('#sy_file2').width();
      if ($('#sy_file2').width() > screen.width * 0.6){
        $('#sy_file2').width('80%');      
      }
    });
  });
</script>
<style>
hr {
    margin: 0 0 10px 0;
    padding: 0;
}
</style>
</head>

<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do?gate=${studyVO.gate}'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 글읽기</i>
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
  <FORM name='form_group' method="get" action='./update.do'>
  <input type="hidden" name="sy_no" value="${studyVO.sy_no}">
    <hr>
      <div style='text-align: left;'>&nbsp;&nbsp;${studyVO.title}</div>
      <p style='text-align: right;'>
        <span style='color: #cccccc;'>${studyVO.sy_date.substring(0, 16)}</span> |
        <A href='./create.do?gate=${studyVO.gate}'>등록</A>｜
        <A href='./update.do?sy_no=${studyVO.sy_no}'>수정</A>｜
        <A href="./delete.do?sy_no=${studyVO.sy_no}">삭제</A>
      </p>      
    <hr>  
  &nbsp;<i class="fa fa-leaf"> 닉네임을 넣어주세요</i>
  
  <fieldset style='margin: 30px 0 0 0;'>
    <ul>
      <li>
        <label for="file1" class="form_group" style="width:150px;">
        <c:if test="${studyVO.size2 > 0}">
          <A href='${pageContext.request.contextPath}/download?dir=/STUDY/storage&filename=${studyVO.file2}'>${studyVO.file2}</A>  (${studyVO.size2Label})
        </c:if>
        </label>
        <div>
          <c:set var='file2' value="${fn:toLowerCase(studyVO.file2)}" />
          <c:choose>
            <c:when test="${fn:endsWith(file2, '.jpg')}">
              <IMG id='file2' src='./storage/${studyVO.file2}' onload="customize(this);">
            </c:when>
            <c:when test="${fn:endsWith(file2, '.gif')}">
              <IMG id='file2'  src='./storage/${studyVO.file2}' onload="customize(this);">
            </c:when>
            <c:when test="${fn:endsWith(file2, '.png')}">
              <IMG id='file2'  src='./storage/${studyVO.file2}' onload="customize(this);">
            </c:when>
          </c:choose>
        </div>
      </li>
      <br>
      <li>
        ${studyVO.content}
      </li>
      </ul>
      <br>
    <div class='right'>
      <button type="button" class="btn btn-default btn-xs" onclick="history.back()">목록</button>
    </div>
    <div style='clear:both;'></div>
      <hr>
    </fieldset> 
  </FORM>
</div>      
</DIV>
</div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 