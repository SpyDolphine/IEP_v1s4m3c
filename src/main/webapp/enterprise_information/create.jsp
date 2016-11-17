<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>  -->
<title>기업정보 등록</title>  

<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>
<!-- ----------------------------------------- -->
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
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
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 ! -->
                                <i class="fa fa-arrow-circle-right"> 기업정보 등록 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! --> 
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<body>
<div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
   

   
<!--    ★★★ 내용입니다. -->

<DIV class='title' style='font-family: 궁서; font-size: 18px;' >기업 정보 등록</DIV>

    <DIV class='content' >
 
      <FORM name='frm' method='POST' class="form-horizontal" action='./create.do' 
            onsubmit="return send();" enctype="multipart/form-data">
        <div class="form-group">   
          <label for='ei_corporationname' class="col-xs-2 col-lg-3 control-label">회사 이름</label>
          <div class="col-xs-2 col-lg-4">
            <input type='text' class="form-control" name='ei_corporationname' id='ei_corporationname' value='' 
                   required="required">
          </div>
        </div> 
        
        <div class="form-group">   
          <label for='ei_slotname' class="col-xs-2 col-lg-3 control-label">대표자 이름</label>
          <div class="col-xs-2 col-lg-4">
            <input type='text' class="form-control" name='ei_slotname' id='ei_slotname' value='' 
                   required="required">
          </div>
        </div>
        
        <div class="form-group">   
          <label for='ei_crn' class="col-xs-2 col-lg-4 control-label">사업자등록 번호</label>
          <div class="col-xs-2 col-lg-4">
            <input type='text' class="form-control" name='ei_crn' id='ei_crn' value='' required='required'>
          </div>
        </div>
   
        <div class="form-group">   
          <label for='ei_employees' class="col-xs-2 col-lg-3 control-label">사원수</label>
          <div class="col-xs-2 col-lg-3">
            <input type='text' class="form-control" name='ei_employees' id='ei_employees' value='' required='required'>
          </div>
        </div>
        
        <div class="form-group">   
         <label for='ei_established' class="col-xs-2 col-lg-3 control-label">설립일</label>
         <div class="col-xs-2 col-lg-4">
          <input type='date' class="form-control" name='ei_established' id='ei_established' value='' 
                 required="required">
         </div>
        </div> 
        
        <div class="form-group">   
          <label for='ei_business' class="col-xs-2 col-lg-3 control-label">업종</label>
          <div class="col-xs-2 col-lg-4">
            
            <select name='ei_business'>
              <option value='선택' selected="selected">선택</option>
              <option value='서비스·교육·금융·유통'>서비스·교육·금융·유통</option>
              <option value='미디어·광고·문화·예술'>미디어·광고·문화·예술</option>
              <option value='IT·정보통신'>IT·정보통신</option>
              <option value='제조·통신·화학·건설'>제조·통신·화학·건설</option>
            </select>
            
          </div>
        </div>
        
        <div class="form-group">   
          <label for='ei_url' class="col-xs-2 col-lg-3 control-label">회사 URL</label>
          <div class="col-xs-2 col-lg-4">
            <input type='url' class="form-control" name='ei_url' id='ei_url' value='' 
                   required="required">
          </div>
        </div>
        
        <div class="form-group">   
          <label for='ei_ci' class="col-xs-2 col-lg-3 control-label">기업 소개</label>
          <div class="col-xs-2 col-lg-10">
            <textarea class="form-control" name='ei_ci' id='ei_ci'  rows='10' cols='70'>
            </textarea>
          </div>
        </div>
        
        <div class="form-group">   
          <label for='ei_ci' class="col-xs-2 col-lg-3 control-label">기업 위치</label>
          <div class="col-xs-2 col-lg-10">
            <textarea class="form-control" name='ei_map' id='ei_map'  rows='10' cols='70'>
            </textarea>
          </div>
        </div>        
        
        <div class="form-group">   
          <label for='ei_majorbusiness' class="col-xs-2 col-lg-3 control-label">주요 업무</label>
          <div class="col-xs-2 col-lg-10">
            <textarea class="form-control" name='ei_majorbusiness' id='ei_majorbusiness'  rows='10' cols='70'>
            </textarea>
          </div>
        </div>
        
       <div class="form-group">   
        <label for="ei_logofile2MF" class="col-xs-2 col-lg-3 control-label">업로드 파일</label>
        <div class="col-xs-4 col-lg-4">
          <input type="file" class="form-control" name='ei_logofile2MF' id='ei_logofile2MF' size='40' >
          <br>
<!--           Preview(미리보기) 이미지 자동 생성됩니다. -->
        </div>
       </div> 
        
        <div class="form-group">   
          <label for='ei_tpic' class="col-xs-2 col-lg-3 control-label">채용 담당자</label>
          <div class="col-xs-2 col-lg-4">
            <input type='text' class="form-control" name='ei_tpic' id='ei_tpic' value='' 
                   required="required">
          </div>
        </div>
       
       <DIV class="" style='text-align: right;'>
         <button type="submit" class="btn btn-default">등록</button>
         <button type='button' class="btn btn-default" onclick="location.reload();">새로 고침</button>
         <button type="button" class="btn btn-default" onclick="location.href='./list.do'">취소(목록)</button>
       </DIV>
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