<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/JavaScript">
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
                              <c:choose>
                                <c:when test="${commuVO.cm_ch eq 'A'}">
                                  <li><A href='./listA.do'>목록</A></li>
                                </c:when>
                                <c:when test="${commuVO.cm_ch eq 'B'}">
                                  <li><A href='./listB.do'>목록</A></li>
                                </c:when>
                                <c:when test="${commuVO.cm_ch eq 'C'}">
                                  <li><A href='./listC.do'>목록</A></li>
                                </c:when>                                
                              </c:choose>
                              <i class="fa fa-arrow-circle-right"> 글 쓰 기</i> 
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
   <div class="col-xs-12 col-lg-12">

<DIV class='write_content'>
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
   <fieldset>
    <ul>
      <li>
        <label for='cm_ch'>카테고리</label>
        <select name='cm_ch' id='cm_ch'>
           <option value="A" selected="selected">정모방</option>
           <option value="B">정보공유방</option>
           <option value="C">상담/공감방</option>           
        </select>
      </li>
      <li>
        <label for='cm_title'>제목</label>
        <input type='text' name='cm_title' id='cm_title' value='취업하자' size='60' required="required">
      </li>
      <li>
        <label for='cm_nick'>닉네임</label>
        <input type='text' name='cm_nick' id='cm_nick' value='복덩이' size='60' required="required">
      </li>
      <li>
        <label for='cm_content'>내용</label>
        <textarea name='cm_content' id='cm_content'  rows='5' cols='70'>좋은곳에 취업합니다</textarea>
      </li>
      <li>
        <label for='file1'>Thumb 파일</label>
          Preview(미리보기) 이미지 자동 생성됩니다.
      </li>
      <li>
        <label for='file2'>업로드 파일</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </li>
      <li>
        <label for='cm_map'>지도</label>
        <textarea name='cm_map' id='cm_map'  rows='5' cols='70'></textarea>
      </li>  
      <li>
        <label for='cm_url'>url</label>
        <input type='text' name='cm_url' id='cm_url' value='봄' size='60' required="required">
      </li>   
             
      <li class='right'>
        <button type="submit">등록</button>
        <c:choose>
          <c:when test="${commuVO.cm_ch eq 'A'}">
            <button type="button" onclick="location.href='./listA.do'">목록</button>
          </c:when>
          <c:when test="${commuVO.cm_ch eq 'B'}">
            <button type="button" onclick="location.href='./listB.do'">목록</button>
          </c:when>
          <c:when test="${commuVO.cm_ch eq 'C'}">
            <button type="button" onclick="location.href='./listC.do'">목록</button>
          </c:when>          
        </c:choose>        
      </li>         
    </ul>
    </fieldset>
  </FORM>
</DIV>
 </div></div></div>
</body>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>       
<!-- -------------------------------------------- -->
</html> 