<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/javascript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
  
  $(function (){
    // content: textarea name
    if (CKEDITOR.instances['content'].getData() == '') {
      window.alert('내용을 입력해 주세요.');
      CKEDITOR.instances['content'].focus();
      return false;
    }
  });
</script>

</head> 
<!-- ----------------------------------------- -->
<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
  <div class='content_menu' style='width: 100%;'>
    <A href='../seico/list.do'>게시판 목록</A> > 
   <%--  <A href='./list.do?divisionno=${divisionVO.divisionno }'>${divisionVO.title }</A>｜
    <A href='./create.do?divisionno=${divisionVO.divisionno }'>등록</A>｜ --%>
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  
<DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./create.do'
              enctype="multipart/form-data">
   <%--  <input type='hidden' name='divisionno' id='divisionno' value='${divisionVO.divisionno }'>
    <input type='hidden' name='me_no' id='me_no' value='1'> --%>
      <ul>
      
      <li>
        <label class='form_grp' for='sc_title'>제목</label>
        <input type='text' name='sc_title' id='sc_title' size='60' required="required">
      </li>
      <li>
      <label class='form_grp' for='sc_area'>지역</label>
      <select name='sc_area' id='sc_area'>
        <option value="지역" selected="selected">지역 선택</option>
        <option value="서울">서울</option>
        <option value="대구">대구</option>
        <option value="인천">인천</option>
        <option value="대전">대전</option>
        <option value="광주">광주</option>
        <option value="울산">울산</option>
        <option value="부산">부산</option>
      </select>
      
         <label class='form_grp' for='sc_jobs'>직종</label>
      <select name='sc_jobs' id='sc_jobs'>
        <option value="직종선택" selected="selected">직종 선택</option>
        <option value="SE">SE</option>
        <option value="SI">SI</option>
        <option value="테스터">테스터</option>
        <option value="기타">기타</option>
      </select>
   <!--     <li>
        <label class='form_grp' for='sc_like'>좋아요</label>
        <input type='text' name='sc_like' id='sc_like' size='15' required="required">
      </li> -->
       <li>
        <label class='form_grp' for='sc_name'>닉네임</label>
        <input type='text' name='sc_name' id='sc_name' size='15' required="required">
      </li>
      <li>
        <label class='form_grp' for='sc_cont'>내용</label><br>
        <TEXTAREA name='sc_cont' id='sc_cont' rows='10' cols='70'></TEXTAREA>
      </li>
      <li>
        <label class='form_grp' for='file1'>Thumb 파일</label>
        Preview(미리보기) 이미지 자동 생성됩니다.
      </li>
      <li>
        <label class='label' for='file2'>업로드 파일</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
      
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">취소</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 