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
              href='./create.do?qa_no=${tqnaVO.qa_no}'>등록</A>｜ <A
              href="javascript:location.reload();">새로고침</A> <select
              name="col">
              <option value="">선택</option>
              <option value="qa_title"
                ${searchDTO.col == "qa_title" ? "selected=selected" : "" }>제목</option>
              <option value="qa_content"
                ${searchDTO.col == "qa_content" ? "selected=selected" : "" }>내용</option>
              <option value="qa_title_qa_content"
                ${searchDTO.col == "qa_title_qa_content" ? "selected=selected" : "" }>제목+내용</option>
              <option value="total"
                ${searchDTO.col == "" ? "selected=selected" : "" }>전체
                목록</option>
            </select>
            <c:choose>
              <c:when test="${searchDTO.col != 'qa_total' }">
                <!-- 검색 상태 -->
                <input type="text" name="word" size="15"
                  value="${searchDTO.word }">
              </c:when>
              <c:when test="${searchDTO.col == 'qa_total' }">
                <!-- 전체 레코드 -->
                <input type="text" name="word" size="15" value="">
              </c:when>
            </c:choose>

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
                <th>파일</th>
                <th>업로드 파일</th>
                <th>댓글</th>
                <th>기타</th>
                <th>grpno</th>
                <th>indent</th>
                <th>ansnum</th>
              </tr>

            </thead>

            <%-- table 내용 --%>
            <tbody>

              <c:forEach var="vo" items="${list }">
                <tr>
                  <td style='vertical-align: middle;'>${vo.qa_no}</td>
                  <td style='vertical-align: middle;'><c:choose>
                      <c:when test="${vo.qa_ansnum == 0 }">
                        <img src='./images/url4.png'
                          style='width: 14px;'>
                      </c:when>
                      <c:when test="${vo.qa_ansnum > 0 }">
                        <c:forEach var="qa_indent" begin="1"
                          end="${vo.qa_indent }" step="1">
                          <img src='./images/white.jpg'
                            style='width: 25px; opacity: 0.0;'>
                        </c:forEach>
                        <img src='./images/reply3.jpg'>
                      </c:when>
                    </c:choose> <a
                    href="./read.do?qa_no=${vo.qa_no}&col=${searchDTO.col}&word=${searchDTO.word}">${vo.qa_title}</a>

                  </td>

                  <td style='vertical-align: middle;'>${vo.qa_good}</td>
                  <td style='vertical-align: middle;'>${vo.qa_date}</td>
                  <td style='vertical-align: middle;'><c:choose>
                      <c:when test="${vo.qa_file1 == null}"></c:when>
                      <c:when test="${vo.qa_file1 != null}">
                        <c:set var='qa_file2'
                          value="${fn:toLowerCase(vo.qa_file2)}" />
                        <c:choose>
                          <c:when
                            test="${fn:endsWith(qa_file2, '.jpg')}">
                            <IMG id='qa_file2'
                              src='./storage/${vo.qa_file1}'>
                          </c:when>
                          <c:when
                            test="${fn:endsWith(qa_file2, '.gif')}">
                            <IMG id='qa_file2'
                              src='./storage/${vo.qa_file1}'>
                          </c:when>
                          <c:when
                            test="${fn:endsWith(qa_file2, '.png')}">
                            <IMG id='qa_file2'
                              src='./storage/${vo.qa_file2}'>
                          </c:when>
                          <c:otherwise>
                    ${vo.qa_file2}
                  </c:otherwise>
                        </c:choose>
                      </c:when>
                    </c:choose></td>
                  <td style='vertical-align: middle;'>${vo.qa_file2}</td>
                  <td style='vertical-align: middle;'>${vo.qa_replycnt}</td>
                  <td style='vertical-align: middle;'><a
                    href="./update.do?qa_no=${vo.qa_no}"><img
                      src="./images/update.png" title="수정" border='0' /></a>
                    <a href="./delete.do?qa_no=${vo.qa_no} "><img
                      src="./images/delete.png" title="삭제" border='0' /></a>

                  </td>
                  <td>${vo.qa_grpno }</td>
                  <td>${vo.qa_indent }</td>
                  <td>${vo.qa_ansnum }</td>

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
