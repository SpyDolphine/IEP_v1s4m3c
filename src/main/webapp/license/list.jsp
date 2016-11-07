<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
<%-- ---------------------------------------------------------------------------------------------- --%>
  <div class='content_menu' style='width: 90%;'>
    <A href='../license/list.do'>전체 게시판 목록</A> ｜
    <A href='./list.do'>license게시판</A>｜
    <A href='./create.do'>등록</A>｜
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
          <th>자격증</th>
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
            <td>${vo.lc_no}</td>
            <td><a href="./read.do?lc_no=${vo.lc_no}">${vo.lc_title}</a></td> 
            <td>${vo.lc_good}</td>
            <td>${vo.lc_date}</td>
            <td>${vo.lc_file1}</td>
            <td>${vo.lc_file2}</td>
            <td>${vo.lc_replycnt}</td>
            <td>
              <a href="./update.do?lc_no=${vo.lc_no}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?lc_no=${vo.lc_no}"><img src="./images/delete.png" title="삭제"  border='0'/></a>

            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<%-- ---------------------------------------------------------------------------------------------- --%>
     <div style= 'margin: 100px 0 0 0;  position: relative;'>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
     </div>
</body>
<%-- body 종료 --%>
</html>