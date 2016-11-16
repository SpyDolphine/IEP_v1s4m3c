 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공모전</title>    
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

 function scrapPop(ct_no, ct_title, nowUrl, me_no) {
   var winObject = null;
   var settings = "width=400, height=400";
   var nowUrl = location.href;
   winObject = window.open("../scrap/create.do?ct_no="+ct_no+"&ct_title="+ct_title+"&nowUrl="+nowUrl+"&me_no="+me_no,"",settings);
    
 }
 
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
                              <i class="fa fa-arrow-circle-right"> 공모전</i>
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
    <div class="col-xs-12 col-lg-10">  
  
  <div id="formcon">
    <FORM name='frm' method="get" action=''>
      <input type="hidden" name="ct_no" value="${contestVO.ct_no}">
       <fieldset>
        <table>
         <tbody>
           <tr>
            <td rowspan="9">
             <c:set var='file2' value="${fn:toLowerCase(contestVO.ct_file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <IMG src='./storage/${contestVO.ct_file1}' style='width:400px;'>
                </c:when>
                <c:when test="${fn:endsWith(file2, '.gif')}">
                  <IMG id='ct_file2'  src='./storage/${contestVO.ct_file2}' style='width:400px;'>
                </c:when>
                <c:when test="${fn:endsWith(file2, '.png')}">
                  <IMG id='ct_file2'  src='./storage/${contestVO.ct_file2}' style='width:400px;'>
                </c:when>
                <c:when test="${contestVO.ct_file2.length() > 0}">
                  ${contestVO.ct_file2 }
                </c:when>
                <c:otherwise>
                  <img src='./images/no.jpg' style='width:400px;'>
                </c:otherwise>            
              </c:choose>
            </td>
            <td class="form-group">
             <label for='ct_title' style="width:120px;">공모전 명칭 : </label>
             </td>
             <td>
              <span id="ct_title" value="ct_title">${contestVO.ct_title }</span>
            </td>
             </tr>
          <tr>
            <td> 
            <label for='ct_host' style="width:120px;">주최 : </label>
            </td>
             <td>
            <span>${contestVO.ct_host}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='ct_supervision' style="width:120px;">주관 : </label>
            </td>
             <td>
            <span>${contestVO.ct_supervision}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='ct_entry' style="width:120px;">참가 자격 : </label>
            </td>
             <td>
            <span>${contestVO.ct_entry}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='ct_enter' style="width:120px;">접수 방법: </label>
            </td>
             <td>
            <span>${contestVO.ct_enter}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='ct_award' style="width:120px;">시상 자격 : </label>
            </td>
             <td>
            <span>${contestVO.ct_award}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='sedate' style="width:120px;">접수 기간 : </label>
            </td>
             <td>
                <span>${contestVO.ct_startdate}~${contestVO.ct_enddate}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='ct_statedate' style="width:120px;">발표 일자 : </label>
            </td>
             <td>
            <span>${contestVO.ct_statedate}</span>
            </td>
         </tr>
          <tr>
            <td>
            <label for='ct_url' style="width:120px;">관련 홈페이지 : </label>
            </td>
             <td>
            <span>${contestVO.ct_url}</span>
            </td>
         </tr>
          <tr>
            <td colspan="3">
            <label for='ct_content' style="width:150px;">공모전 상세 요강 </label>
            </td>
            </tr>
            <tr>
            <td colspan="3">
            <span>${contestVO.ct_content}</span>
            </td>
         </tr>
        </table>
       </tbody>
      </fieldset>            

    <div class='left'>
       <label for="ct_cnt">조회수 : </label>
        <span>${contestVO.ct_cnt}</span>
        <label for="ct_rdate">등록일 : </label>
        ${contestVO.ct_rdate.substring(0, 16)}
    </div>    
    <div style='clear:both;'></div>
    <div class='right'>    
        <button type="button" class="btn btn-default btn-sm" onclick="location.href='./list.do'">목록</button>
      <c:if test="${sessionScope.me_grade eq  'A' }">
        <button type="submit" class="btn btn-default btn-sm" onclick="javascript:scrapPop('${contestVO.ct_no}', '${contestVO.ct_title }', 'nowUrl' ,'${contestVO.me_no }');">
        <i class='fa fa-bookmark-o'></i> 스크랩</button>
      </c:if>
          <c:if test="${sessionScope.me_grade eq  'M' }">
         <button type="submit" class="btn btn-default btn-sm" onclick="javascript:scrapPop('${contestVO.ct_no}', '${contestVO.ct_title }', 'nowUrl');">
         <i class='fa fa-bookmark-o'></i> 스크랩</button>
      </c:if>
      <c:if test="${sessionScope.me_grade eq 'A' }">
          <button type="button" class="btn btn-default btn-sm" onclick="location.href='./update.do?ct_no=${contestVO.ct_no}'">수정</button>
          <button type="button" class="btn btn-default btn-sm" onclick="location.href='./delete.do?ct_no=${contestVO.ct_no}'">삭제</button>
      </c:if>
    </div>    
    <div style='clear:both;'></div>
    </FORM>
    </div>
   </div>
  </DIV>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 