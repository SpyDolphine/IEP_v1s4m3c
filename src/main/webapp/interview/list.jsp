<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>면접</title>    
 
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
<body>
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
   <DIV class='content' style='width: 50%;'>
<FORM name='frm' method='POST'>
    <section class="content faq">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
<button type='button' onclick="location.href='./create.do'">등록</button>
        <div class="panel-group accordion" id="accordion">
            <c:forEach var="interviewVO" items="${list }">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion" href="#${interviewVO.iv_no}">
                      ${interviewVO.iv_title}
                  </a>
                  <button type='button' onclick="location.href='./update.do?iv_no=${interviewVO.iv_no}'">수정</button>
                  <button type='button' onclick="location.href='./delete.do?iv_no=${interviewVO.iv_no}'">삭제</button>
              </h4>
            </div>
            <div id="${interviewVO.iv_no}" class="panel-collapse collapse">
                <div class="panel-body">${interviewVO.iv_content}</div>
            </div>
          </div>
            </c:forEach>
        </div>
      </div>
    </div>
  </div>

</section>
</FORM>
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