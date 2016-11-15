<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>

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
              <i class="fa fa-arrow-circle-right">Q&A 게시판</i>
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

        <form name="frmSearch" method="get" action="./list.do">

          <div class='content_menu' style='width: 100%;'>
            <A href='./list.do'>게시판 목록</A> > <A
              href='./create.do?qa_no=${tqnaVO.qa_no}'>등록</A>｜ 
              <A href="javascript:location.reload();">새로고침</A>

            <input type="submit" value="검색">
          </div>
        </form>
 
        <div class="content" style='width: 100%;'>
          <table class="table table-striped" style='width: 100%;'>
            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>추천</th>
                <th>등록일</th>
              </tr>

            </thead>

            <%-- table 내용 --%>
            <tbody>

              <c:forEach var="vo" items="${list }">
                <tr>
                  <td style='vertical-align: middle;'>${vo.qa_no}</td>
                  <td style='vertical-align: middle;'>${vo.qa_title}</td>
                  <td style='vertical-align: middle;'>${vo.qa_good}</td>
                  <td style='vertical-align: middle;'>${vo.qa_date}</td>

                  <td style='vertical-align: middle;'>
                  <a href="./update.do?qa_no=${vo.qa_no}"><i class="fa fa-pencil"></i> 수정 |</a>
                  <a href="./delete.do?qa_no=${vo.qa_no} "><i class="fa fa-trash-o"></i> 삭제</a>
                  </td>


                </tr>
              </c:forEach>

            </tbody>
          </table>
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
