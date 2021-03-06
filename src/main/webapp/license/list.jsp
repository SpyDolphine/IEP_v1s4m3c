<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>자격증 게시판</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/javascript">
$(function(){

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
                                <i class="fa fa-arrow-circle-right">자격증 게시판</i>
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
   
  <div class='content_menu' style='width: 90%;'>
    <A href='../license/list.do'>전체 게시판 목록</A> ｜
    <A href='./list.do'>license게시판</A>｜
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th>번호</th>
          <th>자격증</th>
          <th>등록일</th>
          <th>시작일</th>
          <th>종료일</th>
          <th>시험일</th>
          <th>발표일</th>
          <th>파일</th>
          <th>업로드 파일</th>
          <th>수정&삭제</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
      
        <c:forEach var="vo" items="${list }">
          <tr>
            <td>${vo.lc_no}</td>
            <td><a href="./read.do?lc_no=${vo.lc_no}">${vo.lc_title}</a></td> 
            <td>${vo.lc_date}</td>
            <td>${vo.lc_date1}</td>
            <td>${vo.lc_date2}</td>
            <td>${vo.lc_date3}</td>
            <td>${vo.lc_date4}</td>
            <td>${vo.lc_file1}</td>
            <td>${vo.lc_file2}</td>
            <td>
              <a href="./update.do?lc_no=${vo.lc_no}"><i class="fa fa-pencil"></i> 수정 |</a>
              <a href="./delete.do?lc_no=${vo.lc_no}"><i class="fa fa-trash-o"></i> 삭제</a>

            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>

   </div>
 </div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html>