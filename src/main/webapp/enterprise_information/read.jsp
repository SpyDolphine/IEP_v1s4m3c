<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>기업정보</title>

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
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

<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 기업 상세정보</i>
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<body>

 <A href='./create.do?ei_no=${vo.ei_no }'>등록</A>
 <A href='./update.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }'>수정</A>
<section class="content blog">
   <input type='hidden' name='ei_no' value='${vo.ei_no }'>
   <input type='hidden' name='col' id='col' value='${searchDTO.col }'> 
   <input type='hidden' name='word' id='word' value='${searchDTO.word }'>
   <input type='hidden' name='nowPage' id='nowPage' value='${searchDTO.nowPage }'>
     
    <div class="container">
      <div class="row" style="max-width:780px;float:left; ">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="float:left;">
          <div class="blog_single">
            <article class="post">
              <div class="post_date">
                <span class="day">${fn:substring(vo.ei_date, 8, 10)}</span> 
                <span class="month">${fn:substring(vo.ei_date, 5, 7)}월</span>
              </div>
              <div class="post_content">    
                <div class="post_meta">
                  <h2><a>${vo.ei_corporationname }</a></h2>
                  <div class="metaInfo">
                    <span>설립일 <a>${fn:substring(vo.ei_established, 0, 10)}</a></span><br> 
                    <span>대표명 <a>${vo.ei_slotname}</a></span><br>
                    <span>사업자등록번호 <a>${vo.ei_crn}</a></span>
                    <span><i class='fa fa-group'></i>사원수 <a> ${vo.ei_employees}명</a></span>
                    <span>산업군(업종) <a> ${vo.ei_business}</a></span>
                    <span>회사 홈페이지 <a href='${vo.ei_url}'> ${vo.ei_url}</a></span><br>
                    <span>채용 담당자 <a><i class='fa fa-phone'></i> ${vo.ei_tpic}</a></span>
                  </div>
                </div>
                <p><strong>기업 소개 (Company Introduction)</strong><p><blockquote class="default"> ${vo.ei_ci}</blockquote>
                <p><strong>주요 업무</strong> <br><br> ${vo.ei_majorbusiness }</p>
              </div>
             </article> 
          </div>
      </div>
   </div>
   
   
  <!--Sidebar Widget-->
  <div class="col-xs-12 col-md-3 col-lg-3 col-sm-3" style="float:left; ">
    <div class="sidebar">
      <div class="widget widget_categories">
        <div class="metaInfo" style='border: 3px solid #f2f2f2; padding: 20px;'>
        <c:choose>
            <c:when test="${vo.ei_logofile1 == null}"></c:when>
            <c:when test="${vo.ei_logofile1 != null}">
              <c:set var='ei_logofile2' value="${fn:toLowerCase(vo.ei_logofile2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(ei_logofile2, '.jpg')}">
                  <IMG id='file2' src='./storage/${vo.ei_logofile2}' style='width:200px;'>
                </c:when>
                <c:when test="${fn:endsWith(ei_logofile2, '.gif')}">
                  <IMG id='file2' src='./storage/${vo.ei_logofile2}' style='width:200px;'>
                </c:when>
                <c:when test="${fn:endsWith(ei_logofile2, '.png')}">
                  <IMG id='file2' src='./storage/${vo.ei_logofile2}' style='width:200px;'>
                </c:when>
                <c:when test="${vo.ei_logofile2.length() > 0}">
                  ${vo.ei_logofile1}
                </c:when>
              </c:choose>
              </c:when>
          </c:choose>
              <div id="daumRoughmapContainer1479364492085" class="root_daum_roughmap root_daum_roughmap_landing"></div>
              <script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
              <script charset="UTF-8">
                new daum.roughmap.Lander({
                  "timestamp" : "1479364492085",
                  "key" : "e7t3",
                  "mapWidth" : "200",
                  "mapHeight" : "300"
                }).render();
              </script>   
             <br> 
             <div style='text-align: center;'>              
              <button type="button" class="btn btn-warning btn-lg" onclick="location.href='../gurume/list4.do'">
              &nbsp;<i class='fa fa-star'></i> &nbsp;&nbsp;&nbsp;회사근처맛집&nbsp;&nbsp;</button>
             </div> 
        </div>
       </div>
      </div>
     </div>
    </div>
  </section>
</body>
<!-- -------------------------------------------- -->
<div style= 'margin: 200px 0 0 0;'>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html>  
