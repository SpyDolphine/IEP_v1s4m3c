<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){

});
</script>

<script type="text/javascript">
</script>
</head>

<body leftmargin="0" topmargin="0">
<div class="container">
  <jsp:include page="/menu/top.jsp" flush='false' />

     
     
  <form name="frmSearch" method="get" action="./list.do"> 
 
    <div class='content_menu' style='width: 100%;'>
      <A href='../itos/list.do'>게시판 목록</A> >
      <A href='./create.do?io_no=${itosVO.io_no}'>등록</A>｜
      <A href="javascript:location.reload();">새로고침</A>
  
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
          <th>금액</th>          
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
            <td style='vertical-align: middle;'>${vo.io_no}</td>
            <td style='vertical-align: middle;'>
              <c:choose>
                <c:when test="${vo.io_ansnum == 0 }">
                  <img src='./images/url4.png' style='width: 14px;'>
                </c:when>
                <c:when test="${vo.io_ansnum > 0 }">
                  <c:forEach var="io_indent"  begin="1" end="${vo.io_indent }" step="1">
                    <img src='./images/white.jpg' style='width: 25px; opacity: 0.0;'>    
                  </c:forEach>
                  <img src='./images/reply3.jpg'>
                </c:when>
              </c:choose>
              <a href="./read.do?io_no=${vo.io_no}&col=${searchDTO.col}&word=${searchDTO.word}">${vo.io_title}</a>
            </td>
            <td style='vertical-align: middle;'>${vo.io_good}</td>
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
            <td style='vertical-align: middle;'>${vo.io_replycnt}</td>
            <td style='vertical-align: middle;'>
              <a href="./update.do?io_no=${vo.io_no}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?io_no=${vo.io_no} "><img src="./images/delete.png" title="삭제"  border='0'/></a>
            
            </td>
            <td>${vo.io_grpno }</td>
            <td>${vo.io_indent }</td>
            <td>${vo.io_ansnum }</td>
            
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
  </div>

  <DIV class='bottom'></DIV>
  
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
  </div>
</body>

</html>