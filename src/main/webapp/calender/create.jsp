<%@page import="dev.mvc.scrap.ScrapVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>일정</title>    

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
                                <li><A href='./list.do'>일정</A></li>   
                                <i class="fa fa-arrow-circle-right"> 일정 등록 </i>
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
   <div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
  <DIV class='content' style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do'  enctype="multipart/form-data">
      <input type='hidden' name='me_no' id='me_no' value='${sessionScope.me_no}'>
      <input type='hidden' name='me_id' id='me_id' value='${sessionScope.me_id}'>
      <input type='hidden' name='sp_no'  id="sp_no" value='2'>
      <div class="form-group">   
        <label for="title" class="col-xs-2 col-lg-2 control-label">일정 제목</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='title' id='title' value='권재현 생일' size='60' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="startdate" class="col-xs-2 col-lg-2 control-label">시작일</label>
        <div class="col-xs-10 col-lg-10">
          <input type='datetime-local' class="form-control" name='startdate' id='startdate' >
        </div>
      </div>   
       <div class="form-group">   
        <label for="enddate" class="col-xs-2 col-lg-2 control-label">마감일</label>
        <div class="col-xs-10 col-lg-10">
          <input type="datetime-local" class="form-control" name='enddate' id='enddate' >
        </div>
        </div>
         <div class="form-group">   
        <label for="daydate" class="col-xs-2 col-lg-2 control-label">당일</label>
        <div class="col-xs-10 col-lg-10">
          <input type="datetime-local" class="form-control" name='daydate' id='daydate' >
        </div>
      </div>   
       <div class="form-group">   
        <label for="statedate" class="col-xs-2 col-lg-2 control-label">발표일자</label>
        <div class="col-xs-10 col-lg-10">
          <input type='datetime-local' class="form-control" name='statedate' id='statedate' >
        </div>
        
      </div>
          <div class="form-group">   
        <label for="sp_content" class="col-xs-2 col-lg-2 control-label">스크랩 페이지</label>
        <div class="col-xs-10 col-lg-10">
          <input type="text" class="form-control" name='sp_content' id='sp_content'  size='60'  placeholder="스크랩시 자동 입력 됩니다.">
        </div>
      </div>   
      <div class="form-group">   
        <label for="content" class="col-xs-2 col-lg-2 control-label">일정 상세 내용</label>
        <div class="col-xs-10 col-lg-10">
          <textarea class="form-control" name='content' id='content'  rows='10' cols='70'>우리 재현이 생일 입니다.</textarea>
        </div>
      </div>   
       <DIV style='text-align: right;'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">취소[목록]</button>
      </DIV>
    </FORM>
  </DIV>
    </div>
 </div>
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