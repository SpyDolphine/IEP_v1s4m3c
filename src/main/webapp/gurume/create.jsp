<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>맛집 </title>    
 
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
        <label class='form_grp' for='gu_stars'>별점</label>
      <select name='gu_stars' id='gu_stars'>
        <option value="별점" selected="selected">별점</option>
        <option value="★">★</option>
        <option value="★★">★★</option>
        <option value="★★★">★★★</option>
        <option value="★★★★">★★★★</option>
        <option value="★★★★★">★★★★★</option>
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
       </li>
       <li>
        <label class='form_grp' for='gu_name'>닉네임</label>
        <input type='text' name='gu_name' id='gu_name' size='15' required="required">
      </li>
      <li>
        <label class='form_grp' for='gu_cont'>내용</label><br>
        <textarea name='gu_cont' id='gu_cont' rows='10' cols='70'></textarea>
      </li>
      <li>
        <label class='form_grp' for='content'>약도: </label>
        <textarea name='gu_map' id='gu_map' rows='10' cols='70' ></textarea>
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