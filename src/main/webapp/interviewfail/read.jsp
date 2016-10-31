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
  $(function(){
      //제일 하단에 있는 depth1의 댓글을 다는 이벤트
   function create(){  
      $('#frm').attr('action', './replycreate.do');  
      $('#submit').html('등록');
      $("#commentParentSubmit").click(function( event ) {

          var pName = '<c:out value="${ifVO.if_region}"/>';   // 닉네임 받아오기
          var pDate = '<c:out value="${fn:substring(ifVO.if_date, 0, 10)}"/>';  // 댓글 단 시간 if(24시간전이면 시간출력) else (24시간후면 날짜출력)
          var pText = $("#commentParentText");  // 글내용
          
          // 첫번째 댓글 출력
          var commentParentText = '<tr id="commentParentCode" name="commentParentCode">'+
                                  '<td colspan=2>'+
                                  '<strong>'+ pName +'</strong> '+ pDate +' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'
                                  + pText.val().replace(/\n/g, "<br>")+'</p>'+
                                  '</td>'+
                                  '</tr>';
             
          //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
          if($('#commentTable').contents().size()==0) {
              $('#commentTable').append(commentParentText);
          }else{
              $('#commentTable tr:last').after(commentParentText);
          }
          
          $("#commentParentText").val("");
      });
   }
         
      //댓글의 댓글을 다는 이벤트
      $(document).on("click","#commentChildSubmit", function(){
             
          var cName = '<c:out value="${ifVO.if_region}"/>';
          var cDate = '<c:out value="${fn:substring(ifVO.if_date, 0, 10)}"/>';
          var cText = $("#commentChildText");
          
          var commentChildText = '<tr name="commentChildCode">'+
                                 '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                 '<td style="width:99%">'+
                                 '<strong>'+ cName +'</strong> '+ cDate +' <a style="cursor:pointer;" name="cAdd">답글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>'+
                                 '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                 '</td>'+
                                 '</tr>'; 
                                  
          //앞의 tr노드 찾기
          var prevTr = $(this).parent().parent().parent().parent().prev();
          //댓글 적는 에디터 삭제
          $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
             
          //댓글을 타고 올라가며 부모 tr을 찾음
          while(prevTr.attr("name")!="commentParentCode"){
              prevTr = prevTr.prev();
          }
          //while를 타는지 체크
          var check = false;
          //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
          var nextTr = prevTr.next();
          //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
          if(nextTr.attr("name")!="commentChildCode"){
              prevTr.after(commentChildText);
          }else{
              //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
              while(nextTr.attr("name")=="commentChildCode"){
                  nextTr = nextTr.next();
                  check = true;
              }
          }
             
          if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
              nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
              nextTr.after(commentChildText);
          }
             
      });
         
      //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
      $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
             
          if($(this).attr("name")=="pDel"){
              if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                     
                  var delComment = $(this).parent().parent();
                  var nextTr = delComment.next();
                  var delTr;
                  //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                  while(nextTr.attr("name")=="commentCode"){
                      nextTr = nextTr.next();
                      delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                      delTr.remove();
                  }
                     
                  delComment.remove();
                     
              }else{   //취소
                  return;
              }
          }else if($(this).attr("name")=="cDel"){
              if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                  $(this).parent().parent().remove();
              }else{   //취소
                  return;
              }
          }else{
              //자기 부모의 tr을 알아낸다.
              var parentElement = $(this).parent().parent();
              //댓글달기 창을 없앤다.
              $("#commentEditor").remove();
              //부모의 하단에 댓글달기 창을 삽입
              var commentEditor = '<tr id="commentEditor">'+
                                      '<td style="width:1%"> </td>'+
                                      '<td>'+
                                          '<span class="form-inline" role="form">'+
                                              '<p>'+
                                                  '<div class="form-group">'+ 
                                                  '</div>'+ 
                                                  '<div class="form-group">'+ '<c:out value="${ifVO.if_region}"/>' + 
                                                  '</div>'+                                                  
                                                  '<div class="form-group" style="position: relative; left: 79%;">'+
                                                      '<button type="button" id="commentChildSubmit" class="btn btn-default">등록</button>'+
                                                      '<button type="button" class="btn btn-default" onclick="#">닫기</button>' +
                                                  '</div>'+
                                              '</p>'+
                                                  '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4" '+
                                                  'placeholder="저작권등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정계층/민족,종교등을 비하하는 댓글은 임의로 삭제될 수 있습니다."'
                                                  +'></textarea>'+
                                          '</span>'+
                                      '</td>'+
                                  '</tr><br><br><br>';
                                     
              parentElement.after(commentEditor); 
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
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
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
         

<div class="col-xs-12 col-md-10 col-lg-5" style='position: relative; left: 20%;'>
   <div style='position: relative; left: 72%;'>  
     <jsp:include page="update.jsp" flush='false' />
   </div>  
   <div style='position: relative; left: 80%;'>   
      <button type="button" class="btn btn-primary" onclick="location.href='./delete.do?if_no=${ifVO.if_no}'">삭제</button>
      <button type="button" class="btn btn-default" onclick="location.href='./list.do?if_no=${ifVO.if_no }'">목록보기</button>        
   </div>
   
   
<!-- 댓글 글쓰기 -->   
<div class="news_comments">
    <div class="dividerHeading">
    <input type="hidden" name="rno" value="${replyVO.rno}">
        <h4><span>Comments (<a>${replyVO.replycnt}</a>)</span></h4>
    </div>
<table class="table table-condensed">
<tr>
    <td>
        <span class="form-inline" role="form" name='frm' id='frm'>
            <p>
                <div class="form-group">
                  ${ifVO.if_region} <!-- 닉네임을 받아옵니다 -->
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
      </div>
  </section>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- -------------------------------------------- -->
<div style= 'margin: 200px 0 0 0;'>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html>