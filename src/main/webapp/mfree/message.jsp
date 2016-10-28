<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정모방</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/JavaScript">
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
                              <i class="fa fa-arrow-circle-right"> Message </i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>

<body>
<div class="container">

<div class="dividerHeading">
  <h4><span>알림</span></h4>
</div>

 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
 
<DIV class='message'>
  <fieldset>
    <ul>
      <c:forEach var="msgs" items='${msgs }'>
       ${msgs }<br><br>
      </c:forEach>
      
      <c:forEach var="links" items='${links }'>
       ${links }
      </c:forEach>
    </ul>
  </fieldset>
   </DIV>
  </div>
 </div>
</div>
 
<!-- -------------------------------------------- -->
</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html> 