<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>취업성공 후기 게시판 </title>   
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">

 // 추천
 function likeup(sc_no){ // 응답 처리 함수
    var params = 'sc_no=' + sc_no;
    $.get('./likeup.do', params, likeup_res, 'json');
    alert('성공' + sc_no);
 }
 
 function likeup_res(data){ // 응답 처리 함수
   //alert('로그인이 필요합니다');
   //return false;
   $('#test_like' + data.sc_no).html(data.sc_likeup);  
 }
 
 // 비추천
 function likedown(sc_no){ // 응답 처리 함수
   var params = 'sc_no=' + sc_no;
   $.get('./likedown.do', params, likedown_res, 'json');
   alert('성공' + sc_no);
 }

 function likedown_res(data){ // 응답 처리 함수
   $('#test_unlike' + data.sc_no).html(data.likedown);  
 }
 
    
</script>
<script>
//iframe resize
function autoResize(i)
{
  var iframeHeight=
  (i).contentWindow.document.body.scrollHeight;
  (i).height= iframeHeight;
}   

/*   function autoResize(i){
  var resizeHeight = $("#reply").height();
  (i).contentWindow.document.body.scrollHeight + 200;
  (i).height= resizeHeight + 150;
} */

$(document).ready(function(){
  $(".menu>a").click(function(){
      $(this).next("div").toggleClass("hide");
  });
});

</script>
 

 <script type="text/javascript">
   $(function(){
    $('#file2').load(function(){ // 태그 메모리 상주후 작동
      // var width = $('#file2').width();
      //alert('file2: ' + width); 
      if ($('#file2').width() > screen.width * 0.6){
        $('#file2').width('80%');      
      }
    });
  }); 
  
</script>
<style>
.hr > hr {
 margin: 10px 0 10px 0;
 padding: 0;
}

.comment_area > hr {
 margin: 0;
 padding: 0;
}

.comment_area {
    background-color: #fafafa;
}


</style>
<style>
.hr > hr {
 margin: 10px 0 10px 0;
 padding: 0;
}

.comment_area > hr {
 margin: 0;
 padding: 0;
}

.comment_area {
    background-color: #fafafa;
}


</style>
 
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
                                <i class="fa fa-arrow-circle-right"> 취업 성공 후기</i>
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
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <div class="blog_single col-xs-8 col-sm-8 col-md-8 col-lg-8">
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

              </div>
            </article>
            <div class="" style=''>
   <div class="row" style='float:right;'>  
     <!-- 댓글 글쓰기 -->   
   <div style="width:55px; float:left;" >   
     <jsp:include page="update.jsp" flush='false' />
   </div>
   <div style="width:140px;  float:left; margin-left:4px;">
      <button type="button" class="btn btn-primary" onclick="location.href='./delete.do?sc_no=${seicoVO.sc_no}'">삭제</button>
      <button type="button" class="btn btn-default" onclick="location.href='./list.do?sc_no=${seicoVO.sc_no }'">목록보기</button>        
   </div>
   <div style="clear:both;"></div>
   
 
   </div>  
   <div style="clear:both;"></div>
         <!------------------------------------------------- 댓글 시작  --------------------------------------------->
            <div class="menu">
            <a href='#' onclick="<!-- alert('로그인이 필요합니다'); return false; -->" class="btn btn-primary btn-xs btn-alt">
            <i class="fa fa-comments-o"></i> 댓글</a> 
             <div class="hide"> 
             <iframe id="iframe" width="100%" onload="autoResize(this)" frameborder="0" src="../sdat/sdatlist.do?sc_no=${seicoVO.sc_no }"></iframe>
             </div>
          <!------------------------------------------------- 댓글 종료  --------------------------------------------->   
          </div>   
   
          </div>
        </div> 

  <!--Sidebar Widget-->
  <div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
    <div class="sidebar">
      <div class="widget widget_categories">
        <div class="metaInfo" style='border: 3px solid #f2f2f2; padding: 20px; margin: 0 0 30px 0;'>
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
      </div>
      </div>

   

                 
 <%-- <div class="news_comments">
    <div class="dividerHeading">
    <input type="hidden" name="sd_no" value="${sdatVO.sd_no}">
        <h4><span>Comments (<a>${sdatVO.sdatcnt}</a>)</span></h4>
    </div>
<table class="table table-condensed">
<tr>
    <td>
        <span class="form-inline" role="form" name='frm' id='frm'>
            <p>
               <div class="form-group">
                  ${seicoVO.sc_name} <!-- 닉네임을 받아옵니다 -->
                </div>
                <div class="form-group" style='position: relative; left: 88.5%;'>
                    <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default" onclick="create();">등록</button>
                </div>
            </p>
                <textarea id="commentParentText" class="form-control col-lg-12" name='content'
                style="width:100%" rows="4" placeholder="저작권등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정계층/민족,종교등을 비하하는 댓글은 임의로 삭제될 수 있습니다."></textarea>
            </span>
        </td>
    </tr>
</table>
<table id="commentTable" class="table table-condensed"></table><br><br>   
        </div>
      </div> --%>
  </section> 
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 