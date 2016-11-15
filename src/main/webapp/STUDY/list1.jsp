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
<script type="text/javascript">

function change1(obj){
  obj.style.background = '#d1d1e0';
}
function change2(obj){
  obj.style.background = '#f2f2f2';
}

</script>
<style>

.study_menubar {
    text-align: center;
    margin : 0 0 50px 0; 
 }

.gate {
  border:3px solid #e6e6ff; 
  background-color: #f2f2f2; 
  padding:10px 20px;
  margin: 0 5px;
  border-radius: 20px;
}

.web {
  border:3px solid #e6e6ff; 
  background-color: #f2f2f2; 
  padding:10px 20px;
  margin: 0 5px;
  border-radius: 20px;
}

</style> 
</head>

<section class="wrapper">
  <section class="page_head">
      <div class="container">
           <div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12">
                      <nav id="breadcrumbs">
                          <ul>
                              <li><a href="../index.jsp">Home</a>/</li>
                              <li><A href='#'>목록</A></li>
                              <i class="fa fa-arrow-circle-right"> ${ti}</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>

<div class="row sub_content">
    <div class="col-lg-12 isotope">
    <ul class='study_menubar'>
        <a href="./list.do?gate=AJ" class='gate' onmouseout="change2(this)" onmouseover="change1(this)">JAVA</a>
        <a href="./list.do?gate=AC" class='gate' onmouseout="change2(this)" onmouseover="change1(this)">C언어</a>
        <a href="./list.do?gate=AP" class='gate' onmouseout="change2(this)" onmouseover="change1(this)">파이썬</a>
        
        <a href="./list.do?gate=WH" class='web' onmouseout="change2(this)" onmouseover="change1(this)">HTML</a>
        <a href="./list.do?gate=WC" class='web' onmouseout="change2(this)" onmouseover="change1(this)">CSS</a>
        <a href="./list.do?gate=WJ" class='web' onmouseout="change2(this)" onmouseover="change1(this)">JSP</a>
    </ul>
    </div>
</div>
    
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
    <div class="list_content" style='width: 90%;'>
    <table class="table table-striped">
      <p style='text-align: right;'>
        <A href='./create.do?gate=${gate}' class="btn btn-default btn-xs"><i class="fa fa-pencil"> 글쓰기</i></A>
      </p>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style="width: 5%;">번호</th>
          <th style="width: 40%;">제목</th>
          <th style="width: 10%;">등록일</th>
          <th style="width: 5%;"><i class="fa fa-gear"></i> 관리</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td>${vo.sy_no}</td>
            <td style='vertical-align: middle;' id='boardtitle'>
            
            <a href="./read.do?sy_no=${vo.sy_no}">${vo.title}</a>
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
            <td>${vo.sy_date}</td>
            <td>
              <a href="./update.do?sy_no=${vo.sy_no}"><i class="fa fa-pencil"></i></a>
              <a href="./delete.do?sy_no=${vo.sy_no}"><i class="fa fa-trash-o"></i></a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
   </div>
   
<DIV class='bottom'>${paging}</DIV>
</div></div></div>
</body>
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>     
</html>