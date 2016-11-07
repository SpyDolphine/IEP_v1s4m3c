<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>중고 장터</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
   // content: textarea name
   if (CKEDITOR.instances['io_content'].getData() == '') {
     window.alert('내용을 입력해 주세요.');
     CKEDITOR.instances['io_content'].focus();
     return false;
   }
  };
  

</script>

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
                                <i class="fa fa-arrow-circle-right">중고 장터</i>
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
    <A href='../itos/list.do'>게시판 목록</A> > 
    <A href='./list.do?io_no=${itosVO.io_no }'>${itosVO.io_title }</A>｜
    <A href="javascript:history.back();">취소</A>
  </div>
  

  
  <DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
      <input type='hidden' name='io_no' id='io_no' value='${itosVO.io_no}'>
      <ul>
      <li>
      <li>
        <label class='form_grp' for='io_title'>제목</label>
        <input type='text' name='io_title' id='io_title' value='${itosVO.io_title}' size='60' required="required">
      </li>
      <li>
        <label class='form_grp' for='io_content'>내용</label><br>
        <TEXTAREA name='io_content' id='io_content' rows='10' cols='70'>${itosVO.io_content}</TEXTAREA>
      </li>
      <li>
        <label for='io_cost' class="form_group" style="width:150px;">금액 : </label>
        <input type='text' name='io_cost' id='io_cost' value='${itosVO.io_cost}' size='60' required="required">
        <div>${itosVO.io_cost}</div>
      </li>
      <li>
        <label class='form_grp' for='io_file2'>등록된 파일</label>
          <c:set var='io_file2' value="${fn:toLowerCase(itosVO.io_file2)}" />
          <c:choose>
            <c:when test="${fn:endsWith(io_file2, '.jpg')}">
              <IMG src='./storage/${itosVO.io_file1}'>
            </c:when>
            <c:when test="${fn:endsWith(io_file2, '.gif')}">
              <IMG id='io_file2'  src='./storage/${itosVO.io_file1}'>
            </c:when>
            <c:when test="${fn:endsWith(io_file2, '.png')}">
              <IMG id='io_file2'  src='./storage/${itosVO.io_file1}'>
            </c:when>
            <c:when test="${itosVO.io_file2.length() > 0}">
              ${itosVO.io_file1 } 
            </c:when>
          </c:choose>
      </li>
      <li>
        <label class='label' for='io_file2'>업로드 파일</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
      <li class='right'>
         <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do?io_no=${itosVO.io_no}'">목록[취소]</button>
      </li>         
    </ul>
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