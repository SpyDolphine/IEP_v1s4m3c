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
<title>나의 스크랩함</title> 

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->   
<script type="text/javascript">
function scrapDeletePop(sp_no) {
  var winObject = null;
  var settings = "width=600, height=300, left=600px,top=400px";
  winObject = window.open("./delete.do?sp_no="+sp_no,"",settings);
   
}
</script>
</head>

<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a></li>
                                <i class="fa fa-arrow-circle-right"> 나의 스크랩함</i> 
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
   <DIV class='title'>스크랩 목록</DIV> 
   <br>
 <div>
    <TABLE class='table' style="width: 80%;">
      <caption>${sessionScope.me_nick }님 환영합니다. </caption>
      <TR>
        <TH style='width: 70%; text-align: center;'>제목</TH>
        <TH style='width: 20%; text-align: center;'>등록일</TH>
        <TH style='width: 10%; text-align: center;'>기타</TH>
      </TR>
 
      <c:forEach var= "vo" items="${list }">
        <input type="hidden" id="sp_no" name="sp_no" value="${vo.sp_no }">
        <TR>
          <TD class='td' id='boardtitle'><A href='${vo.sp_content }'>${vo.sp_title}</A></TD>
          <TD style='text-align: center;' class='td'>${vo.sp_date.substring(0, 10) }</TD>
          <td style='text-align: center;' class="td">
           <A onclick = "javascript:scrapDeletePop('${vo.sp_no}')">삭제</A>
          </td>
          </TR>
      </c:forEach>
     </TABLE>
    </div>
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