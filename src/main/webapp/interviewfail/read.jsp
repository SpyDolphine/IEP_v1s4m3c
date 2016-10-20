<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script type="text/javascript">

</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->
  
  <section class="content blog">
  <input type="hidden" name="if_no" value="${ifVO.if_no}">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
          <div class="blog_single">
            <article class="post">
              <div class="post_date">
                <span class="day">${fn:substring(ifVO.if_date, 8, 10)}</span> 
                <span class="month">${fn:substring(ifVO.if_date, 5, 7)}월</span>
              </div>
              <div class="post_content">
                <div class="post_meta">
                  <h2><a href="#">${ifVO.if_title}</a></h2>
                  <div class="metaInfo">
                    <span><a>${fn:substring(ifVO.if_date, 0, 10)}</a></span> 
                    <span>지역 <a>${ifVO.if_region}</a></span><br>
                    <span>By <a>${ifVO.if_gender}</a></span>
                    <span>면접경험 <a>${ifVO.if_exper}</a></span>
                    <span>취업지원직종 IT> <a>${ifVO.if_company}</a></span>
                    <span>직급 및 직무 <a>${ifVO.if_position}</a></span><br><br>
                    <span>취업과정 <br><a>${ifVO.if_content}</a></span>
                  </div>
                </div>
                <p>면접질문<p><blockquote class="default">${ifVO.if_q}</blockquote>
                <p>면접 답변 <br><br> ${ifVO.if_a}</p>

                <p>Donec in ut odio libero, at vulputate urna. Nulla
                  tristique mi a massa convallis cursus. Nulla eu mi
                  magna. Etiam suscipit commodo gravida. Cras suscipit,
                  quam vitae adipiscing faucibus, risus nibh laoreet
                  odio, a porttitor metus eros ut enim. Morbi augue
                  velit, tempus mattis dignissim nec, porta sed risus.
                  Donec eget magna eu lorem tristique pellentesque eget
                  eu duiport titor metus eros ut enim.</p>
              </div>
            </article>
          </div>
        </div>

  <!--Sidebar Widget-->
  <div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
    <div class="sidebar">
      <div class="widget widget_categories">
      
        <div class="metaInfo" style='padding: 50px 0 50px 0;'>
                <span>면접난이도 <a>${ifVO.if_level}</a></span><br><br>
                <span>취업경로 <a>${ifVO.if_where}</a></span><br><br>
                <span>채용방식 <a>${ifVO.if_how}</a></span><br><br>
                <span>발표시기 <a>${ifVO.if_when}</a></span>
        </div>
      
        <div class="widget_title">
          <h4><span>Categories</span></h4>
        </div>
          <ul class="arrows_list list_style">
            <li><a href="#"> Grapic Design (10)</a></li>
            <li><a href="#"> Web Design  Development (25)</a></li>
            <li><a href="#"> Photography (29)</a></li>
            <li><a href="#"> Custom Illustrations (19)</a></li>
            <li><a href="#"> Wordpress Themes(38)</a></li>
            <li><a href="#"> Videography (33)</a></li>
          </ul>
        </div>
       </div>
      </div>
    </div>
   </div>
      <div class="col-xs-12 col-lg-4 col-sm-4 col-md-offset-5">
        <jsp:include page="update.jsp" flush='false' />
      </div>
      <div style='text-align: center;'>
        <button type="button" class="btn btn-primary" onclick="location.href='./delete.do?if_no=${ifVO.if_no}'">삭제</button>
        <button type="button" class="btn btn-default" onclick="location.href='./list.do?if_no=${ifVO.if_no }'">목록보기</button>
        </div>
  </section>
    <!-- -------------------------------------------- -->
    <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>