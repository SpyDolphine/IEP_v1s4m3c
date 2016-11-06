<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" data-name="skins">
<link rel="stylesheet" href="../css/layout/wide.css" data-name="layout">
<link rel="stylesheet" href="../css/fractionslider.css"/>
<link rel="stylesheet" href="../css/style-fraction.css"/>
<link rel="stylesheet" href="../css/animate.css"/> 


<H3><i class="fa fa-check-circle"></i> 선택해주세용~~~</h3>

<FORM name='form_grp' method='POST' action='../servey/vote.do' >
  <c:forEach var="serveyVO" items="${list}">
      <label>
        <input type='radio' name='serveyno'  id='serveyno' value='${serveyVO.serveyno}' 
           ${serveyVO.serveyno == serveyVO.serveyno?"checked='checked'":""}>
        ${serveyVO.item}
      </label>
      <a href="../servey/delete.do?serveyno=${serveyVO.serveyno}" onclick="return confirm('항목을 삭제 하시겠습니까?')">&nbsp;<i class="fa fa-trash-o"></i></a>
      <br>
  </c:forEach>
  <div class='left'>
   <button type="submit" class="btn btn-info btn-sm btn-block" >투표</button>
  </div>
</FORM>