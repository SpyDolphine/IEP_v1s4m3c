<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>FnQ</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script>
$(function(){
  //전체선택 체크박스 클릭
$("#allCheck").click(function(){
  //만약 전체 선택 체크박스가 체크된상태일경우
  if($("#allCheck").prop("checked")) {
    //해당화면에 전체 checkbox들을 체크해준다
    $("input[type=checkbox]").prop("checked",true);
  // 전체선택 체크박스가 해제된 경우
  } else {
    //해당화면에 모든 checkbox들의 체크를해제시킨다.
    $("input[type=checkbox]").prop("checked",false);
  }
})
});

function checkDel() {
  var r = confirm('삭제하시겠나요?');

  var chkList = document.getElementsByName('check');
  var arr = new Array();
  var cnt = 0;
  if (r == true) {
    for ( var idx = chkList.length - 1; 0 <= idx; idx--) {
      if (chkList[idx].checked) {
       arr[cnt] = chkList[idx].value;
       cnt++;
      }
     }
     if (arr.length != 0) {
      location.href='./delete.do?arr='+arr;
     } else {
      alert('체크를 하셔야합니다.');
      return;
     }
  } else {
    
  }
 }
</script>
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <i class="fa fa-arrow-circle-right"> FnQ</i>
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
<DIV class='title'>자주하는 ${ch} 질문</DIV>
     전체선택 : <input type="checkbox" id="allCheck"/>  
    <input type="button" onclick="checkDel(); " value="삭제">
    
<DIV class='content' style='width: 50%;'>
<FORM name='frm' method='GET'>
<section class="content faq">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
        <div class="panel-group accordion" id="accordion">
          <c:forEach var="fnqVO" items="${list }">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                    <input type="checkbox" name="check" id="check" value="${fnqVO.fq_no}">
                    <a data-toggle="collapse" data-parent="#accordion" href="#${fnqVO.fq_no}">
                        ${fnqVO.fq_question}
                    </a>
                </h4>
              </div>
              <div id="${fnqVO.fq_no}" class="panel-collapse collapse">
                  <div class="panel-body">${fnqVO.fq_answer}
                   <button type="button" class="close" onclick="location.href='./delete.do?fq_no=${fnqVO.fq_no}'">
                     <i class="fa fa-trash-o"></i></button>
                   <button type="button" class="close" onclick="location.href='./update.do?fq_no=${fnqVO.fq_no}'">
                     <i class="fa fa-pencil"></i>&nbsp;</button>  
                   </div>                
              </div>
            </div>
          </c:forEach>
        </div>
        <button type='button' onclick="location.href='./create.do'">등록</button>
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
<form name="frmSearch" method="get" action="./listh.do">  
<DIV class='bottom'>
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
    <DIV class='bottom'>${paging}</DIV>
  </div>
</DIV>
</form>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html> 