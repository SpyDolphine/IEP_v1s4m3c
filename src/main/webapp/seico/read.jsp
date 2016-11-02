<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>취업성공 후기 게시판 </title>    
 
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
                                <i class="fa fa-arrow-circle-right"> 취업성공 후기 게시판 </i>
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
</section>
</section>

<section class="content blog">
<div class="container">
 <div class="row">
   <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
    <div class="blog_single">
            <article class="post">
              <div class="post_date">
                <span class="day">${fn:substring(seicoVO.sc_date, 8, 10)}</span> 
                <span class="month">${fn:substring(seicoVO.sc_date, 5, 7)}월</span>
              </div>
              <div class="post_content">
                <div class="post_meta">
                  <h2><a href="#">${seicoVO.sc_title}</a></h2>
                  <div class="metaInfo">
                    <span><a>${fn:substring(seicoVO.sc_date, 0, 10)}</a></span> 
                    <span>지역 <a>${seicoVO.sc_area}</a></span><br>
                    <span>By <a>${seicoVO.sc_gender}</a></span>
                    <span>면접경험 <a>${seicoVO.sc_ex}</a></span>
                    <span>취업지원직종 IT> <a>${seicoVO.sc_jobs}</a></span>
                    <span>직급 및 직무 <a>${seicoVO.sc_position}</a></span><br><br>
                    <span>취업과정 <br><a>${seicoVO.sc_cont}</a></span>
                  </div>
                </div>
                <p>면접질문<p><blockquote class="default">${seicoVO.sc_q}</blockquote>
                <p>면접 팁 <br><br> ${seicoVO.sc_tip}</p>

                <!-- <p>Donec in ut odio libero, at vulputate urna. Nulla
                  tristique mi a massa convallis cursus. Nulla eu mi
                  magna. Etiam suscipit commodo gravida. Cras suscipit,
                  quam vitae adipiscing faucibus, risus nibh laoreet
                  odio, a porttitor metus eros ut enim. Morbi augue
                  velit, tempus mattis dignissim nec, porta sed risus.
                  Donec eget magna eu lorem tristique pellentesque eget
                  eu duiport titor metus eros ut enim.</p> -->
              </div>
            </article>
          </div>
        </div>

  <!--Sidebar Widget-->
  <div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
    <div class="sidebar">
      <div class="widget widget_categories">
      
        <div class="metaInfo" style='padding: 50px 0 50px 0;'>
                <span>면접난이도 <a>${seicoVO.sc_stars}</a></span><br><br>
                <span>취업경로 <a>${seicoVO.sc_where}</a></span><br><br>
        </div>
      
        <div class="widget_title">
          <h4><span>Categories</span></h4>
        </div>
          <ul class="arrows_list list_style">
            <li><a href="#"> 솔데스크(10)</a></li>
            <li><a href="#"> 보안코딩()</a></li>
            <li><a href="#"> 매우힘듬()</a></li>
            <li><a href="#"> 성공후기를 볼까요()</a></li>
            <li><a href="#"> 공지사항으로 가볼까요()</a></li>
            <li><a href="#"> 기업정보를 봅니다()</a></li>
          </ul>
        </div>
       </div>
      </div>
      </div>
<div class="col-xs-12 col-md-10 col-lg-5" style='position: relative; left: 20%;'>
   <div style='position: relative; left: 72%;'>  
     <jsp:include page="update.jsp" flush='false' />
   </div>  
   <div style='position: relative; left: 80%;'>   
      <button type="button" class="btn btn-primary" onclick="location.href='./delete.do?if_no=${ifVO.if_no}'">삭제</button>
      <button type="button" class="btn btn-default" onclick="location.href='./list.do?if_no=${ifVO.if_no }'">목록보기</button>        
   </div>
   </div>
   </div></section>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 