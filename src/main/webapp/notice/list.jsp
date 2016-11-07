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
<style>
.nlist{
background-color: skyblue;
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
              <li><A href='./list.do'>목록</A></li>   
              <i class="fa fa-arrow-circle-right"> 공지사항</i> 
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
    <div class="list_content" style='width: 90%;'>
      <p style='text-align: right;'>
        <A href='./create.do' class="btn btn-default btn-xs"><i class="fa fa-pencil"> 글쓰기</i></A>
      </p>
   <form name='form'>
   <div class='left'>
     &nbsp;<input type="checkbox" id="allCheck"/> 전체선택 
     <A onclick="checkDel();" class="btn btn-default btn-xs"><i class="fa fa-trash-o"></i> 삭제</A>
   </div>
   
  <table class="table table-striped">
   <thead>
    <TR>
      <TH style='width: 5%;'>선택</TH>
      <TH style='width: 5%;'>번호</TH>
      <TH style='width: 80%;'>제목</TH>
      <TH style='width: 10%;'>기타</TH>
    </TR>
   </thead>
    
    
   <tbody> 
    <c:forEach var="vo" items="${Nlist }">
    <TR>
      <TD><input type="checkbox" name="check" id="check" value="${vo.nt_no}"></TD>
      <TD><i class="fa fa-flag"></i></TD>
      <TD><a href='./read.do?nt_no=${vo.nt_no}'>${vo.nt_title}</a></TD>
      <TD>
        <A href="./update.do?nt_no=${vo.nt_no}"><i class="fa fa-pencil"></i> 수정 |</A>
        <A href="./delete.do?arr=${vo.nt_no}" onclick="return confirm('삭제하시겠나요?')">삭제</A>
      </TD>
    </TR>
    </c:forEach>
    
    <c:forEach var="vo" items="${list }">
    <TR>
      <TD><input type="checkbox" name="check" id="check" value="${vo.nt_no}"></TD>
      <TD class='td'>${vo.nt_no}</TD>
      <TD class='td'><a href='./read.do?nt_no=${vo.nt_no}'>${vo.nt_title}</a></TD>
      <TD class='td'>
        <A href="./update.do?nt_no=${vo.nt_no}"><i class="fa fa-pencil"></i> 수정 |</A>
        <A href="./delete.do?arr=${vo.nt_no}" onclick="return confirm('삭제하시겠나요?')">삭제</A>
      </TD>
    </TR>
    </c:forEach>
   </tbody> 
  </TABLE>
</form>
<form name="frmSearch" method="get" action="./list.do">  
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
  </div>
</DIV>
</form>

</div>
</div>
</div>
</div>
   

<!-- -------------------------------------------- -->
</body>
<DIV class='bottom'>${paging}</DIV>
<div style= 'margin: 100px 0 0 0;  position: relative;'>   
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html> 