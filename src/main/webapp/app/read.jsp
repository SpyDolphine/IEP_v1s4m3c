<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>APP 공부 게시판</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/javascript">
  /* function customize(imgObj){
    alert('file2 '+ imgObj.width());
  } */
  $(function (){
    $('#ap_file2').load(function(){ // 태그 메모리 상주후 작동
      var width = $('#ap_file2').width();
      if ($('#ap_file2').width() > screen.width * 0.6){
        $('#ap_file2').width('80%');      
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
                                <i class="fa fa-arrow-circle-right">APP 공부 게시판</i>
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
    <A href='./list.do?ap_no=${appVO.ap_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}'></A>｜
    <A href='./create.do?ap_no=${appVO.ap_no}'>등록</A>｜
    <A href='./update.do?ap_no=${appVO.ap_no}&col=${searchDTO.col}&word=${searchDTO.word}'>수정</A>｜
    <A href='./reply.do?ap_no=${appVO.ap_no }&ap_no=${appVO.ap_no}&col=${searchDTO.col}&word=${searchDTO.word}'>답변</A>｜
    <A href='./delete.do?ap_no=${appVO.ap_no}&ap_no=${appVO.ap_no}'>삭제</A>
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="ap_no" value="${appVO.ap_no}">
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='ap_title' class="form_group" style="width:150px;">제목 : </label>
            <span>${appVO.ap_title}</span><br>
          </li>
          <li>
            <label for='ap_content' class="form_group" style="width:150px;">내용 : </label>
            <div>${appVO.ap_content}</div>
          </li>
          <li>
            <label for="ap_good" class="form_group" style="width:150px;">추천 수 : </label>
            <span>${appVO.ap_good}</span>
          </li>
          <li>
            <label for="ap_date" class="form_group" style="width:150px;">등록일 : </label>
            <span>${appVO.ap_date.substring(0, 16)}</span>
          </li>
          <li>
            <label for="ap_file1" class="form_group" style="width:150px;">
            업로드 파일: 
            <c:if test="${appVO.ap_size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/app/storage&filename=${appVO.ap_file2}'>${appVO.ap_file2}</A>  (${appVO.size2Label})
            </c:if>
            </label>
            <div>
              <c:set var='ap_file2' value="${fn:toLowerCase(appVO.ap_file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(ap_file2, '.jpg')}">
                  <IMG id='ap_file2' src='./storage/${appVO.ap_file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(ap_file2, '.gif')}">
                  <IMG id='ap_file2'  src='./storage/${appVO.ap_file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(ap_file2, '.png')}">
                  <IMG id='ap_file2'  src='./storage/${appVO.ap_file2}' onload="customize(this);">
                </c:when>
              </c:choose>
            </div>
          </li>
          <li>
            <label for="ap_replycnt" class="form_grp" style="width:150px;">댓글수 : </label>
            <span>${appVO.ap_replycnt}</span>
          </li>
          <li class='right'>
            <button type="button" onclick="location.href='./reply.do?ap_no=${appVO.ap_no }&ap_no=${appVO.ap_no}&col=${searchDTO.col}&word=${searchDTO.word}'">답변</button>
            <button type="button" onclick="location.href='./list.do?ap_no=${appVO.ap_no}&col=${searchDTO.col}&word=${searchDTO.word}'">목록보기</button>
            <button type="button" onclick="location.href='./update.do?ap_no=${appVO.ap_no}&col=${searchDTO.col}&word=${searchDTO.word}'">수정</button>
            <button type="button" onclick="location.href='./delete.do?ap_no=${appVO.ap_no}'">삭제</button>
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