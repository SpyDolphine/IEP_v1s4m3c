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
                                <i class="fa fa-arrow-circle-right">설문조사</i> 
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
   
<DIV id='panel_frm_delete' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='sb_no' id='sb_no'> 
  
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="delete_cancel()">취소</button>
</FORM>
</DIV>
<TABLE class='table'>

  <TR>
    <TH>번호</TH>
    <TH>제목</TH>
    <TH>기타</TH>
  </TR>
 
  <c:forEach var="vo" items="${list }">
  <TR>
    <TD>${vo.sb_no}</TD>
    <TD><a href="./read.do?sb_no=${vo.sb_no}">${vo.title}</a></TD>
    <TD>
      <A href="./update.do?sb_no=${vo.sb_no}"><IMG src='../menu/images/update.png' title='수정'></A>
      <A href="javascript:deleteOne(${vo.sb_no})"><IMG src='../menu/images/delete.png' title='삭제'></A>
    </TD>
  </TR>
  </c:forEach>
 
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
   </div>
 </div>
</div>
</body>
<DIV class='bottom'>${paging}</DIV>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 