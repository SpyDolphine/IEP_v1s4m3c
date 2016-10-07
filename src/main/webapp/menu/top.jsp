<%@ page contentType="text/html; charset=UTF-8" %>

<%
String root = request.getContextPath();
// out.println("root: " + root);
%>
 
<!-- 화면 상단 메뉴 --> 
<DIV id='top_menu' style="background-image: url('<%=root %>/menu/images/top_image.jpg'); background-size:100%" >
  <NAV class='top_menu_list'>
    <A class='menu_link' href='<%=root %>/index.jsp'>HOME</A> |
    
    <%
    if (session.getAttribute("id") == null){ // 회원 로그인 여부 검사
    %>
      <a class='menu_link' href='<%=root %>/member/login.do'>로그인</a> |
    <%     
    } else {
    %>
      <a class='menu_link' href='<%=root %>/member/logout.do'>${id } 로그 아웃</a> |      
    <%
    }
    %>    
        
    <A class='menu_link'  href='<%=root %>/noticev3/list.jsp'>공지사항</A> |
    <A class='menu_link'  href='<%=root %>/urlv2/list.jsp'>여행 URL</A> |
    <A class='menu_link'  href='<%=root %>/pdsv3/list.jsp'>Gallery</A> |
    <A class='menu_link'  href='#'>여행 일정</A> |
    <A class='menu_link'  href='http://172.16.1.102:9090/blog_v1jq/index.jsp'>Soldesk</A> |
 
    <%
    if (session.getAttribute("act") == null){
    %>
      <a class='menu_link' href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a> |
    <%
    }else{
    %>
      <a class='menu_link' href='<%=root %>/admin1/logout_proc.jsp'>Logout</a> |
      <a class='menu_link' href='<%=root %>/admin1/list.jsp'>관리자 목록</a>
    <%
    }
    %>
      <a class='menu_link' href='<%=root %>/notice/list.do'>공지사항</a>
  
  </NAV>
</DIV>