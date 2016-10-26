<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<jsp:include page="/menu/top.jsp" flush='false' />
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

<body>

     
     
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
        <ul>
          <li>
            <label for='gu_area' style="width:150px;">지역 : </label>
            <span>${gurumeVO.gu_area}</span><br>
          </li>
          <li>
            <label for='gu_menu' style="width:150px;">분류 : </label>
            <span>${gurumeVO.gu_menu}</span><br>
          </li>
          <li>
            <label for='gu_title' style="width:150px;">제목 : </label>
            <span>${gurumeVO.gu_title}</span><br>
          </li>
          <li>
            <label for='gu_name' style="width:150px;">닉네임 : </label>
            <span>${gurumeVO.gu_name}</span><br>
          </li>
            <li>
            <label for='gu_cont' style="width:150px;">내용</label><br>
          <TEXTAREA name='gu_cont' id='gu_cont' rows='10' cols='70'>
                  ${gurumeVO.gu_cont}
          </TEXTAREA>
      </li>
          <li>
            <label for='gu_stars' style="width:150px;">별점 : </label>
            <span>${gurumeVO.gu_stars}</span>
          </li>
        
          <li>
            <label for="gu_date" style="width:150px;">등록일 : </label>
            <span>${gurumeVO.gu_date.substring(0, 16)}</span>
          </li>
         <li>
            <label for="file1" class="form_group" style="width:150px;">
            업로드 파일: 
            <c:if test="${gurumeVO.size2 > 0}">
              <A href='${pageContext.request.contextPath}/download?dir=/gurume/storage&filename=${gurumeVO.file2}'>${gurumeVO.file2}</A>  (${gurumeVO.size2Label})
            </c:if>
            </label>
            <div>
              <c:set var='file2' value="${fn:toLowerCase(gurumeVO.file2)}" />
              <c:choose>
                <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <IMG id='file2' src='./storage/${gurumeVO.file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(file2, '.gif')}">
                  <IMG id='file2'  src='./storage/${gurumeVO.file2}' onload="customize(this);">
                </c:when>
                <c:when test="${fn:endsWith(file2, '.png')}">
                  <IMG id='file2'  src='./storage/${gurumeVO.file2}' onload="customize(this);">
                </c:when>
              </c:choose>
            </div> 
          </li>
         <%--  <li>
            <label for="replycnt" style="width:150px;">댓글수 : </label>
            <span>${blogVO.replycnt}</span>
          </li>
          <li>
            <label for="" style="width:150px;">블로그 카테고리 번호 : </label>
            <span>${blogVO.blogcategoryno}</span>
          </li> --%>
        </ul>
      </fieldset>
    </FORM>
  </DIV>


</body>
     <jsp:include page="/menu/bottom.jsp" flush='false' />     

</html>
