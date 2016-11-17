<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title> 채용정보 앨범형 목록 </title> 
 
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
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 !  -->
                                <i class="fa fa-arrow-circle-right"> 채용정보 앨범형 목록 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! -->
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
   

   
<!--    ★★★ 내용입니다. -->
   
   <!--   <form name="frmSearch" method="get" action="./list.do">  -->
  <form name="frmSearch" method="get" action="./list_grid3.do"> 
<%--     <input type='hidden' name='blogcategoryno' id='blogcategoryno' value='${blogcategoryno }'> --%>
<%--     <input type='hidden' name='divisionno' id='divisionno' value='${divisionno }'> --%>
      
    <div class='content_menu'>
      <A href='./list.do'>게시판 목록</A> >｜
      <A href='./list_grid3.do'>앨범형 목록</A> >｜
      <A href='./create.do?ei_no=${vo.ei_no }'>등록</A>｜
      <A href="javascript:location.reload();">새로고침</A>
      
    <select name="col"> 
      <option value="">선택</option> 
      <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>채용 제목</option> 
      <option value="occupations" ${searchDTO.col == "occupations" ? "selected=selected" : "" }>직종</option>
      <option value="title_occupations" ${searchDTO.col == "title_occupations" ? "selected=selected" : "" }>
       채용 제목+직종</option>
      <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
    </select>
    <c:choose>
      <c:when test="${searchDTO.col != 'total' }">
        <input type="text" name="word" size="15" value="${searchDTO.word }">
      </c:when>
      <c:when test="${searchDTO.col == 'total' }">
        <input type="text" name="word" size="15" value="">
      </c:when>
      
    </c:choose>
     
    <input type="submit" value="검색">｜
  </div>
  </form> 
      <input type='hidden' name='ei_no' id='ei_no' value='${vo.ei_no }'> 
      <input type='hidden' name='col' id='col' value='${searchDTO.col }'> 
      <input type='hidden' name='word' id='word' value='${searchDTO.word }'>
      <input type='hidden' name='nowPage' id='nowPage' value='${searchDTO.nowPage }'>
 </div>
 <DIV style='width: 100%; clear: both; height: 1px; border-top: dotted 1px #AAAAAA; margin: 10px auto;'></DIV>
    <c:forEach var="vo" items='${list}'>
<!--     <DIV style='background-color: #EEEEEE; float: left; position: relative; left: 0%; margin: 1%; width: 23%; text-align: center;'> -->
    <DIV style='background-color: #EEEEEE; float: left; position: relative; left: 0%; margin: 1%; width: 17.2%; text-align: center;'>
<!--             <DIV style='width: 100%; line-height: 50px; '>    -->
            <DIV style='width: 100%; line-height: 25px; '>
              <DIV style="width: 100%; height: 100%; display: table-cell; vertical-align: middle;">
            <c:choose>
              <c:when test="${vo.ei_logofile1 == null}"></c:when>
              <c:when test="${vo.ei_logofile1 != null}">
                <c:set var='ei_logofile2' value="${fn:toLowerCase(vo.ei_logofile2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(ei_logofile2, '.jpg')}">
                    <IMG id='file2' src='./storage/${vo.ei_logofile2}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ei_logofile2, '.gif')}">
                    <IMG id='file2'  src='./storage/${vo.ei_logofile2}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ei_logofile2, '.png')}">
                    <IMG id='file2'  src='./storage/${vo.ei_logofile2}' >
                  </c:when>
                  <c:otherwise>
                    ${vo.ei_logofile2}
                  </c:otherwise>
                </c:choose>
                </c:when>
            </c:choose>
          </DIV>
    
   <br> 
   <br>
   </DIV>
   <div class="form-group">   
     <div style="width: 100%;">
     <A href="./read.do?em_no=${vo.em_no }&ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">
        &nbsp;${vo.em_title }</A>
     </div>
   </div>
</DIV> 
</c:forEach> 
  <button type='button' onclick="location.reload();">새로 고침</button>


   </div>
 </div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 