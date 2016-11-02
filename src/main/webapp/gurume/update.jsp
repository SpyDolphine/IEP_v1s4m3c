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
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
   // content: textarea name
   if (CKEDITOR.instances['content'].getData() == '') {
     window.alert('내용을 입력해 주세요.');
     CKEDITOR.instances['content'].focus();
     return false;
   }
  };
  

</script>
 
</head> 
 
<body>
  <div class="container">
    <jsp:include page="/menu/top.jsp" flush='false' />
     
     
 <div class='content_menu' style='width: 100%;'>
    <A href='../gurume/list.do'>게시판 목록</A> > 
   <%--  <A href='./list.do?divisionno=${divisionVO.divisionno }'>${divisionVO.title }</A>｜
    <A href='./create.do?divisionno=${divisionVO.divisionno }'>등록</A>｜ --%>
    <A href="javascript:location.reload();">새로고침</A>
  </div>
 
  
  <DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
    <input type='hidden' name='gu_no' id='gu_no' value='${gurumeVO.gu_no}'>
 <%--      
  <input type='hidden' name='divisionno' id='divisionno' value='${boardVO.divisionno }'>
    <input type='hidden' name='me_no' id='me_no' value='1'> --%> 
      <ul>
      <li>
        <label class='form_grp' for='gu_title'>제목</label>
        <input type='text' name='gu_title' id='gu_title' value='${gurumeVO.gu_title}' size='60' required="required">
      </li>
      <li>
      <label class='form_grp' for='gu_area'>지역</label>
      <select name='gu_area' id='gu_area'>
           <option value="${gurumeVO.gu_area}" selected="selected">${gurumeVO.gu_area}</option>
           <option value="서울">서울</option>
           <option value="인천">인천</option>
           <option value="대구">대구</option>
           <option value="대전">대전</option>
           <option value="광주">광주</option>
           <option value="울산">울산</option>
           <option value="부산">부산</option>
           <option value="경기">경기</option>
           <option value="강원">강원</option>
           <option value="경북">경북</option>
           <option value="경남">경남</option>
           <option value="전북">전북</option>
           <option value="전남">전남</option>
           <option value="충남">충남</option>
           <option value="충북">충북</option>
           <option value="제주">제주</option>
           <option value="해외">해외</option>
      </select>
      
         <label class='form_grp' for='gu_menu'>분류</label>
      <select name='gu_menu' id='gu_menu'>
        <option value="${gurumeVO.gu_menu}" selected="selected">${gurumeVO.gu_menu}</option>
        <option value="한식">한식</option>
        <option value="양식">양식</option>
        <option value="일식">일식</option>
        <option value="중식">중식</option>
        <option value="기타">기타</option>
      </select>
          <label class='form_grp' for='gu_price'>가격</label>
      <select name='gu_price' id='gu_price'>
        <option value="${gurumeVO.gu_price}" selected="selected">${gurumeVO.gu_price}</option>
        <option value="~5000원">~5000원</option>
        <option value="5000~10000원">5000~10000원</option>
        <option value="10000~20000원">10000~20000원</option>
        <option value="20000~30000원">20000~30000원</option>
        <option value="30000~50000원">30000~50000원</option>
        <option value="50000원 이상">50000원 이상</option>
      </select>
        <label class='form_grp' for='gu_stars'>별점</label>
      <select name='gu_stars' id='gu_stars'>
        <option value="${gurumeVO.gu_stars}" selected="selected">${gurumeVO.gu_stars}</option>
        <option value="★">★</option>
        <option value="★★">★★</option>
        <option value="★★★">★★★</option>
        <option value="★★★★">★★★★</option>
        <option value="★★★★★">★★★★★</option>
      </select>
       </li>
       <li>
        <label class='form_grp' for='gu_name'>닉네임</label>
        <input type='text' name='gu_name' id='gu_name'value="${gurumeVO.gu_name}"size='15' required="required">
      </li>
      <li>
        <label class='form_grp' for='gu_cont'>내용</label><br>
        <TEXTAREA name='gu_cont' id='gu_cont' rows='10' cols='70'>${gurumeVO.gu_cont}</TEXTAREA>
      </li>
       <li>
        <label class='form_grp' for='file1'>등록된 파일</label>
          <c:set var='file2' value="${fn:toLowerCase(gurumeVO.file2)}" />
          <c:choose>
            <c:when test="${fn:endsWith(file2, '.jpg')}">
              <IMG src='./storage/${gurumeVO.file1}'>
            </c:when>
            <c:when test="${fn:endsWith(file2, '.gif')}">
              <IMG id='file2'  src='./storage/${gurumeVO.file1}'>
            </c:when>
            <c:when test="${fn:endsWith(file2, '.png')}">
              <IMG id='file2'  src='./storage/${gurumeVO.file1}'>
            </c:when>
            <c:when test="${gurumeVO.file2.length() > 0}">
              ${gurumeVO.file2 } 
            </c:when>
          </c:choose>
      </li> 
      <li>
        <label class='label' for='file2'>업로드 파일</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </li> 
      <li>
        <label for='content'>약도: </label>
        <textarea name='gu_map' id='gu_map' rows='5' style='width:100%;'>
        ${gurumeVO.gu_map}
        </textarea>
      </li>        
      <li class='right'>
         <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do<%-- ?divisionno=${boardVO.divisionno} --%>'">목록[취소]</button>
      </li>         
    </ul>
  </FORM>
</DIV>


    <div style= 'margin: 100px 0 0 0;  position: relative;'>      
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
  </div>
</body>
 
</html> 