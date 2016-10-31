<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>자소서</title>    
 
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
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right">자소서</i> 
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

    <DIV class='title'>자소서 쓰는 요령</DIV>
     
    <DIV class='content' style='width: 50%;'>
    <FORM name='frm' method='POST'>
    <button type='button' onclick="location.href='./create.do'">등록</button>
    <section class="content faq">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="panel-group accordion" id="accordion">
                <c:forEach var="aboutmeVO" items="${list }">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#${aboutmeVO.am_no}">
                          ${aboutmeVO.am_title}
                      </a>
                      <button type='button' onclick="location.href='./update.do?am_no=${aboutmeVO.am_no}'">수정</button>
                      <button type='button' onclick="location.href='./delete.do?am_no=${aboutmeVO.am_no}'">삭제</button>
                  </h4>
                </div>
                <div id="${aboutmeVO.am_no}" class="panel-collapse collapse">
                    <div class="panel-body">${aboutmeVO.am_content}</div>
                </div>
              </div>
                </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
    </FORM>
    </DIV>

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