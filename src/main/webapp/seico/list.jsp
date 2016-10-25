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
<%-- ---------------------------------------------------------------------------------------------- --%>
  <div class='content_menu' style='width: 100%;'>
    <A href='../seico/list.do'>게시판 목록</A>  >
    <%-- <A href='./list.do?blogcategoryno=${blogcategoryVO.blogcategoryno}'>${blogcategoryVO.title }</A>｜ --%>
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width:  8%;"></col>
        <col style="width:  8%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 9%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 12%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th>번호</th>
          <th>지역</th>
          <th>직종</th>
          <th>제목</th>
          <th>닉네임</th>
        <!--   <th>좋아요</th> -->
          <th>파일</th> 
          <th>업로드</th>
          <th>날짜</th>
          <th>기타</th>
          <th>조회</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
      
        <c:forEach var="vo" items="${list }">
          <tr>
            <td style='vertical-align: middle;'>${vo.sc_no}</td>
            <td style='vertical-align: middle;'>${vo.sc_area}</td>
            <td style='vertical-align: middle;'>${vo.sc_jobs}</td>
            <td style='vertical-align: middle;'>
             <a href="./read.do?sc_no=${vo.sc_no}">${vo.sc_title}</a> </td>
            <td style='vertical-align: middle;'>${vo.sc_name}</td>
           <%--  <td style='vertical-align: middle;'>${vo.sc_like}</td> --%>
            
            <td style='vertical-align: middle;'>
               <c:choose>
                   <c:when test="${empty vo.file2}">
                   </c:when>
                   <c:otherwise>   
                      <IMG src='./storage/${vo.file1}'>
                   </c:otherwise>
               </c:choose>
            </td>  
            <td style='vertical-align: middle;'>${vo.file2}</td>
            <td style='vertical-align: middle;'>${vo.sc_date}</td>
            <td style='vertical-align: middle;'>
              <a href="./update.do?sc_no=${vo.sc_no}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?sc_no=${vo.sc_no}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
            <td style='vertical-align: middle;'>${vo.sc_cnt}</td>
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