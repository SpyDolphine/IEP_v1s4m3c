<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
    
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
  
});
</script>
 
<script type="text/javascript">
</script>
</head>
 
<%-- body 시작 --%>
<body leftmargin="0" topmargin="0">
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
     <jsp:include page="/menu/left.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
  <div class='content_menu' style='width: 100%;'>
    <A href='../blogcategory/list.do'>전체 게시판 목록</A>  >
    <A href='./list.do?blogcategoryno=${blogcategoryVO.blogcategoryno}'>${blogcategoryVO.title }</A>｜
    <A href='./create.do?blogcategoryno=${blogcategoryVO.blogcategoryno}'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
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
          <th>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
      
        <c:forEach var="vo" items="${list }">
          <tr>
            <td style='vertical-align: middle;'>${vo.blogno}</td>
            <td style='vertical-align: middle;'><a href="./read.do?blogno=${vo.blogno}">${vo.title}</a></td> 
            <td style='vertical-align: middle;'>${vo.good}</td>
            <td style='vertical-align: middle;'>${vo.rdate}</td>
            <td style='vertical-align: middle;'>
               <c:choose>
                   <c:when test="${fn:endsWith(vo.file2, '.txt')}">
                      <IMG src='./images/update.png'>
                   </c:when>
                   <c:when test="${fn:endsWith(vo.file2, '.zip')}">
                      <IMG src='./images/delete.png'>
                   </c:when>
                   <c:when test="${empty vo.file1}">
                   
                   </c:when>
                   <c:otherwise>
                      <IMG src='./storage/${vo.file1}'>
                   </c:otherwise>
               </c:choose>
            </td>
            <td style='vertical-align: middle;'>${vo.file2}</td>
            <td style='vertical-align: middle;'>${vo.replycnt}</td>
            <td style='vertical-align: middle;'>
              <a href="./update.do?blogno=${vo.blogno}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?blogno=${vo.blogno}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<%-- ---------------------------------------------------------------------------------------------- --%>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<%-- body 종료 --%>
</html>