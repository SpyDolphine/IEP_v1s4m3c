<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" data-name="skins">
<link rel="stylesheet" href="../css/layout/wide.css" data-name="layout">
<link rel="stylesheet" href="../css/fractionslider.css"/>
<link rel="stylesheet" href="../css/style-fraction.css"/>
<link rel="stylesheet" href="../css/animate.css"/> 

<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">

 // 추천
 function likeup(rno){ // 응답 처리 함수
    var params = 'rno=' + rno;
    $.get('./likeup.do', params, likeup_res, 'json');
    alert('성공' + rno);
 }
 
 function likeup_res(data){ // 응답 처리 함수
   //alert('로그인이 필요합니다');
   //return false;
   $('#test_like' + data.rno).html(data.likeup);  
 }
 
 // 비추천
 function likedown(rno){ // 응답 처리 함수
   var params = 'rno=' + rno;
   $.get('./likedown.do', params, likedown_res, 'json');
   alert('성공' + rno);
 }

 function likedown_res(data){ // 응답 처리 함수
   $('#test_unlike' + data.rno).html(data.likedown);  
 }
 
 //-----------------------------------------------------------------------------------------------------------------//
    
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
</head>
<body>
<DIV id="reply">
<!------------------------------------------------- 댓글 시작  --------------------------------------------->
 <div class="comment_area">
   <br>
     <c:forEach var="commuReplyVO" items="${list }">
        <input type="hidden" name="rno" value="${commuReplyVO.rno}">
        <input type="hidden" name="cm_no" value="${commuReplyVO.cm_no}">
        <div style='float: left; font-weight:bold;'>
        &nbsp;<i class="fa fa-comment-o"></i> &nbsp;${commuReplyVO.rnick}
        </div>  
        <p style='float: right;'>
          <span style='color: #cccccc;'>${commuReplyVO.rdate.substring(0, 10)}</span> &nbsp; &nbsp;
             <A href="../commuReply/update.do?rno=${commuReplyVO.rno}"><i class="fa fa-pencil"></i></A>
             <a href="./delete.do?rno=${commuReplyVO.rno }" onclick="return confirm('삭제 하시겠습니까?')"><i class="fa fa-trash-o"></i></a>
        </p>      
        <fieldset style='margin: 10px 0 0 0;'>
          <ul>
            <li>
              ${commuReplyVO.rcontent}
            </li>
          </ul>
        </fieldset>   
        <div class='right'>
          <button id="likeup" onclick="likeup(${commuReplyVO.rno})" class="btn btn-default btn-xs btn-alt"> 
          <i class="fa fa-thumbs-o-up" style="color:red;"></i> 추천(<SPAN id='test_like${commuReplyVO.rno }'>${commuReplyVO.likeup}</SPAN>)</button>
          <button id="likedown" onclick="likedown(${commuReplyVO.rno})" class="btn btn-default btn-xs btn-alt" >
          <i class="fa fa-thumbs-o-down" style="color:blue;"></i> 비추천(<SPAN id='test_unlike${commuReplyVO.rno }'>${commuReplyVO.likedown}</SPAN>)</button>
        </div>
        <div style='clear: both;'></div>
        <div class='hr'><hr></div> 
       </c:forEach>
  </div>
  
  <fieldset>
  <FORM name='frm' id='frm' method='POST' action='./create.do'>
    <input type="hidden" id='cm_no' name='cm_no' value="${cm_no }">
    <input type="hidden" id='rno' name="rno" value="0"> 
    <input type="hidden" name="rnick" value="nick"> <!-- 임시값 -->
          <div class="span3 offset1">
            <label for='rnick'><i class="fa fa-leaf"> nick </i></label> 
          </div>
          <br>
          <textarea  rows="5" class="form-control" name='rcontent' id='rcontent' 
          placeholder='취업 준비생들의 소통 공간을 위한 댓글입니다. 타인에게 불쾌감을 주는 욕설 또는 비하하는 글은 임의로 삭제될 수 있습니다.' required="required"></textarea>
          <button type="submit" id='submit' class="btn btn-success btn-xs" style='float:right; margin: 5px;'>
          <i class="fa fa-pencil"></i> 등록</button>
          <br>
  </FORM>
  </fieldset>

<!------------------------------------------------- 댓글 종료  --------------------------------------------->   
</DIV>
</body>
 