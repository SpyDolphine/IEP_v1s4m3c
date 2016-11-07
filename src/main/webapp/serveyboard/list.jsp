<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>설문조사</title>    
</head>

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<script type="text/javascript">

  $(function(){
    $('#panel_frm_delete').hide();
  });
   
  function deleteOne(sb_no){
    $('#panel_frm_delete').show();
    $('#sb_no', frm_remove).attr('value', sb_no);
  }
   
  function delete_cancel(){
    $('#panel_frm_delete').hide();
  }
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
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 설문조사</i> 
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<body>
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">

<div class="list_content" style='width: 70%;'>
<table class="table table-striped">
 <div class='left'>
   &nbsp;<input type="checkbox" id="allCheck"/> 전체선택 
   <A onclick="checkDel();" class="btn btn-default btn-xs"><i class="fa fa-trash-o"></i> 삭제</A>
 </div>
<p style='text-align: right;'>
  <A href='./create.do' class="btn btn-default btn-xs"><i class="fa fa-pencil"> 설문 등록하기</i></A>
</p>

 <thead> 
  <TR>
    <TH style="width: 5%;">체크</TH>
    <TH style="width: 5%;">번호</TH>
    <TH style="width: 75%;">제목</TH>
    <TH style="width: 15%;">기타</TH>
  </TR>
 </thead> 
 
 <tbody>
  <c:forEach var="vo" items="${list }">
  <TR>
    <TD><input type="checkbox" name="check" id="check" value="${vo.sb_no}"></TD>
    <TD style='vertical-align: middle;'>${vo.sb_no}</TD>
    <TD style='vertical-align: middle;' id='boardtitle'><a href="./read.do?sb_no=${vo.sb_no}">${vo.title}</a></TD>
    <TD>
      <A href="./update.do?sb_no=${vo.sb_no}"><i class="fa fa-pencil"></i>수정</A>&nbsp;
      <A href="./delete.do?arr=${vo.sb_no}" onclick="return confirm('삭제하시겠나요?')">삭제</A>
    </TD>
  </TR>
  </c:forEach>
</tbody>
</TABLE>
 
   </div>
 </div>
</div>
<DIV class='bottom'>${paging}</DIV>
 
</body>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 