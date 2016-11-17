<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title> 채용정보 목록 </title> 
 
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
                                <i class="fa fa-arrow-circle-right"> 채용정보 목록 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! --> 
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
   
   <form name="frmSearch" method="get" action=""> 
<%--     <input type='hidden' name='blogcategoryno' id='blogcategoryno' value='${blogcategoryno }'> --%>
<%--     <input type='hidden' name='divisionno' id='divisionno' value='${divisionno }'> --%>    
      
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
    </form>
  </div>
  
<%--       <input type='hidden' name='em_no' id='em_no' value='${vo.em_no }'>  --%>
      <input type='hidden' name='col' id='col' value='${searchDTO.col }'> 
      <input type='hidden' name='word' id='word' value='${searchDTO.word }'>
      <input type='hidden' name='nowPage' id='nowPage' value='${searchDTO.nowPage }'>
     
<%
// ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
%>

 <DIV class='title'>채용 정보 목록</DIV>
 <div class="content" style='width: 100%; '>
  <table class="table table-striped">

   <thead>
    <TR>
     <TH>채용 제목</TH>
     <TH>직종</TH>
     <TH>등록일</TH>
     <TH>기타</TH>
    </TR>
   </thead>

   <%-- table 내용 --%>
   <tbody>
   
   <c:forEach var="vo" items='${list}'> 
     <TR>
      <TD style='vertical-align: middle;'>
           <%-- <c:choose>
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
                  <c:when test="${vo.ei_logofile2.length() > 0}">
                   ${vo.ei_logofile2 }
                  </c:when>
                </c:choose>
                </c:when>
            </c:choose>  --%>
            
       <A href="./read.do?em_no=${vo.em_no }&ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">
        &nbsp;${vo.em_title }</A></TD>     
      <TD style='vertical-align: middle;'>${vo.em_occupations }</TD>
<%--       <td style='vertical-align: middle;'>
            <c:choose>
              <c:when test="${vo.em_supportformfile1 == null}"></c:when>
              <c:when test="${vo.em_supportformfile1 != null}">
                <c:set var='em_supportformfile1' value="${fn:toLowerCase(vo.em_supportformfile1)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.jpg')}">
                    <IMG id='file2' src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.gif')}">
                    <IMG id='file2'  src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.png')}">
                    <IMG id='file2'  src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:otherwise>
                    ${vo.em_supportformfile1}
                  </c:otherwise>
                </c:choose>
                </c:when>
            </c:choose> 
      </td> --%>
      <TD style='vertical-align: middle;'>${vo.em_date.substring(0, 10) }</TD>
      <TD style='vertical-align: middle;'>     
       <a href="./read.do?em_no=${vo.em_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><IMG src='./images/update.png' title='내용'></A>
       <A href="./update.do?em_no=${vo.em_no }&ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><IMG src='./images/update.png' title='수정'></A>
       <A href="./delete.do?em_no=${vo.em_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
          
    </TR>
<%
//  }
%>

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
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 