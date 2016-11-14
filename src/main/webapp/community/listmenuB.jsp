<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <div class="list_menu"> 
    <span>관련글</span>
    <hr>
     <c:choose>
      <c:when test="${commuVO.cm_no == minlistB }">
        <a><span style='font-size: 12px;'><i class="fa fa-angle-up"></i> 이전글 </span></a><br>
      </c:when>     
      <c:otherwise>
        <span style='font-size: 12px; color:black;' ><A href='./read.do?cm_no=${ejun.cm_no}'>
        <i class="fa fa-angle-up"></i> 이전글 </A><A href='./read.do?cm_no=${ejun.cm_no}'>${ejun.cm_title}</A></span><br>
      </c:otherwise>
     </c:choose>
     
      <c:forEach var="vo" items="${listB }">
      <tr>
        <c:choose>
          <c:when test="${vo.ansnum == 0}">
            <td><span style='font-size: 12px; color:black;'>&nbsp;&nbsp;&nbsp;&nbsp;본글&nbsp;&nbsp;</span></td>
          </c:when>  
          <c:otherwise>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <td><span style='font-size: 12px; color:black;'><a style='color: pink;'> Re:</a></span></td>
          </c:otherwise>      
        </c:choose>
            <td><A href='./read.do?cm_no=${vo.cm_no }'> ${fn:substring(vo.cm_title,0,10)}</A></td>
            <td><span style='font-size: 12px; color: gray;'>${fn:substring(vo.cm_date,0,16)}</span></td>
      </tr><br>
      </c:forEach>     
      
     <c:choose>
      <c:when test="${commuVO.cm_no == maxlistB }">
        <a><span style='font-size: 12px;'><i class="fa fa-angle-down"></i> 다음글 </span></a><br>
      </c:when>     
      <c:otherwise>
        <span style='font-size: 12px; color:black;'><A href='./read.do?cm_no=${daum.cm_no}'>
        <i class="fa fa-angle-down"></i> 다음글 </A><A href='./read.do?cm_no=${daum.cm_no}'>${daum.cm_title}</A></span><br> 
      </c:otherwise>
     </c:choose>
    </div>   
 