<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1:1 게시판</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<style>
/* Contact_page_3
==================================*/
.contact_3{
    padding:0 0 60px;
    position: relative;
}

.contact_3 .lead {
    font-size: 16px;
    margin-bottom: 80px;
}

.contact_3 .form-control {
    border-radius: 0;
    height: 36px;
    margin-bottom: 10px;
    padding:0 12px ;
}
.contact_3 textarea.form-control{
    height: 230px;
}
.contact_3 .form-group label {
    color: #6f6f6f;
    font-size: 13px;
    font-weight: normal;
    margin-bottom: 4px;
}
.contact_3 .widget_info_contact {
    margin-top: 20px;
    display: inline-block;
}
.contact_3 .widget_info_contact strong {
    display: block;
    font-size: 18px;
    line-height: 20px;
    font-weight: normal;
    text-align: center;
    margin-bottom: 10px;
}
.contact_3 .widget_info_contact li i {
    color: #647382;
    font-size: 24px;
    text-align: center;
    width: 100%;
    margin-bottom: 17px;
}

.contact_3 .widget_info_contact p{
    overflow:visible;
    margin: 0;
}
.contact_3 .widget_info_contact p a {
    color: #647382;
    font-size: 12.5px;
    font-weight: 600;
    margin-bottom: 5px;
}

/* MAPS
=========================== */
.contact{
    padding:50px 0;
}
.maps{
    position:relative;
    margin-bottom: 75px;

}
#page_maps{
    max-height:380px;
    height:360px;
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
                              <i class="fa fa-arrow-circle-right"> 1:1 문의게시판</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>

<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
    <div class="list_content" style='width: 90%;'>
    
<section class="contact_3">
    <div class="col-lg-12 col-md-12 col-sm-12 text-center">  
           <div class="dividerHeading text-center">
              <h4><span>찾아오시는 길</span></h4>
          </div>      
  <!-- 1. 약도 노드 -->
  <div id="daumRoughmapContainer1479317136464" class="root_daum_roughmap root_daum_roughmap_landing"></div>
  <!-- 2. 설치 스크립트 -->
  <script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
  <!-- 3. 실행 스크립트 -->
  <script charset="UTF-8">
    new daum.roughmap.Lander({
      "timestamp" : "1479317136464",
      "key" : "e7b5",
      "mapWidth" : "1000",
      "mapHeight" : "300"
    }).render();
  </script>
 </div> 
 <br>
  <div class="row sub_content">
      <div class="col-lg-12 col-md-12 col-sm-12 text-center">
          <div class="dividerHeading text-center">
              <br>
              <h4><span>1:1 문의</span></h4>
          </div>
          <p class="lead">직원이 상주하지 않습니다. <br> 이메일로 문의 부탁드립니다. 감사합니다. 행복하세요~~~</p>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-6">
          <div class="alert alert-success hidden alert-dismissable" id="contactSuccess">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>Success!</strong> Your message has been sent to us.
          </div>

          <div class="alert alert-error hidden" id="contactError">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>Error!</strong> There was an error sending your message.
          </div>

          <form id="contactForm" action="" novalidate="novalidate">
              <div class="row">
                  <div class="form-group">
                      <div class="col-lg-4 ">
                          <label>Your name (required)</label>
                          <br>
                          <input type="text" id="name" name="name" class="form-control" maxlength="100" data-msg-required="Please enter your name." value="" placeholder="" >
                      </div>
                      <div class="col-lg-4 ">
                          <label>Your Email (required)</label>
                          <br>
                          <input type="email" id="email" name="email" class="form-control" maxlength="100" data-msg-email="Please enter a valid email address." data-msg-required="Please enter your email address." value="" placeholder="" >
                      </div>
                      <div class="col-md-4">
                          <label>Subject</label>
                          <br>
                          <input type="text" id="subject" name="subject" class="form-control" maxlength="100" data-msg-required="Please enter the subject." value="" placeholder="">
                      </div>
                  </div>
              </div>

              <div class="row">
                  <div class="form-group">
                      <div class="col-md-12">
                          <label>Your Message :-</label>
                          <br>
                          <textarea id="message" class="form-control" name="message" rows="10" cols="50" data-msg-required="Please enter your message." maxlength="5000" placeholder=""></textarea>

                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-12">
                      <input type="submit" data-loading-text="Loading..." class="btn btn-default btn-lg" value="문의 메일 보내기">
                  </div>
              </div>
          </form>
      </div>

      <div class="col-lg-6 col-md-6 col-sm-6">
          <div class="sidebar">
              <div class="widget_info">
                <h4><span>IEP PROJECT Info</span></h4>
                  <p>
                  최영찬(팀장), 한상은(수석디자이너), 손은정(서브디자이너), <br> 최대용(), 이용수(), 박시한() <br>
                  IT 계열 취업 준비생을 위한 지침 사이트 입니다. 다양한 회사 채용 정보와 진솔한 회사 후기 등을 들을 수 있으며 자유롭게 
                  의견을 나눌 수 있는 사이트입니다. <br> 언니가 일본어로 적어주었으면 좋겠습니다 !!!! 용수오빠는 영어로 적어주셨으면 좋겠습니다!!! 헤헤헤
                  </p>
                  <ul class="widget_info_contact clearfix">
                      <li class="col-sm-4"><i class="fa fa-map-marker"></i><strong>Address</strong> <p> : 서울 종로구 종로12길 15 코아빌딩1</p></li>
                      <li class="col-sm-4"><i class="fa fa-envelope"></i> <strong>Email</strong><p> : <a href="#"> mail@example.com</a></p> <p>: <a href="#"> mail@example.com</a></p></li>
                      <li class="col-sm-4"><i class="fa fa-phone"></i> <strong>Our Phone</strong> <p> : 010-1234-5678</p><p>: 010-3456-7890</p></li>
                  </ul>
              </div>
                </div>
                </div>
            </div>
        </div>
     </div></div></div>
    </section>
</section>
<!--end wrapper-->   
</body>
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>     
</html>

