<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/javascript">
window.onload=function(){
  CKEDITOR.replace('ct_content');
 };
 
$(function(){
 
});
</script>
 
</head> 
 
<body>
   <div class="container">
    <DIV class='content'>
    <FORM name='frm' method="post" action='./update.do' enctype="multipart/form-data">
      <input type="hidden" name="ct_no" id="ct_no" value="${contestVO.ct_no}">
      <input type='hidden' name='me_no' id='me_no' value='${sessionScope.me_no}'>
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='ct_title' style="width:150px;">공모전 명칭 : </label>
            <input type="text" id="ct_title" name="ct_title" value="${contestVO.ct_title}">
            <br>
          </li>
          <li>
            <label for='ct_host' style="width:150px;">주최 : </label>
            <input type="text" id="ct_host" name="ct_host" value="${contestVO.ct_host}">
        <br>
          </li>
           <li>
            <label for='ct_supervision' style="width:150px;">주관 : </label>
            <input type="text" id="ct_supervision" name="ct_supervision" value="${contestVO.ct_supervision}">
            <br>
          </li>
                    <li>
            <label for='ct_entry' style="width:150px;">참가 자격 : </label>
            <input type="text" id="ct_entry" name="ct_entry" value="${contestVO.ct_entry}">
           <br>
          </li>
                    <li>
            <label for='ct_enter' style="width:150px;">접수 방법: </label>
            <input type="text" id="ct_enter" name="ct_enter" value="${contestVO.ct_enter}">
            <br>
          </li>
                    <li>
            <label for='ct_award' style="width:150px;">시상 자격 : </label>
            <input type="text" id="ct_award" name="ct_award" value="${contestVO.ct_award}">
            <br>
          </li>
             <li>
            <label for='ct_startdate' style="width:150px;">접수 시작일 : </label>
            <input type="date" id="ct_startdate" name="ct_startdate" value="${contestVO.ct_startdate}">
        <br>
          </li>
          <li>
            <label for='ct_enddate' style="width:150px;">접수 마감일 : </label>
            <input type="date" id="ct_enddate" name="ct_enddate" value="${contestVO.ct_enddate}">
          <br>
          </li>
           <li>
            <label for='ct_statedate' style="width:150px;">발표 일자 : </label>
            <input type="date" id="ct_statedate" name="ct_statedate" value="${contestVO.ct_statedate}">
          <br>
          </li>
          <li>
            <label for='ct_url' style="width:150px;">관련 홈페이지 : </label>
            <input type="text" id="ct_url" name="ct_url" value="${contestVO.ct_url}">
           <br>
          </li>
           
          <li>
            <label for='ct_content' style="width:150px;">내용 : </label>
            <textarea id="ct_content" name="ct_content" >${contestVO.ct_content}</textarea>
            
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
        <label for="file2MF" class="col-xs-2 col-lg-2 control-label">업로드 파일</label>
        <div class="col-xs-10 col-lg-10">
          <input type="file" class="form-control" name='file2MF' id='file2MF' size='40' >
          <br>
          Preview(미리보기) 이미지 자동 생성됩니다.
        </div>
      </div>  
          </li>
          <li class='right'>
              <button type="submit">수정</button>
               <button type="button" onclick="location.href='./list.do'">목록[취소]</button>
              </li>
            </ul>
            </fieldset>
             
            </FORM>
            </DIV>
            </div>
           
</body>
 
</html> 