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

<script type="text/javascript">
	$(function() {

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

        <div class='content_menu' style='width: 90%;'>
          <A href='../app/list.do'>전체 게시판 목록</A> ｜ <A href='./list.do'>APP 공부 게시판</A>｜
          <A href='./create.do'>등록</A>｜ <A
            href="javascript:location.reload();">새로고침</A>
        </div>
        <div class="content" style='width: 100%;'>
          <table class="table" style='width: 100%;'>
            <colgroup>
              <col style="width: 10%;"></col>
              <col style="width: 30%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 5%;"></col>
              <col style="width: 15%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
            </colgroup>

            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>추천</th>
                <th>등록일</th>
                <th>파일</th>
                <th>업로드 파일</th>
                <th>댓글</th>
                <th>수정&삭제</th>
              </tr>

            </thead>

            <%-- table 내용 --%>
            <tbody>

              <c:forEach var="vo" items="${list }">
                <tr>
                  <td>${vo.ap_no}</td>
                  <td><a href="./read.do?ap_no=${vo.ap_no}">${vo.ap_title}</a></td>
                  <td>${vo.ap_good}</td>
                  <td>${vo.ap_date}</td>
                  <td>${vo.ap_file1}</td>
                  <td>${vo.ap_file2}</td>
                  <td>${vo.ap_replycnt}</td>
                  <td><a href="./update.do?ap_no=${vo.ap_no}"><img
                      src="./images/update.png" title="수정" border='0' /></a>
                    <a href="./delete.do?ap_no=${vo.ap_no}"><img
                      src="./images/delete.png" title="삭제" border='0' /></a>

                  </td>
                </tr>
              </c:forEach>

            </tbody>
          </table>
          <br>
          <br>
        </div>
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
