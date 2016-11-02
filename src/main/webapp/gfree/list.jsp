<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상담공감방</title>
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
                              <i class="fa fa-arrow-circle-right"> 상담공감방</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>
        
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
    <div class="list_content" style='width: 90%;'>
    <table class="table table-striped">
      <p style='text-align: right;'>
        <A href='./create.do' class="btn btn-default btn-xs"><i class="fa fa-pencil"> 글쓰기</i></A>
      </p>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style="width: 5%;"></th>
          <th style="width: 40%;">제목</th>
          <th style="width: 10%;">글쓴이</th>
          <th style="width: 10%;">등록일</th>
          <th style="width: 5%;">조회수</th>
          <th style="width: 5%;">좋아요</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td style='vertical-align: middle;'>${vo.cm_no}</td>
            <td style='vertical-align: middle;' id='boardtitle'>
              <c:choose>
                <c:when test="${vo.ansnum == 0 }">
                </c:when>
                <c:when test="${vo.ansnum > 0 }">
                  <c:forEach var="indent"  begin="1" end="${vo.indent }" step="1">
                     &nbsp;
                  </c:forEach>
                    <a style='color: pink;'>Re:</a>
                </c:when>
              </c:choose>
              <a href="./read.do?cm_no=${vo.cm_no}">${vo.cm_title}</a>
              <c:choose>
                <c:when test="${fn:endsWith(vo.file2, '.jpg')}">
                  <img src='./images/ico-img.gif' title='사진'>
                </c:when>
                <c:when test="${fn:endsWith(vo.file2, '.png')}">
                  <img src='./images/ico-img.gif' title='사진'>
                </c:when>
                <c:when test="${fn:endsWith(vo.file2, '.gif')}">
                  <img src='./images/ico-img.gif' title='사진'>
                </c:when>                
                <c:when test="${fn:endsWith(vo.file2, '.zip')}">
                  <img src='./images/ico_file2.gif' title='파일'>
                </c:when>                              
                <c:when test="${fn:endsWith(vo.file2, '.txt')}">
                  <img src='./images/ico_file2.gif' title='파일'>
                </c:when>                              
              </c:choose>
               <a style='color:grey;'>[${vo.replycnt}]</a> 
            </td> 
            <td style='vertical-align: middle;'>${vo.cm_nick}</td>
            <td style='vertical-align: middle;'>${vo.cm_date}</td>
            <td style='vertical-align: middle;'>${vo.cm_cnt}</td>
            <td style='vertical-align: middle;'>${vo.cm_likeit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

   <form name="frmSearch" method="get" action="./list.do">
      <select name="col"> 
        <option value="">선택</option> 
        <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
        <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
        <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
        <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
      </select>
      <c:choose>
        <c:when test="${searchDTO.col != 'total' }"> <!-- 검색 상태 -->
          <input type="text" name="word" size="15" value="${searchDTO.word }">
        </c:when>
        <c:when test="${searchDTO.col == 'total' }"> <!-- 전체 레코드 -->
          <input type="text" name="word" size="15" value="">
        </c:when>
      </c:choose>
      <input type="submit" value="검색">
  </form>  
<DIV class='bottom'>${paging}</DIV>
</div></div></div>
</body>
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>     
</html>