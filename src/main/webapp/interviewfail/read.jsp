<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정모방</title> 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
//iframe resize
function autoResize(i)
{
   var iframeHeight=
   (i).contentWindow.document.body.scrollHeight;
   (i).height= iframeHeight;
}   

function Resize(i)
{
   var iframeHeight=
   (i).contentWindow.document.body.scrollHeight;
   (i).height= iframeHeight +270;
}   

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
                              <i class="fa fa-arrow-circle-right"> 취업 실패 후기</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>

<section class="content blog">
  <input type="hidden" name="if_no" value="${ifVO.if_no}">
  <input type="hidden" name="rno" value="${replyVO.rno}">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8" style="float:left;">
          <div class="blog_single">
            <article class="post">
              <div class="post_date">
                <span class="day">${fn:substring(ifVO.if_date, 8, 10)}</span> 
                <span class="month">${fn:substring(ifVO.if_date, 5, 7)}월</span>
              </div>
              <div class="post_content">
                <div class="post_meta">
                  <h2><a>${ifVO.if_title}</a></h2>
                  <div class="metaInfo">
                    <span>${fn:substring(ifVO.if_date, 0, 10)}</span> 
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
              </div>
            </article>
          </div>
<div class="col-xs-12">
   <div style='width:200px; float:right;'>   
    <div style="width:60px; float:left;">
     <jsp:include page="update.jsp" flush='false' />
     </div>
     <div style="width:140px;  float:left;">
      <button type="button" class="btn btn-primary" onclick="location.href='./delete.do?if_no=${ifVO.if_no}'">삭제</button>
      <button type="button" class="btn btn-default" onclick="location.href='./list.do?if_no=${ifVO.if_no }'">목록보기</button>
      </div>        
      <div style="clear:both;"></div>
   </div>
      <div style="clear:both;"></div>
    
<!------------------------------------------------- 댓글 시작  --------------------------------------------->
  <iframe id="iframe" width="100%" onload="autoResize(this)" frameborder="0" scrolling="no" src="../failreply/replylist.do?if_no=${ifVO.if_no }"></iframe>
<!------------------------------------------------- 댓글 종료  --------------------------------------------->      
  </div>
   </div>
       
  <!--Sidebar Widget-->
  <div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
    <div class="sidebar">
      <div class="widget widget_categories">
        <div class="metaInfo" style='border: 3px solid #f2f2f2; padding: 20px; margin: 0 0 30px 0;'>
                <span>면접난이도 <a>${ifVO.if_level}</a></span><br><br>
                <span>취업경로 <a>${ifVO.if_where}</a></span><br><br>
                <span>채용방식 <a>${ifVO.if_how}</a></span><br><br>
                <span>발표시기 <a>${ifVO.if_when}</a></span>
        </div>
<!--    <div class="widget_title">
          <h4><span>Categories</span></h4>
        </div>
          <ul class="arrows_list list_style">
            <li><a href="#"> 솔데스크(10)</a></li>
            <li><a href="#"> 보안코딩()</a></li>
            <li><a href="#"> 매우힘듬()</a></li>
            <li><a href="#"> 성공후기를 볼까요()</a></li>
            <li><a href="#"> 공지사항으로 가볼까요()</a></li>
            <li><a href="#"> 기업정보를 봅니다()</a></li>
          </ul> -->
<!--------------------------------------------- 오른쪽 위젯  ------------------------------------------>          
        <div class="widget_title">
          <h4><span>LOOK AT ME!</span></h4>
        </div>
         <div class="widget widget_tab">
            <div class="velocity-tab sidebar-tab">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#Popular" data-toggle="tab">많이 본 글</a></li>
                    <li class=""><a href="#Recent" data-toggle="tab">실시간 인기글</a></li>
                    <li class="last-tab"><a href="#Comment" data-toggle="tab"><i class="fa fa-comments-o"></i> 인기댓글</a></li>
                </ul>
                <div  class="tab-content clearfix">
                    <div class="tab-pane fade active in" id="Popular">
                    <c:forEach var="ifVO" begin="0" end="5" step="1" items="${manylist}">
                        <ul class="recent_tab_list">
                            <li>
                                <span><a href="#"></a></span>
                                <a href="./read.do?if_no=${ifVO.if_no }">${ifVO.if_title}</a>
                                <i>${fn:substring(ifVO.if_date, 0, 16)}</i>
                            </li>
                        </ul>
                    </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="Recent">
                        <ul class="recent_tab_list">
                            <li class="last-tab">
                                <span><a href="#"></a></span>
                                <a href="#">게시글 좋아요♥ 쿠키를 이용해야해...</a>
                                <i>October 16, 2015</i>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade" id="Comment">
                        <iframe id="iframe" width="100%" onload="Resize(this)" frameborder="0" scrolling="no" src="../reply/populreply.do"></iframe>
                    </div>
                </div>
            </div>
        </div>         
<!--------------------------------------------- 오른쪽 위젯종료  ------------------------------------------>                  
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