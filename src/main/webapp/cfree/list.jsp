<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
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
                              <i class="fa fa-arrow-circle-right"> 자유게시판</i> 
                          </ul> 
                      </nav>
                  </div>
              </div>
          </div>
</section>
</section>
        
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
<FORM name='frm' id='frm' method='POST' action='./create.do'>
  <input type="hidden" name="cm_no" value="0"> 
      <label for='cm_nick'>닉네임</label>
        <input type='text' name='cm_nick' id='cm_nick' size='10' value='닉네임' required="required">
        <label for='content'>글 제목</label>
        <input type='text' name='cm_title' id='cm_title' size='30' value='글 제목' required="required">
        <br>
        <label for='content'>글 내용</label>
        <input type='text' name='cm_content' id='cm_content' size='100' value='글 내용' required="required">
  <button type="submit" id='submit'>등록</button>
</FORM>
<hr>

<!-- 리스트 출력 --> 
<div class='content'>
<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 40%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>글 제목</TH>
    <TH class='th'>글 내용</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
 
  <c:forEach var="cmVO" items="${list }">
  <TR>
    <TD class='td'>${cmVO.cm_no}</TD>
    <TD class='td'>${cmVO.cm_nick}</TD>
    <TD class='td'>${cmVO.cm_title}</TD>
    <TD class='td'>${cmVO.cm_content}</TD>
    <TD class='td'>${cmVO.cm_rdate}</TD>
    <TD class='td'>
      <A href="./update.do?cm_no=${cmVO.cm_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}"><IMG src='./images/update.png' title='수정'></A>
      <a href="./delete.do?cm_no=${cmVO.cm_no }" onclick="return confirm('삭제 하시겠습니까?')"><IMG src='./images/delete.png' title='삭제'></a> 
    </TD>
    
  </TR>
  </c:forEach>
 
</TABLE>
 
<form name="frmSearch" method="get" action="./list.do">  
<DIV class='bottom'>
  <div style='text-align: center;'>
     <select name="col"> 
      <option value="">선택</option> 
      <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
      <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
      <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
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
     
    <input type="submit" value="검색"> 
  </div>
</DIV>
</form>
</div>
</div>
</div>
</div>
<!-- -------------------------------------------- -->
<DIV class='bottom'>${paging}</DIV>
<div style= 'margin: 100px 0 0 0;  position: relative;'>      
<jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
</body>
<!-- -------------------------------------------- -->
</html> 
 