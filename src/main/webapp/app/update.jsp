<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>APP 공부 게시판</title>

</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content');
		// content: textarea name
		if (CKEDITOR.instances['ap_content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['ap_content'].focus();
			return false;
		}
	};
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
          <A href='../app/list.do'>게시판 목록</A> > <A
            href='./list.do?ap_no=${appVO.ap_no }'>${appVO.ap_title }</A>｜
          <A href="javascript:history.back();">취소</A>
        </div>

        <DIV class='content' style='width: 100%;'>
          <FORM name='frm' method='POST' action='./update.do'
            enctype="multipart/form-data">
            <input type='hidden' name='ap_no' id='ap_no'
              value='${appVO.ap_no}'>
            <ul>
              <li><label class='form_grp' for='ap_title'>제목</label>
                <input type='text' name='ap_title' id='ap_title'
                value='${appVO.ap_title}' size='60' required="required">
              </li>
              <li><label class='form_grp' for='ap_content'>내용</label><br>
                <TEXTAREA name='ap_content' id='ap_content' rows='10'
                  cols='70'>${appVO.ap_content}</TEXTAREA></li>
              <li><label class='form_grp' for='ap_file2'>등록된
                  파일</label> <c:set var='ap_file2'
                  value="${fn:toLowerCase(appVO.ap_file2)}" /> <c:choose>
                  <c:when test="${fn:endsWith(ap_file2, '.jpg')}">
                    <IMG src='./storage/${appVO.ap_file1}'>
                  </c:when>
                  <c:when test="${fn:endsWith(ap_file2, '.gif')}">
                    <IMG id='ap_file2' src='./storage/${appVO.ap_file1}'>
                  </c:when>
                  <c:when test="${fn:endsWith(ap_file2, '.png')}">
                    <IMG id='ap_file2' src='./storage/${appVO.ap_file1}'>
                  </c:when>
                  <c:when test="${appVO.ap_file2.length() > 0}">
              ${appVO.ap_file1 } 
            </c:when>
                </c:choose></li>
              <li><label class='label' for='ap_file2'>업로드
                  파일</label> <input type="file" name='file2MF' id='file2MF'
                size='40'></li>
              <li class='right'>
                <button type="submit">수정</button>
                <button type="button"
                  onclick="location.href='./list.do?ap_no=${appVO.ap_no}'">목록[취소]</button>
              </li>
            </ul>
          </FORM>
        </DIV>

      </div>
    </div>
  </div>
</body>

<!-- -------------------------------------------- -->
<div style='margin: 100px 0 0 0; position: relative;'>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html>
