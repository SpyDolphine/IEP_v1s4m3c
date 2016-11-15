<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title>기업정보 내용 </title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  

<script type="text/javascript">
  $(function(){
    $('#file2').load(function(){ // 태그 메모리 상주후 작동
      // var width = $('#file2').width();
      //alert('file2: ' + width); 
      if ($('#file2').width() > screen.width * 0.7){
        $('#file2').width('70%');      
      }
    });
  });
  
</script> 
 
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
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 !  -->
                                <i class="fa fa-arrow-circle-right"> 기업정보 내용 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! -->
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
   

   
<!--    ★★★ 내용입니다. -->
   
   <input type='hidden' name='col' id='col' value='${searchDTO.col }'> 
   <input type='hidden' name='word' id='word' value='${searchDTO.word }'>
   <input type='hidden' name='nowPage' id='nowPage' value='${searchDTO.nowPage }'>
     
  <div class='content_menu' style='width: 100%;'>
    
    <A href='./list.do'>게시판 목록</A> >｜
    <A href='./list.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }'>회사이름</A>｜
    <A href='./update.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }'>수정</A>｜
    <A href='./create.do?ei_no=${vo.ei_no }'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>

<DIV class='title'>기업정보 내용</DIV>

<DIV class='content'>

<!--  <FORM name='frm' method='POST' class="form-horizontal" action='./update.do' 
       onsubmit="return send();"> -->
 <FORM name='frm' method='POST' class="form-horizontal" action='' 
       onsubmit="return send();">
       
       <input type='hidden' name='ei_no' value='${vo.ei_no }'>
  <div>    
    <table class="tbl_ty3 tbl_companies_info" style='width: 100%;'>
          
      <%-- table 컬럼 --%>
      <tbody>
        <tr>
         <th rowspan="2">
          <c:choose>
              <c:when test="${vo.ei_logofile1 == null}"></c:when>
              <c:when test="${vo.ei_logofile1 != null}">
                <c:set var='ei_logofile2' value="${fn:toLowerCase(vo.ei_logofile2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(ei_logofile2, '.jpg')}">
                    <IMG id='file2' src='./storage/${vo.ei_logofile2}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ei_logofile2, '.gif')}">
                    <IMG id='file2'  src='./storage/${vo.ei_logofile2}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ei_logofile2, '.png')}">
                    <IMG id='file2'  src='./storage/${vo.ei_logofile2}' >
                  </c:when>
                  <c:when test="${vo.ei_logofile2.length() > 0}">
                   ${vo.ei_logofile2 }
                  </c:when>
                </c:choose>
                </c:when>
            </c:choose>
                   <!--           <br> -->
<!--           Preview(미리보기) 이미지 자동 생성됩니다. -->
         </th>
         <th>${vo.ei_corporationname }</th>
        </tr>     
        <tr>
         <th>${vo.ei_url }</th>
        </tr>
        <tr>
         <th colspan="2" style="font-family: 'Apple SD Gothic Neo', Tahoma, Verdana, '맑은 고딕','Malgun Gothic', 
             '나눔고딕', NanumGothic, '돋움', dotum, Arial, sans-serif;">${vo.ei_ci }</th>
        </tr>
      </tbody>
    </table>   
  </div>  
         <BR>
         <label for="ei_slotname" class="col-xs-2 col-lg-3 control-label">기본정보</label>
         <BR>
         <BR>
  <div>
    <table class="tbl_ty3 tbl_companies_info" style='width: 100%; padding: 16px 19px 0;'>
          
      <%-- table 컬럼 --%>
      <tbody>
        <tr>
         <th>웹사이트</th><th>${vo.ei_url }</th>
         <th>본사</th><th></th>
        </tr>
        <tr>
         <th>사원수</th><th>${vo.ei_employees}명</th>
         <th>설립일</th><th>${vo.ei_established }</th>
        </tr>
        <tr>
         <th>기업형태</th><th></th>
         <th>매출액</th><th>원</th>
        </tr>
        <tr>
         <th>산업군 (업종)</th><th>${vo.ei_business }</th>
         <th>대표</th><th>${vo.ei_slotname }</th>
        </tr>
      </tbody>
    </table> 
  </div>
    <BR>
    <BR>
        <div class="form-group">   
         <label for='ei_majorbusiness' class="col-xs-2 col-lg-3 control-label">주요 업무</label>
        </div>
        <div style="font-family: 'Apple SD Gothic Neo', Tahoma, Verdana, '맑은 고딕','Malgun Gothic', 
             '나눔고딕', NanumGothic, '돋움', dotum, Arial, sans-serif;">
            ${vo.ei_majorbusiness }
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