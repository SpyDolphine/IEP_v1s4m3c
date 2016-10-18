<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
String root = request.getContextPath();
// out.println("root: " + root);
%>
<!-- 화면 상단 메뉴 --> 
   <header>
   <div style='text-align: left; font-size:1.5em '>IEP v0.1</div>
     <NAV class='top_menu_list'>
        <A class='menu_link' href='<%=root %>/index.jsp'>HOME</A> |
          <a class='menu_link' href='<%=root %>/category/list.do'>코드</a> |
          <a class='menu_link' href='<%=root %>/division/list.do'>카테고리</a> |
          <a class='menu_link' href='<%=root %>/member/list.do'>회원 목록</a> |
          <a class='menu_link' href='<%=root %>/blog/list_total.do'>블로그</a> |
      </NAV>
   </header>