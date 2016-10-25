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
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
   <div class='content_menu' style='width: 100%;'>
    <A href='../seico/list4.do'>게시판 목록</A> >
    <%-- <A href='./list.do?blogcategoryno=${blogcategoryVO.blogcategoryno}'>${blogcategoryVO.title }</A>｜ --%>
    <A href='./create.do<%-- ?${gurumeVO.gu_no} --%>'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
    </div>
  <DIV class='content'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="sc_no" value="${seicoVO.sc_no}">
      <%-- <input type="hidden" name="divisionno" value="${boardVO.divisionno}"> --%>
      <fieldset class="fieldset">
        <ul>
         <li>
            <label for='sc_area' style="width:150px;">지역 : </label>
            <span>${seicoVO.sc_area}</span><br>
          </li>
          <li>
            <label for='sc_jobs' style="width:150px;">분류 : </label>
            <span>${seicoVO.sc_jobs}</span><br>
          </li>
          <li>
            <label for='sc_title' style="width:150px;">제목 : </label>
            <span>${seicoVO.sc_title}</span><br>
          </li>
          <li>
            <label for='sc_name' style="width:150px;">닉네임 : </label>
            <span>${seicoVO.sc_name}</span><br>
          </li>
            <li>
            <label for='sc_cont' style="width:150px;">내용</label><br>
          <TEXTAREA name='sc_cont' id='sc_cont' rows='10' cols='70'>
                  ${seicoVO.sc_cont}
          </TEXTAREA>
         <%--  <li>
            <label for='sc_title' class="form_group" style="width:150px;">제목 : </label>
            <span>${seicoVO.sc_title}</span><br>
          </li>
          <li>
            <label for='sc_cont' class="form_group" style="width:150px;">내용 : </label>
            <div>${seicoVO.sc_cont}</div>
          </li> --%>
     <%--      <li>
            <label for="good" class="form_group" style="width:150px;">추천 수 : </label>
            <span>${boardVO.good}</span>
          </li> --%>
          <li>
            <label for="sc_date" class="form_group" style="width:150px;">등록일 : </label>
            <span>${seicoVO.sc_date.substring(0, 16)}</span>
          </li>
          <li>
            <label for="file1" class="form_group" style="width:150px;">
            업로드 파일: 
            <c:if test="${seicoVO.size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/seico/storage&filename=${seicoVO.file2}'>${seicoVO.file2}</A>  (${seicoVO.size2Label})
            </c:if>
            </label>
            <div>
              <c:set var='file2' value="${fn:toLowerCase(seicoVO.file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <IMG id='file2' src='./storage/${seicoVO.file1}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(file2, '.gif')}">
                  <IMG id='file2'  src='./storage/${seicoVO.file1}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(file2, '.png')}">
                  <IMG id='file2'  src='./storage/${seicoVO.file1}' onload="customize(this);">
                </c:when>
              </c:choose>
            </div>
          </li>
   <%--        <li>
            <label for="replycnt" class="form_grp" style="width:150px;">댓글수 : </label>
            <span>${boardVO.replycnt}</span>
          </li> --%>
  <%--         <li>
            <label for="" class='form_grp' style="width:150px;">블로그 카테고리 번호 : </label>
            <span>${boardVO.divisionno}</span>
          </li> --%>
          <li class='right'>
           <%--  <button type="button" onclick="location.href='./reply.do?boardno=${seicoVO.sc_no }&divisionno=${seicoVO.divisionno}&col=${searchDTO.col}&word=${searchDTO.word}'">답변</button> --%>
            <button type="button" onclick="location.href='./list.do?sc_no=${seicoVO} &col=${searchDTO.col}&word=${searchDTO.word} --%>'">목록보기</button>
            <button type="button" onclick="location.href='./update.do?sc_no=${seicoVO.sc_no} &col=${searchDTO.col}&word=${searchDTO.word}' --%>">수정</button> 
            <button type="button" onclick="location.href='./delete.do?sc_no=${seicoVO.sc_no}'">삭제</button>
          </li>
        </ul>
      </fieldset>
    </FORM>
  </DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 