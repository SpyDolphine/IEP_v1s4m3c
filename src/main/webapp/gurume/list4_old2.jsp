<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>맛집 게시판 </title>   
 
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
                                <i class="fa fa-arrow-circle-right"> 맛집 </i> 
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
     
     
  <form name="frmSearch" method="get" action="./list4.do"> 
    <div class='content_menu' style='width: 100%;'>
      <A href='./list4.do'>게시판 목록</A> >
      <A href='./list.do<%-- ?divisionno=${divisionVO.divisionno} --%>'><%-- ${divisionVO.title } (${totalRecord }) --%> </A>｜
      <A href='./create.do?<%-- divisionno=${divisionVO.divisionno} --%>'>등록</A>｜
      <A href="javascript:location.reload();">새로고침</A>
  
      <select name="col"> 
        <option value="">선택</option> 
        <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
        <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
        <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
        <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
      </select>
      <c:choose>
        <c:when test="${searchDTO.col != 'total' }"> <!-- 검색 상태 -->
          <input type="text" name="word" size="15" value="${searchDTO.word }">
        </c:when>
        <c:when test="${searchDTO.col == 'total' }"> <!-- 전체 레코드 -->
          <input type="text" name="word" size="15" value="">
        </c:when>
      </c:choose>
     
      <input type="submit" value="검색">
    </div>
  </form> 
  
  <div class="content" style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <%-- table 컬럼 --%>
      <thead>
         <tr>
          <th>번호</th>
          <th>지역</th>
          <th>분류</th>
          <th>제목</th>
          <th>닉네임</th>
          <th>별점</th>
          <th>파일</th> 
          <th>업로드</th>
          <th>날짜</th>
          <th>기타</th>
          <th>조회</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
      
        <c:forEach var="vo" items="${list }">
          <tr>
            <td style='vertical-align: middle;'>${vo.gu_no}</td>
            <td style='vertical-align: middle;'>${vo.gu_area}</td>
            <td style='vertical-align: middle;'>${vo.gu_menu}</td>
           <td style='vertical-align: middle;'>
             <a href="./read.do?gu_no=${vo.gu_no}">${vo.gu_title}</a> </td>
            <td style='vertical-align: middle;'>${vo.gu_name}</td>
            
            <td style='vertical-align: middle;'>
            <c:choose>
            <c:when test="${vo.gu_stars == 1 }">
            <img src="../gurume/images/red1.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 2 }">
            <img src="../gurume/images/red2.png" width=20px>
            <img src="../gurume/images/red2.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 3 }">
            <img src="../gurume/images/red3.png"width=20px >
            <img src="../gurume/images/red3.png" width=20px>
            <img src="../gurume/images/red3.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 4 }">
            <img src="../gurume/images/red4.png" width=20px>
            <img src="../gurume/images/red4.png" width=20px>
            <img src="../gurume/images/red4.png" width=20px>
            <img src="../gurume/images/red4.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 5 }">
            <img src="../gurume/images/red5.png"width=20px >
            <img src="../gurume/images/red5.png" width=20px>
            <img src="../gurume/images/red5.png" width=20px>
            <img src="../gurume/images/red5.png" width=20px>
            <img src="../gurume/images/red5.png" width=20px>
            </c:when>
            </c:choose>
            </td>
            
       <%--     <c:choose>
                <c:when test="${vo.ansnum == 0 }">
                  <img src='../menu/images/url4.png' style='width: 14px;'>
                </c:when>
                <c:when test="${vo.ansnum > 0 }">
                  <c:forEach var="indent"  begin="1" end="${vo.indent }" step="1">
                       &nbsp;&nbsp;&nbsp;
                  </c:forEach>
                  <img src='../menu/images/reply3.jpg'>
                </c:when>
              </c:choose>  --%>
             <%--  <a href="./read.do?gu_no=${vo.gu_no}&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage}">${vo.gu_title}</a> 
            </td>  --%>
            <%-- <td style='vertical-align: middle;'>${vo.good}</td> --%>
           
            
            <td style='vertical-align: middle;'>
           <c:choose>
              <c:when test="${vo.file2 == null}"></c:when>
              <c:when test="${vo.file2 != null}">
                <c:set var='file2' value="${fn:toLowerCase(vo.file2)}" />
                <c:choose>
                   <c:when test="${fn:endsWith(vo.file2, '.txt')}">
                      <IMG src='../menu/images/textico.png'>
                      </A>
                   </c:when>
                   <c:when test="${fn:endsWith(vo.file2, '.zip')}">
                      <IMG src='../menu/images/zipico.png'>
                      </A>
                   </c:when>
                   <c:when test="${fn:endsWith(vo.file2, '.jpg')}">
                      <A href='${pageContext.request.contextPath}/download?dir=/gurume/storage&filename=${vo.file1}'>
                      <IMG src='./storage/${vo.file1}'>
                      </A>
                   </c:when>
                   <c:when test="${empty vo.file2}">
                   
                   </c:when>
                   <c:otherwise>
                     <%--  <A href='${pageContext.request.contextPath}/download?dir=/gurume/storage&filename=${vo.file1}'> --%>
                      <IMG src='../menu/images/fileico.png'>
                      </A>
                   </c:otherwise>
                </c:choose>
                </c:when>
            </c:choose>
            </td>
           
            <td style='vertical-align: middle;'>${vo.file2}</td>
            <td style='vertical-align: middle;'>${vo.gu_date}</td>
            <%-- <td style='vertical-align: middle;'>${vo.replycnt}</td> --%>
            <td style='vertical-align: middle;'>
              <a href="./update.do?gu_no=${vo.gu_no}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?gu_no=${vo.gu_no}<%-- &divisionno=${vo.divisionno} --%>"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
             <td style='vertical-align: middle;'>${vo.gu_cnt}</td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
  </div>
 
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