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
  /* function customize(imgObj){
    alert('file2 '+ imgObj.width());
  } */
  $(function (){
    $('#lc_file2').load(function(){ // 태그 메모리 상주후 작동
      var width = $('#lc_file2').width();
      if ($('#lc_file2').width() > screen.width * 0.6){
        $('#lc_file2').width('80%');      
      }
    });
  });

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
   
  <div class='content_menu' style='width: 100%;'>
    <A href='./list.do'>목록</A>｜
    <A href='./create.do'>등록</A>｜
    <A href='./update.do?lc_no=${licenseVO.lc_no}'>수정</A>｜
    <A href='./delete.do?lc_no=${licenseVO.lc_no}'>삭제</A> ｜
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="lc_no" value="${licenseVO.lc_no}">
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='lc_title' class="form_group" style="width:150px;">제목 : </label>
            <span>${licenseVO.lc_title}</span><br>
          </li>
          <li>
            <label for='lc_content' class="form_group" style="width:150px;">내용 : </label>
            <div>${licenseVO.lc_content}</div>
          </li>
          <li>
            <label for="lc_date" class="form_group" style="width:150px;">등록일 : </label>
            <span>${licenseVO.lc_date.substring(0, 16)}</span>
          </li>
          <li>
            <label for="lc_date1" class="form_group" style="width:150px;">시작일 : </label>
            <span>${licenseVO.lc_date1}</span>
          </li>
          <li>
            <label for="lc_date2" class="form_group" style="width:150px;">종료일 : </label>
            <span>${licenseVO.lc_date2}</span>
          </li>
          <li>
            <label for="lc_date3" class="form_group" style="width:150px;">시험일 : </label>
            <span>${licenseVO.lc_date}</span>
          </li>
          <li>
            <label for="lc_date4" class="form_group" style="width:150px;">발표일 : </label>
            <span>${licenseVO.lc_date}</span>
          </li>
          <li>
            <label for="lc_file1" class="form_group" style="width:150px;">
            업로드 파일: 
            <c:if test="${licenseVO.lc_size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/license/storage&filename=${licenseVO.lc_file2}'>${licenseVO.lc_file2}</A>  (${licenseVO.size2Label})
            </c:if>
            </label>
            <div>
              <c:set var='lc_file2' value="${fn:toLowerCase(licenseVO.lc_file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(lc_file2, '.jpg')}">
                  <IMG id='lc_file2' src='./storage/${licenseVO.lc_file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(lc_file2, '.gif')}">
                  <IMG id='lc_file2'  src='./storage/${licenseVO.lc_file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(lc_file2, '.png')}">
                  <IMG id='lc_file2'  src='./storage/${licenseVO.lc_file2}' onload="customize(this);">
                </c:when>
              </c:choose>
            </div>
          </li>
          <li class='right'>
            <button type="button" onclick="location.href='./list.do'">목록보기</button>
            <button type="button" onclick="location.href='./update.do?lc_no=${licenseVO.lc_no}'">수정</button>
            <button type="button" onclick="location.href='./delete.do?lc_no=${licenseVO.lc_no}'">삭제</button>
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