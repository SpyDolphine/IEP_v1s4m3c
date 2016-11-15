<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>★★★ 각 게시판 이름을 적어주세요 ! </title>    
 
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
                                <li class="fa fa-arrow-circle-right"> ex. 커뮤니티 </li>   ★★★ 각 게시판 이름을 적어주세요 ! 
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
  
    <DIV class='content'>
    <FORM name='frm' method="post" action='./update.do' enctype="multipart/form-data">
      <input type="hidden" name="ct_no" id="ct_no" value="${contestVO.ct_no}">
      <input type='hidden' name='me_no' id='me_no' value='${sessionScope.me_no}'>
      <fieldset class="fieldset">
        <ul>
        
           <div class="form-group">   
        <label for="ct_title" class="col-xs-2 col-lg-2 control-label">공모전 명칭</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ct_title' id='ct_title' value='${contestVO.ct_title}' size='60' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_host" class="col-xs-2 col-lg-2 control-label">주최</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ct_host' id='ct_host' value='${contestVO.ct_host}' size='20' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_supervision" class="col-xs-2 col-lg-2 control-label">주관</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ct_supervision' id='ct_supervision' value='${contestVO.ct_supervision}' size='20' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_entry" class="col-xs-2 col-lg-2 control-label">참가자격</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ct_entry' id='ct_entry' value='${contestVO.ct_entry}' size='20' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_enter" class="col-xs-2 col-lg-2 control-label">접수 방법</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ct_enter' id='ct_enter' value='${contestVO.ct_enter}' size='20' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_award" class="col-xs-2 col-lg-2 control-label">시상 자격</label>
        <div class="col-xs-10 col-lg-10">
          <input type='text' class="form-control" name='ct_award' id='ct_award' value='${contestVO.ct_award}' size='20' required="required">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_startdate" class="col-xs-2 col-lg-2 control-label">접수 시작일</label>
        <div class="col-xs-10 col-lg-10">
          <input type='datetime-local' class="form-control" name='ct_startdate' id='ct_startdate' value="${contestVO.ct_startdate}">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_enddate" class="col-xs-2 col-lg-2 control-label">접수 마감일</label>
        <div class="col-xs-10 col-lg-10">
          <input type="datetime-local" class="form-control" name='ct_enddate' id='ct_enddate'  value="${contestVO.ct_enddate}">
        </div>
        </div>
         <div class="form-group">   
        <label for="ct_daydate" class="col-xs-2 col-lg-2 control-label">공모 당일</label>
        <div class="col-xs-10 col-lg-10">
          <input type="datetime-local" class="form-control" name='ct_daydate' id='ct_daydate' value="${contestVO.ct_daydate }">
        </div>
      </div>   
       <div class="form-group">   
        <label for="ct_statedate" class="col-xs-2 col-lg-2 control-label">발표일자</label>
        <div class="col-xs-10 col-lg-10">
          <input type='datetime-local' class="form-control" name='ct_statedate' id='ct_statedate' value="${contestVO.ct_statedate}">
        </div>
        
      </div>
          <div class="form-group">   
        <label for="ct_url" class="col-xs-2 col-lg-2 control-label">관련페이지</label>
        <div class="col-xs-10 col-lg-10">
          <input type="url" class="form-control" name='ct_url' id='ct_url' value='${contestVO.ct_url}' size='60' required="required">
        </div>
      </div>   
      <div class="form-group">   
        <label for="ct_content" class="col-xs-2 col-lg-2 control-label">공모 상세 정보</label>
        <div class="col-xs-10 col-lg-10">
          <textarea class="form-control" name='ct_content' id='ct_content'  rows='10' cols='70'>미시령 단풍</textarea>
        </div>
      </div> 
      <div id='file2Panel' class="form-group">
        <label for="ct_content" class="col-xs-2 col-lg-2 control-label">공모전 포스터</label>
        <div class="col-xs-10 col-lg-10">
          <c:set var='file2' value="${fn:toLowerCase(contestVO.ct_file2)}" />
          <c:choose>
            <c:when test="${fn:endsWith(file2, '.jpg')}">
              <IMG src='./storage/${contestVO.ct_file1}'>
            </c:when>
            <c:when test="${fn:endsWith(file2, '.gif')}">
              <IMG id='ct_file2'  src='./storage/${contestVO.ct_file2}'>
            </c:when>
            <c:when test="${fn:endsWith(file2, '.png')}">
              <IMG id='ct_file2'  src='./storage/${contestVO.ct_file2}'>
            </c:when>
            <c:when test="${contestVO.ct_file2.length() > 0}">
              ${contestVO.ct_file2 } 
            </c:when>
          </c:choose>
        </div>
      </div>
      <div class="form-group">   
        <label for="file2MF" class="col-xs-2 col-lg-2 control-label">공모전 포스터</label>
        <div class="col-xs-10 col-lg-10">
          <input type="file" class="form-control" name='file2MF' id='file2MF' size='40' >
          <br>
          Preview(미리보기) 이미지 자동 생성됩니다.
        </div>
      </div>  
          <li class='right'>
              <button type="submit">수정</button>
               <button type="button" onclick="location.href='./list.do'">목록[취소]</button>
              </li>
            </ul>
            </fieldset>
             
            </FORM>
            </DIV>
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