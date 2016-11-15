<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%
 String root = request.getContextPath();
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>★★★ 각 게시판 이름을 적어주세요 ! </title>    
 <script type="text/javascript">
function scrapDeletePop(sp_no) {
  var winObject = null;
  var settings = "width=400, height=400";
  winObject = window.open("./delete.do?sp_no="+sp_no,"",settings);
   
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
                                <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 ! 
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
<TABLE class='table' style="width: 80%; text-align: center">
  <caption>${sessionScope.me_nick }님 환영합니다. </caption>
  <colgroup>
    <col style='width: 30%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>제목</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
 
<c:forEach var= "vo" items="${list }">
  <input type="hidden" id="sp_no" name="sp_no" value="${vo.sp_no }">
  <TR>
    <TD class='td'><A href='${vo.sp_content }'>${vo.sp_title}</A></TD>
    <TD class='td'>${vo.sp_date.substring(0, 10) }</TD>
    <td class="td">
     <A onclick = "javascript:scrapDeletePop('${vo.sp_no}')">삭제</A>
    </td>
    </TR>
</c:forEach>
 
</TABLE>
 </div>
<DIV class='bottom'>
  <button type='button' onclick="location.href='<%=root%>/index.do'">홈으로</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
  </div>
 </div>
</div>
<DIV class='bottom'>${paging}</DIV>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 