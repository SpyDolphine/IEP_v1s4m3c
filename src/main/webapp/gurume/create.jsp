<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>맛집 </title> 


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>   


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
                                <i class="fa fa-arrow-circle-right"> 맛집 </i>  
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
  
<DIV class='content' style='width: 100%;'>
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
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
  
  for(i=i; i<=gu_stars; i++){
    images = 'images'+i;
    el= document.getElementById(images);
    el.src="../gurume/images/grape1.png";
  }
  
  switch(gu_stars){
  case 1:
    stateMsg ="1";
    break;
  case 2:
    stateMsg ="2";
    break;
  case 3:
    stateMsg ="3";
    break;
  case 4:
    stateMsg ="4";
    break;
  case 5:
    stateMsg ="5";
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
    el.src = "../gurume/images/red1.png";
    
  }
}
function lock(gu_stars){
  show(gu_stars);
  locked=1;
}
function mark(gu_stars){
  lock(gu_stars);
  alert("선택"+gu_stars);
  document.frm.gu_stars.value=gu_stars;
  
}
</script>
    <ul>
      <li>
        <label class='form_grp' for='gu_title'>제목</label>
        <input type='text' name='gu_title' id='gu_title' size='60' required="required">
      </li>
      <li>
      <label class='form_grp' for='gu_area'>지역</label>
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
      
         <label class='form_grp' for='gu_menu'>분류</label>
      <select name='gu_menu' id='gu_menu'>
        <option value="서울" selected="selected">분류 선택</option>
        <option value="한식">한식</option>
        <option value="양식">양식</option>
        <option value="일식">일식</option>
        <option value="중식">중식</option>
        <option value="기타">기타</option>
      </select>
      
       <label class='form_grp' for='gu_price'>가격</label>
      <select name='gu_price' id='gu_price'>
        <option value="가격" selected="selected">가격</option>
        <option value="~5000원">~5000원</option>
        <option value="5000~10000원">5000~10000원</option>
        <option value="10000~20000원">10000~20000원</option>
        <option value="20000~30000원">20000~30000원</option>
        <option value="30000~50000원">30000~50000원</option>
        <option value="50000원 이상">50000원 이상</option>
      </select>
        <li>
        <label class='form_grp' for='gu_name'>닉네임</label>
        <input type='text' name='gu_name' id='gu_name' size='15' required="required">
      </li>

       <li>
        <label class='form_grp' id=gu_stars align=center>별점</label><br>
         <span>
         <img id=images1 onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="../gurume/images/grape1.png" width=30px>
         <img id=images2 onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="../gurume/images/grape1.png" width=30px>
         <img id=images3 onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="../gurume/images/grape1.png" width=30px>
         <img id=images4 onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="../gurume/images/grape1.png" width=30px>
         <img id=images5 onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="../gurume/images/grape1.png" width=30px>
         </span><span id=startext></span>
        <input type="hidden" name="gu_stars" />
      </li>
      <li>
        <label class='form_grp' for='gu_cont'>내용</label><br>
        <textarea name='gu_cont' id='gu_cont' rows='10' cols='70'></textarea>
      </li>
      <li>
        <label class='form_grp' for='content'>약도: </label><br>
        <textarea name='gu_map' id='gu_map' rows='5' cols='70' ></textarea>
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