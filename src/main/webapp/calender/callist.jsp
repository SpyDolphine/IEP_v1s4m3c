<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%
 String root = request.getContextPath();
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>일정 </title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./calist.do'>목록</A></li>   
                                <li class="fa fa-arrow-circle-right"> 일정</li>  
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
      <div class='content_menu' style='width: 100%;'>
  
    <a href='<%=root %>/index.do'> 홈으로 </a>|
    <A href='./create.do'>등록</A>｜
    <A href='./calendermode.do?me_no=${sessionScope.me_no }'>달력 형</A>｜
    <A href="javascript:location.reload();">새로고침</A> |
  </div>

   
   <div class="content" style='width: 80%;'>
    <table class="table table-striped" style='width: 80%;text-align: center;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 40%;"></col>
        
        </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style="text-align: center">접수기간</th>
          <th style="text-align: center">발표일자</th>
          <th style="text-align: center">당일</th>
          <th style="text-align: center">제목</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="vo" items="${callist }">
          <tr>
              <td>${vo.startdate }<br>~<br>${vo.enddate }</td>
              <td>${vo.statedate }</td>
              <td>${vo.daydate }</td>
              <td>${vo.title }</td>
            </tr>
        </c:forEach>
      </tbody>
    </table>
    
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