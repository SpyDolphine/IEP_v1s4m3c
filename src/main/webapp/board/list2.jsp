<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
     <jsp:include page="/menu/left.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
  <form name="frmSearch" method="get" action="./list.do"> 
  <input type='hidden' name='blogcategoryno' id='blogcategoryno' value='${blogcategoryVO.blogcategoryno }'>
  <div class='content_menu' style='width: 100%;'>
    <A href='../division/list.do'>게시판 목록</A> >
    <A href='./list.do?blogcategoryno=${blogcategoryVO.blogcategoryno}'>${blogcategoryVO.title } (${totalRecord })</A>

  </form> 
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 5%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr style="text-align: center;">
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
            <td style='vertical-align: middle;'>
              <a href="./read.do?blogno=${vo.blogno}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">${vo.title}</a> 
            </td> 
            <td style='vertical-align: middle;'>${vo.good}</td>
            <td style='vertical-align: middle;'>${vo.rdate}</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:set var='file2' value="${fn:toLowerCase(vo.file2)}" />
               <c:choose>
                   <c:when test="${fn:endsWith(vo.file2, '.txt')}">
                      <A href='${pageContext.request.contextPath}/download?dir=/blog/storage&filename=${vo.file2}'>
                      <IMG src='../menu/images/textico.png'>
                      </A>
                   </c:when>
                   <c:when test="${fn:endsWith(vo.file2, '.zip')}">
                      <A href='${pageContext.request.contextPath}/download?dir=/blog/storage&filename=${vo.file2}'>
                      <IMG src='../menu/images/zipico.png'>
                      </A>
                   </c:when>
                   <c:when test="${fn:endsWith(vo.file2, '.jpg')}">
                      <A href='${pageContext.request.contextPath}/download?dir=/blog/storage&filename=${vo.file2}'>
                      <IMG src='./storage/${vo.file1}'>
                      </A>
                   </c:when>
                   <c:when test="${empty vo.file2}">
                   
                   </c:when>
                   <c:otherwise>
                      <A href='${pageContext.request.contextPath}/download?dir=/blog/storage&filename=${vo.file2}'>
                      <IMG src='../menu/images/fileico.png'>
                      </A>
                   </c:otherwise>
               </c:choose>
            </td>
            <td style='vertical-align: middle;'>
            <c:if test="${vo.size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/blog/storage&filename=${vo.file2}'>${fn:substring(vo.file2, 0, 10)}</A><br>(${vo.size2Label})
            </c:if>
            </td>
            <td style='vertical-align: middle;'>${vo.replycnt}</td>
            <td style='vertical-align: middle;'>
              <a href="./update.do?blogno=${vo.blogno}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?blogno=${vo.blogno}&blogcategoryno=${vo.blogcategoryno}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
  <div style='text-align: right;'>
    <select name="col"> 
      <option value="">선택</option> 
      <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
      <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
      <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
      <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
    </select>
    <c:choose>
      <c:when test="${searchDTO.col != 'total' }">
        <input type="text" name="word" size="15" value="${searchDTO.word }">
      </c:when>
      <c:when test="${searchDTO.col == 'total' }">
        <input type="text" name="word" size="15" value="">
      </c:when>
    </c:choose>
     
    <input type="submit" value="검색">｜ 
    <A href='./create.do?blogcategoryno=${blogcategoryVO.blogcategoryno }'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
      </div>
    </div>
  </div>
<%-- ---------------------------------------------------------------------------------------------- --%>
     <DIV class='bottom'>${paging}</DIV>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
     </div>
</body>
<%-- body 종료 --%>
</html>