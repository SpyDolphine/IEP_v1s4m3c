<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%
 String root = request.getContextPath();
 
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
 
});
</script>
 
<script type="text/javascript">
</script>
</head>
 
<body leftmargin="0" topmargin="0">
  <div class="container">
     
  <div class='content_menu' style='width: 100%;'>
    <A href='./list.do'>공모전 목록</A> |
    <a href='<%=root %>/index.do'> 홈으로 </a>|
    <c:if test="${sessionScope.me_grade eq 'A' }">        
    <A href='./create.do'>등록</A>｜
    </c:if>
    <A href="javascript:location.reload();">새로고침</A> |
  </div>
  <div class="content" style='width: 80%;'>
    <table class="table table-striped" style='width: 80%;text-align: center;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
         <col style="width: 5%;"></col>
        </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th>번호</th>
          <th>포스터</th>
          <th>공모전 명칭</th>
          <th>주최</th>
          <th>접수 기간</th>
          <th>조회수</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td style='vertical-align: middle;'>${vo.ct_no}</td>
            <td style='vertical-align: middle;'>
            <c:choose>
              <c:when test="${vo.ct_file1 == null}"></c:when>
              <c:when test="${vo.ct_file1 != null}">
                <c:set var='ct_file2' value="${fn:toLowerCase(vo.ct_file2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(ct_file2, '.jpg')}">
                    <IMG id='ct_file2' src='./storage/${vo.ct_file1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ct_file2, '.gif')}">
                    <IMG id='ct_file2'  src='./storage/${vo.ct_file1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ct_file2, '.png')}">
                    <IMG id='ct_file2'  src='./storage/${vo.ct_file2}' >
                  </c:when>
                  <c:otherwise>
                    ${vo.ct_file2}
                  </c:otherwise>
                </c:choose>
                </c:when>
            </c:choose>
            </td>
            <td style='vertical-align: middle;'>
              <a href="./read.do?ct_no=${vo.ct_no}">${vo.ct_title}</a> 
            </td> 
              <td style='vertical-align: middle;'>${vo.ct_host}</td>
              <td style='vertical-align: middle;'>
              <c:if test="${empty vo.ct_startdate} && ${empty vo.ct_enddate}">
              접수 기간 등록 예정입니다.
              </c:if>
              ${vo.ct_startdate}<br>~<br>${vo.ct_enddate}</td>
              <td style='vertical-align: middle;'>${vo.ct_cnt}</td>
            </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  </div>
</body>
 
</html>
 