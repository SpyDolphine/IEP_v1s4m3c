<%@ page contentType="text/html; charset=UTF-8" %>
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
</head> 
<body>
 
<DIV class='title'>자주하는 ${ch} 질문</DIV>
 
<DIV class='content' style='width: 50%;'>
<FORM name='frm' method='POST'>
<button type='button' onclick="location.href='./create.do'">등록</button>
<section class="content faq">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
        <div class="panel-group accordion" id="accordion">
            <c:forEach var="fnqVO" items="${list }">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion" href="#${fnqVO.fq_no}">
                      ${fnqVO.fq_question}
                  </a>
                  <button type='button' onclick="location.href='./update.do?fq_no=${fnqVO.fq_no}'">수정</button>
                  <button type='button' onclick="location.href='./delete.do?fq_no=${fnqVO.fq_no}'">삭제</button>
              </h4>
            </div>
            <div id="${fnqVO.fq_no}" class="panel-collapse collapse">
                <div class="panel-body">${fnqVO.fq_answer}</div>
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
 
<!-- -------------------------------------------- -->
</body>
    <jsp:include page="/menu/bottom.jsp" flush='false' />     
<!-- -------------------------------------------- -->
</html>
