<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.memberEx.MemberExVO" %>
  <%
  String root = request.getContextPath();
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>회원 목록</title>    
 
</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
function memberin(me_no) {
  var winObject = null;
  var settings = "width=600, height=300, left=600px,top=400px";
  winObject = window.open("././memberin.do?me_no="+me_no,"",settings);
   
}
</script>
<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./memberlist.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 회원 관리목록 </i> 
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
   
  <DIV class='title'>회원 목록</DIV>
  <div>
    <TABLE class='table' style="width: 90%;">
    <caption>최고 관리자님 환영합니다..</caption>
      <TR>
        <TH style='width: 5%; text-align: center;'>번호</TH>
        <TH style='width: 10%; text-align: center;'>아이디</TH>
        <TH style='width: 10%; text-align: center;'>성명</TH>
        <TH style='width: 10%; text-align: center;'>닉네임</TH>
        <TH style='width: 20%; text-align: center;'>주소</TH>
        <TH style='width: 15%; text-align: center;'>등록일</TH>
        <TH style='width: 10%; text-align: center;'>탈퇴여부</TH>
        <TH style='width: 10%; text-align: center;'>권한</TH>
        <TH style='width: 10%; text-align: center;'>기타</TH>
      </TR>
 
    <c:forEach var= "vo" items="${memberlist }">
      <TR>
        <TD style='text-align: center;'>${vo.me_no }</TD>
        <TD class='td'><A href="./read.do?me_no=${vo.me_no }">${vo.me_id}</A></TD>
        <TD style='text-align: center;'><A href="./read.do?me_no=${vo.me_no }">${vo.me_name} </A></TD>
        <TD style='text-align: center;'>${vo.me_nick } </TD>
        <TD class='td'>
         <c:choose>
            <c:when test="${vo.me_addr1.length() > 15 }">
             ${vo.me_addr1.substring(0,15) }...
            </c:when>
            <c:otherwise>
            ${vo.me_addr1 }
            </c:otherwise>
         </c:choose>
        </TD>
    
    <TD style='text-align: center;'>${vo.me_date.substring(0, 10) }</TD>
    <td style='text-align: center;'>
    <c:choose>
      <c:when test="${vo.me_vis eq 'y' }">
      회원
      </c:when>
      <c:when test="${vo.me_vis eq 'n' }">
      탈퇴회원
      </c:when>
    </c:choose>
    </td>
    <TD style='text-align: center;'>
       <c:choose>
          <c:when test="${vo.me_grade eq 'A' }"> 
            최고 관리자
          </c:when>
           <c:when test="${vo.me_grade eq 'C' }"> 
            기업회원
          </c:when>
          <c:when test="${vo.me_grade eq 'M' }"> 
            일반회원
          </c:when>
        </c:choose>
    </TD>

    <td style='text-align: center;'>
     <A href="./read.do?me_no=${vo.me_no }">수정</A>
     <c:choose>
      <c:when test="${vo.me_vis eq 'y' }">
       <A href='./memberout.do?me_no=${vo.me_no}'>탈퇴</A>
      </c:when>
      <c:when test="${vo.me_vis eq 'n' }">
       <%-- <A href="./memberin.do?me_no=${vo.me_no}">복귀</A> --%>
       <A onclick = "javascript:memberin('${vo.me_no}')">복귀</A> 
      </c:when>
    </c:choose>
    </td>
  </TR>
</c:forEach>
 
  </TABLE>
 </div>
</DIV>
  </div>
 </div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 