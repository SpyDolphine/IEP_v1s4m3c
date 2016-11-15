<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>Q&A 게시판</title>    
 
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
                                <i class="fa fa-arrow-circle-right">Q&A 게시판</i>
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
    <A href='./list.do?qa_no=${tqnaVO.qa_no}'></A>｜
    <A href='./create.do?qa_no=${tqnaVO.qa_no}'>등록</A>｜
    <A href='./update.do?qa_no=${tqnaVO.qa_no}'>수정</A>｜
    <A href='./delete.do?qa_no=${tqnaVO.qa_no}'>삭제</A> ｜
    <A href="javascript:location.reload();">새로고침</A>｜
  </div>
  <DIV class='content'>
    <FORM name='form_group' method="get" action='./update.do'>
      <input type="hidden" name="qa_no" value="${tqnaVO.qa_no}">
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='qa_title' class="form_group" style="width:150px;">제목 : </label>
            <span>${tqnaVO.qa_title}</span><br>
          </li>
          <li>
            <label for='qa_content' class="form_group" style="width:150px;">내용 : </label>
            <div>${tqnaVO.qa_content}</div>
          </li>
          <li>
            <label for="qa_good" class="form_group" style="width:150px;">추천 수 : </label>
            <span>${tqnaVO.qa_good}</span>
          </li>
          <li>
            <label for="qa_date" class="form_group" style="width:150px;">등록일 : </label>
            <span>${tqnaVO.qa_date.substring(0, 16)}</span>
          </li>

          <li class='right'>
            <button type="button" onclick="location.href='./list.do?qa_no=${tqnaVO.qa_no}">목록보기</button>
            <button type="button" onclick="location.href='./update.do?qa_no=${tqnaVO.qa_no}'">수정</button>
            <button type="button" onclick="location.href='./delete.do?qa_no=${tqnaVO.qa_no}'">삭제</button>
          </li>
        </ul>
      </fieldset>
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