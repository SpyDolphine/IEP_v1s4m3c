<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<script>
 // 추천
 function likeup(gu_no){ // 응답 처리 함수
    var params = 'gu_no=' + gu_no;
    $.get('./likeup.do', params, likeup_res, 'json');
    //alert('성공' + gu_no);
 }
 
 function likeup_res(data){ // 응답 처리 함수
   //alert('로그인이 필요합니다');
   //return false;
   $('#test_like' + data.gu_no).html(data.likeup);  
 }
 
 // 비추천
 function likedown(gu_no){ // 응답 처리 함수
   var params = 'gu_no=' + gu_no;
   $.get('./likedown.do', params, likedown_res, 'json');
   //alert('성공' + gu_no);
 }

 function likedown_res(data){ // 응답 처리 함수
   $('#test_unlike' + data.gu_no).html(data.likedown);  
 }
 
//-----------------------------------------------------------------------------------------------------------------//

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

<body>
  <div class="container">
     <jsp:include page="/menu/top.jsp" flush='false' />
     
     
   <div class='content_menu' style='width: 100%;'>
    <A href='../gurume/list4.do'>게시판 목록</A> >
    <%-- <A href='./list.do?blogcategoryno=${blogcategoryVO.blogcategoryno}'>${blogcategoryVO.title }</A>｜ --%>
    <A href='./create.do<%-- ?${gurumeVO.gu_no} --%>'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
    </div>
    
  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="gu_no" value="${gurumeVO.gu_no}">
      <fieldset class="fieldset">
      <div style="margin-left:3%; width:30%; height:80%;"><img src='./storage/${gurumeVO.file2}' style="width:100%; height:100%;"></div>
        <ul>
           <li>
            <label for='gu_title'>제목 : </label>
            <span>${gurumeVO.gu_title}</span><br>
          </li>
          <li>
            <label for='gu_area' >지역 : </label>
            <span>${gurumeVO.gu_area}</span><br>
          </li>
          <li>
            <label for='gu_menu' >분류 : </label>
            <span>${gurumeVO.gu_menu}</span><br>
          </li>
          <li>
            <label for='gu_price'>가격대 : </label>
            <span>${gurumeVO.gu_price}</span><br>
          </li>
       
          <li>
            <label for='gu_name' >닉네임 : </label>
            <span>${gurumeVO.gu_name}</span><br>
          </li>
            <li>
            <label for='gu_cont' >내용</label><br>
          <TEXTAREA name='gu_cont' id='gu_cont' rows='10' cols='70' readonly="readonly">${gurumeVO.gu_cont}
          </TEXTAREA>
      </li>
          <li>
            <label for='gu_stars' class="form_group" >별점 : </label>
             <span name='gu_stars' id='gu_stars' rows='10' cols='70' readonly="readonly">
             
            
               <c:choose>
            <c:when test="${gurumeVO.gu_stars == 1 }">
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${gurumeVO.gu_stars == 2 }">
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${gurumeVO.gu_stars == 3 }">
            <img src="../gurume/images/yellow.png"width= 20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${gurumeVO.gu_stars == 4 }">
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${gurumeVO.gu_stars == 5 }">
            <img src="../gurume/images/yellow.png"width=20px >
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            </c:choose> 
            
           </span> 
          </li>
        
          <li>
            <label for="gu_date" >등록일 : </label>
            <span>${gurumeVO.gu_date.substring(0, 16)}</span>
          </li>
         <li>
            <label for="file1" class="form_group">
            업로드 파일: 
            <c:if test="${gurumeVO.size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/gurume/storage&filename=${gurumeVO.file2}'>${gurumeVO.file2}</A>  (${gurumeVO.size2Label})
            </c:if>
            </label>
            <div>
              <c:set var='file2' value="${fn:toLowerCase(gurumeVO.file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <IMG id='file2' src='./storage/${gurumeVO.file1}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(file2, '.gif')}">
                  <IMG id='file2'  src='./storage/${gurumeVO.file1}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(file2, '.png')}">
                  <IMG id='file2'  src='./storage/${gurumeVO.file1}' onload="customize(this);">
                </c:when>
              </c:choose>
            </div> 
          </li>
              <li>
        <label for='content'>약도: </label>
        ${gurumeVO.gu_map}
      </li>   
      
      <li>
      </li>
         <%--  <li>
            <label for="replycnt" style="width:150px;">댓글수 : </label>
            <span>${blogVO.replycnt}</span>
          </li>
          <li>
            <label for="" style="width:150px;">블로그 카테고리 번호 : </label>
            <span>${blogVO.blogcategoryno}</span>
          </li> --%>
           <li class='right'>
            <%-- <button type="button" onclick="location.href='./reply.do?boardno=${boardVO.boardno }&divisionno=${boardVO.divisionno}&col=${searchDTO.col}&word=${searchDTO.word}'">답변</button> --%>
            <button type="button" onclick="location.href='./list4.do?gu_no=<%-- ?divisionno=${boardVO.divisionno} --%>&col=${searchDTO.col}&word=${searchDTO.word}'">목록보기</button>
            <button type="button" onclick="location.href='./update.do?gu_no=${gurumeVO.gu_no}&col=${searchDTO.col}&word=${searchDTO.word}'">수정</button>
            <button type="button" onclick="location.href='./delete.do?gu_no=${gurumeVO.gu_no}'">삭제</button>
            <%-- <button type="button" onclick="location.href='./read.do?gu_no=${gurumeVO}"'>좋아요</button> --%>
          </li>
           </ul>
          <!------------------------------------------------- 댓글 시작  --------------------------------------------->
            <div class="menu">
            <a href='#' onclick="<!-- alert('로그인이 필요합니다'); return false; -->" class="btn btn-primary btn-xs btn-alt">
            <i class="fa fa-comments-o"></i> 댓글</a> 
             <div class="hide"> 
             <iframe id="iframe" width="100%" onload="autoResize(this)" frameborder="0" src="../dat/datlist.do?gu_no=${gurumeVO.gu_no }"></iframe>
             </div>
          </div>   
          <!------------------------------------------------- 댓글 종료  --------------------------------------------->   
                 
      </fieldset>
    </FORM>
  </DIV>

  <div style= 'margin: 100px 0 0 0;  position: relative;'>      
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
  </div>
</body>

</html>
