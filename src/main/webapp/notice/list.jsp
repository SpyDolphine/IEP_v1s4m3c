<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공지사항</title>    


<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
</script>
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
              <i class="fa fa-arrow-circle-right">공지사항</i> 
            </ul> 
          </nav>
        </div>
      </div>
    </div>
  </section>
</section>
<body>
  <DIV class='title'>공지사항 목록</DIV>

  <TABLE class='table' style='width: 70%;'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 70%;'/>
      <col style='width: 20%;'/>
    </colgroup>
    <TR>
      <TH class='th'>번호</TH>
      <TH class='th'>제목</TH>
      <TH class='th'>기타</TH>
    </TR>
    <c:forEach var="vo" items="${list }">
    <TR>
      <TD class='td'>${vo.nt_no}</TD>
      <TD class='td'><a href='./read.do?nt_no=${vo.nt_no}'>${vo.nt_title}</a></TD>
      <TD class='td'>
        <A href="./update.do?nt_no=${vo.nt_no}"><IMG src='../menu/images/update.png' title='수정'></A>
        <A href="./delete.do?nt_no=${vo.nt_no}" onclick="return confirm('삭제하시겠습니까?')"><IMG src='../menu/images/delete.png' title='삭제'></A>
      </TD>
    </TR>
    </c:forEach>
  </TABLE>
    <form name="frmSearch" method="get" action="./list.do">  
    <DIV class='bottom'>
      <button type='button' onclick="location.reload();">새로 고침</button>
      <div style='text-align: center;'>
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
         
        <input type="submit" value="검색"> 
      </div>
    </DIV>
    </form>
  <DIV class='bottom'>
    <button type='button' onclick="location.href='./create.do'">등록</button>
    <button type='button' onclick="location.reload();">새로 고침</button>
  </DIV>
<!-- -------------------------------------------- -->
</body>
<DIV class='bottom'>${paging}</DIV>
<div style= 'margin: 100px 0 0 0;  position: relative;'>   
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html> 