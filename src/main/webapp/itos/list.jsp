<%@ page contentType="text/html; charset=UTF-8"%>
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
</head>

<section class="wrapper">
  <section class="page_head">
      <div class="container">
           <div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12">
                      <nav id="breadcrumbs">
                          <ul>
                              <li><a href="../index.jsp">Home</a>/</li>
                              <li><A href='./list.do'>목록</A></li>
                              <i class="fa fa-arrow-circle-right"> IT 중고서적방</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>

<div class="container">
<div class="dividerHeading">
  <h4><span><i class='fa fa-volume-down'></i> 중고 안전거래 게시판</span></h4>
</div>

 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
    <div class="list_content" style='width: 90%;'>
    <table class="table table-striped">
      <p style='text-align: right;'>
        <A href='./create.do?io_no=${itosVO.io_no}' class="btn btn-default btn-xs"><i class="fa fa-pencil"> 글쓰기</i></A><br><br><br><br>
      </p>     
     
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style="width: 5%;">번호</th>
          <th style="width: 30%;">제목</th>
          <th style="width: 10%;">금액</th>          
          <th style="width: 10%;">등록일</th>
          <th style="width: 10%;">파일</th>
          <th style="width: 10%;">업로드 파일</th>
          <th style="width: 10%;">관리</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td style='vertical-align: middle;'>${vo.io_no}</td>
            <td style='vertical-align: middle;' id='boardtitle'>
              <c:choose>
                <c:when test="${vo.io_ansnum == 0 }">
                </c:when>
                <c:when test="${vo.io_ansnum > 0 }">
                  <c:forEach var="io_indent"  begin="1" end="${vo.io_indent }" step="1">
                     &nbsp;    
                  </c:forEach>
                    <a style='color: pink;'>Re:</a>
                </c:when>
              </c:choose>
              <a href="./read.do?io_no=${vo.io_no}">${vo.io_title}</a>
            </td>
             <td style='vertical-align: middle;'>${vo.io_cost}</td> 
            <td style='vertical-align: middle;'>${vo.io_date}</td>
            <td style='vertical-align: middle;'>
            <c:choose>
              <c:when test="${vo.io_file1 == null}"></c:when>
              <c:when test="${vo.io_file1 != null}">
                <c:set var='io_file2' value="${fn:toLowerCase(vo.io_file2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(io_file2, '.jpg')}">
                    <IMG id='io_file2' src='./storage/${vo.io_file1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(io_file2, '.gif')}">
                    <IMG id='io_file2'  src='./storage/${vo.io_file1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(io_file2, '.png')}">
                    <IMG id='io_file2'  src='./storage/${vo.io_file2}' >
                  </c:when>
                  <c:otherwise>
                    ${vo.io_file2}
                  </c:otherwise>
                </c:choose>
                </c:when>
            </c:choose>
            </td>
            <td style='vertical-align: middle;'>${vo.io_file2}</td>
            <td style='vertical-align: middle;'>
              <a href="./update.do?io_no=${vo.io_no}">수정</a>
              <a href="./delete.do?io_no=${vo.io_no} ">삭제</a>
               <a href="./reply.do?io_no=${vo.io_no} ">답변</a>
            </td>       
          </tr>
        </c:forEach>
      </tbody>
    </table>
    
  <form name="frmSearch" method="get" action="./list.do"> 
      <select name="col"> 
        <option value="">선택</option> 
        <option value="io_title" ${searchDTO.col == "io_title" ? "selected=selected" : "" }>제목</option> 
        <option value="io_content" ${searchDTO.col == "io_content" ? "selected=selected" : "" }>내용</option> 
        <option value="io_title_io_content" ${searchDTO.col == "io_title_io_content" ? "selected=selected" : "" }>제목+내용</option> 
        <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
      </select>
      <c:choose>
        <c:when test="${searchDTO.col != 'io_total' }"> <!-- 검색 상태 -->
          <input type="text" name="word" size="15" value="${searchDTO.word }">
        </c:when>
        <c:when test="${searchDTO.col == 'io_total' }"> <!-- 전체 레코드 -->
          <input type="text" name="word" size="15" value="">
        </c:when>
      </c:choose>
      <input type="submit" value="검색">
  </form>     
    <DIV class='bottom'>${paging}</DIV>
</div>
</div>
</div>
</div>
</body>
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>     
</html>