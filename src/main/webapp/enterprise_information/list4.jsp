<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title> 기업정보 목록 </title>    

<link href="../css/style.css" rel="Stylesheet" type="text/css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
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
                                <i class="fa fa-arrow-circle-right"> 기업정보 목록 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! -->
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
   
   <form name="frmSearch" method="get" action="./list.do"> 
      
    <div class='content_menu' style='width: 100%; font-family: 궁서; font-size: 15px;'>
<!--       <A href='./list.do'>게시판 목록</A> >｜ -->
<!--       <A href='./list_grid3.do'>앨범형 목록</A> >｜ -->
<%--       <A href='./create.do?ei_no=${vo.ei_no }'>등록</A>｜ --%>
<!--       <A href="javascript:location.reload();">새로고침</A> -->
      
    <select name="col"> 
      <option value="">선택</option> 
      <option value="name" ${searchDTO.col == "name" ? "selected=selected" : "" }>회사 이름</option> 
      <option value="business" ${searchDTO.col == "business" ? "selected=selected" : "" }>업종</option>
      <option value="name_business" ${searchDTO.col == "name_business" ? "selected=selected" : "" }>회사 이름+업종</option>
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
      <input type='hidden' name='col' id='col' value='${searchDTO.col }'> 
      <input type='hidden' name='word' id='word' value='${searchDTO.word }'>
      <input type='hidden' name='nowPage' id='nowPage' value='${searchDTO.nowPage }'>
     
<%
// ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
%>

 <DIV class='title' style='font-family: 궁서;'>기업 정보 목록</DIV>
 <div class="content" style='width: 100%; '>
  <table class="table table-striped">
  
   <colgroup>
  
   <%-- table 컬럼 --%>
   
   <thead>
    <TR>
     <TH style='font-family: 궁서; font-size: 18px;'>회사이름</TH>
     <TH style='font-family: 궁서; font-size: 18px;'>업종</TH>
     <TH style='font-family: 궁서; font-size: 18px;'>등록일</TH>
     <TH style='font-family: 궁서; font-size: 18px;'>기타</TH>
    </TR>
   </thead>

   <%-- table 내용 --%>
   <tbody>
   
   <c:forEach var="vo" items='${list}'> 
     <TR>
      <TD style='vertical-align: middle;'>
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
            
       <A href="./read.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">
        &nbsp;${vo.ei_corporationname }</A></TD>     
      <TD style='vertical-align: middle; font-family: 궁서; font-size: 18px;'>${vo.ei_business }</TD>
      <TD style='vertical-align: middle; font-family: 궁서; font-size: 18px;'>${vo.ei_date.substring(0, 10) }</TD>
      <TD style='vertical-align: middle; font-family: 궁서; font-size: 18px;'>     
       <a href="./read.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><IMG src='./images/update.png' title='내용'></A>
       <a href="./update.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><IMG src='./images/update.png' title='수정'></A>
       <A href="./delete.do?ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
          
    </TR>

   </c:forEach>
  </tbody>
 </TABLE>
 <br><br>
</div>
 
<!-- <DIV class='bottom'> -->
<DIV class="modal-footer" style='text-align: right;'>
  <button type='button' class="btn btn-default" onclick="location.href='./create.do'">등록</button>
  <button type='button' class="btn btn-default" onclick="location.reload();">새로 고침</button>
</DIV>

  <DIV class='bottom'>${paging}</DIV>
    


   </div>
 </div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 