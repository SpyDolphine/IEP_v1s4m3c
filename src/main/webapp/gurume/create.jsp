<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>회사 근처 맛집소개</title> 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>   
<script type="text/javascript">
var locked = 0;

function show(gu_stars){
  if(locked)
    return;
  var i;
  var images;
  var el;
  var e = document.getElementById('startext');
  var stateMsg;
  
  for(i=1; i<=gu_stars; i++){
    images = 'images'+i;
    el= document.getElementById(images);
    el.src="../gurume/images/yellow.png";
  }
  
  switch(gu_stars){
  case 1:
    stateMsg ="";
    break;
  case 2:
    stateMsg ="";
    break;
  case 3:
    stateMsg ="";
    break;
  case 4:
    stateMsg ="";
    break;
  case 5:
    stateMsg ="";
    break;
    default:
      stateMsg="";
  }
  e.innerHTML = stateMsg;
}
function noshow(gu_stars){
  if(locked)
    return;
  var i;
  var images;
  var el;
  
  for(i=1; i<=gu_stars; i++){
    images= 'images'+i;
    el= document.getElementById(images);
    el.src = "../gurume/images/grape1.png";
    
  }
}
function lock(gu_stars){
  show(gu_stars);
  locked=1;
}
function mark(gu_stars){
  lock(gu_stars);
  alert("선택:"+gu_stars);
  document.frm.gu_stars.value=gu_stars;
  for(i=1; i<=gu_stars; i++){
    images = 'images'+i;
    el= document.getElementById(images);
    el.src="../gurume/images/yellow.png";
  }
  for(i=gu_stars+1; i<=5; i++){
    images= 'images'+i;
    el= document.getElementById(images);
    el.src = "../gurume/images/grape1.png";
  }
}
</script>
<style>
  strong {
    color : red;
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
                                <i class="fa fa-arrow-circle-right"> 맛집</i>  
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
  
 <div id="formcon">
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
  <h4><span>맛집 등록</span></h4>  
   <fieldset>
    <table>
     <tbody>
      <tr>
        <th scope="row">
         <label class='form_grp' for='gu_title'>제목</label></th>
         <td><input type='text' name='gu_title' id='gu_title' size='60' required="required"></td>
      </tr>   
      <tr>
        <th scope="row">
         <label class='form_grp' for='gu_area'>지역</label></th>
          <td>
            <select name='gu_area' id='gu_area'>
              <option value="지역" selected="selected">지역 선택</option>
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
           </td>
      </tr>
      <tr>
        <th scope="row">          
          <label class='form_grp' for='gu_menu'>분류</label></th>
          <td>
            <select name='gu_menu' id='gu_menu'>
              <option value="서울" selected="selected">분류 선택</option>
              <option value="한식">한식</option>
              <option value="양식">양식</option>
              <option value="일식">일식</option>
              <option value="중식">중식</option>
              <option value="기타">기타</option>
            </select>
          </td>
      </tr>
      <tr>
        <th scope="row">            
         <label class='form_grp' for='gu_price'>가격</label></th>
        <td> 
          <select name='gu_price' id='gu_price'>
            <option value="가격" selected="selected">가격</option>
            <option value="~5000원">~5000원</option>
            <option value="5000~10000원">5000~10000원</option>
            <option value="10000~20000원">10000~20000원</option>
            <option value="20000~30000원">20000~30000원</option>
            <option value="30000~50000원">30000~50000원</option>
            <option value="50000원 이상">50000원 이상</option>
          </select>
         </td>
       </tr>
      <tr>
        <th scope="row">
          <label class='form_grp' for='gu_name'>닉네임</label></th>
        <td>  
          <input type='text' name='gu_name' id='gu_name' size='15' required="required">
        </td>
      </tr>
      <tr>
        <th scope="row">        
          <label class='form_grp' id=gu_stars align=center>별점</label></th>
         <td> 
         <span>
           <img id=images1 onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="../gurume/images/grape1.png" width=30px>
           <img id=images2 onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="../gurume/images/grape1.png" width=30px>
           <img id=images3 onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="../gurume/images/grape1.png" width=30px>
           <img id=images4 onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="../gurume/images/grape1.png" width=30px>
           <img id=images5 onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="../gurume/images/grape1.png" width=30px>
           </span><span id=startext></span>
          <input type="hidden" name="gu_stars" />
         </td>
      </tr> 
      <tr>
        <th scope="row">
         <label class='form_grp' for='gu_cont'>내용</label></th>
         <td> 
          <textarea name='gu_cont' id='gu_cont' rows='10' cols='70'></textarea>
         </td>
      </tr>
      <tr>
        <th scope="row">          
          <label class='form_grp' for='content'>약도: </label></th>
          <td>
           <textarea name='gu_map' id='gu_map' rows='5' cols='70' 
               placeholder="다음 지도에서 위치 검색 후, 약도 만들기로 소스를 생성하여 붙여넣어 주세요." ></textarea>
          </td>
      </tr>     
      <tr>
        <th scope="row">
         <label class='form_grp' for='file1'>Thumb 파일</label></th>
          <td> Preview(미리보기) 이미지 자동 생성됩니다.</td>
      </tr>
      <tr>
        <th scope="row">          
          <label class='label' for='file2'>업로드 파일</label></th>
          <td>
            <input type="file" name='file2MF' id='file2MF' size='40' >
          </td>
      </tr>
     </tbody>
    </table>
   </fieldset>
               
    <div class='right'>
      <button type="submit" class="btn btn-default btn-xs">등록</button>
      <button type="button" class="btn btn-default btn-xs" onclick = "history.back()">취소</button>
    </div>         
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