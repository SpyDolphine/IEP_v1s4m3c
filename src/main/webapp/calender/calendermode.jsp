<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ page import="java.util.Calendar, java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="web.tool.Tool" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>일정 </title>    
 
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
                                <li class="fa fa-arrow-circle-right"> 달력모드 </li>  
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
   
<%
    Calendar cal = Calendar.getInstance();
  
  // "y" = 연도 / "m" =월
    int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
    int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);

    // 시작요일 확인
    // - Calendar MONTH는 0-11까지임
    cal.set(year, month, 1);
    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

    // 다음/이전월 계산
    // - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
    int prevYear = year;
    int prevMonth = (month + 1) - 1;
    int nextYear = year;
    int nextMonth = (month  + 1) + 1;

    // 1월인 경우 이전년 12월로 지정
    if (prevMonth < 1) {
        prevYear--;
        prevMonth = 12;
    }

    // 12월인 경우 다음년 1월로 지정
    if (nextMonth > 12) {
        nextYear++;
        nextMonth = 1;
    }
%>
  <table border="0" cellpadding="0" cellspacing="0" width="80%" align='center'>
    <tr>
      <td align="center">
        <!--  이전 년월 -->
        <a href="./calendermode.jsp?y=<%=prevYear%>&m=<%=prevMonth%>">◁</a>
        <%=year%>년  <%=month+1%>월
        <!--  다음 년월 --> 
        <a href="./calendermode.jsp?y=<%=nextYear%>&m=<%=nextMonth%>">▷</a>
      </td>
    </tr>
    <tr>
      <td>

        <table border="1" cellpadding="0" cellspacing="0" width='100%' height='250px' align='center'>
          <tr>
            <td width='14%' align='center'>일</td>
            <td width='14%' align='center'>월</td>
            <td width='14%' align='center'>화</td>
            <td width='14%' align='center'>수</td>
            <td width='14%' align='center'>목</td>
            <td width='14%' align='center'>금</td>
            <td width='16%' align='center'>토</td>
          </tr>
          <tr height='14%'>
            <%
    // 시작요일까지 이동
    for (int i=1; i<bgnWeek; i++){
      out.println("<td>&nbsp;</td>");
    }

    // 첫날~마지막날까지 처리
    // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
    while (cal.get(Calendar.MONTH) == month) {
        
      if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
        out.println("<td valign='top'><span style='color:blue;'>" + cal.get(Calendar.DATE) + "</span></td>");
      }else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY){
        out.println("<td valign='top'><span style='color:red;'>" + cal.get(Calendar.DATE) + "</span></td>");
      }else{
        out.println("<td valign='top'>" + cal.get(Calendar.DATE) + "</td>");
      }
      // 토요일인 경우 다음줄로 생성
      if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
        out.println("</tr><tr>");
      }

      // 날짜 증가시키기
      cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
    }

    // 끝날부터 토요일까지 빈칸으로 처리
    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) out.println("<td>&nbsp;</td>");
%>
          </tr>
        </table>

      </td>
    </tr>
  </table>
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