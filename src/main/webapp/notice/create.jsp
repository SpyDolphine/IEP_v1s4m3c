<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공지사항 등록</title>    
 
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
                                <i class="fa fa-arrow-circle-right">공지사항 등록</i> 
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
      <FORM name='frm' method='POST' action='./create.do'>
      <input type='hidden' name='me_no' value='1'>
        <fieldset>
          <ul>
            <li>
              <labelfor='content'>공지사항 여부 :</label>
              YES &nbsp;<input type='radio' name='nt_nt' value="Y">
              NO &nbsp;<input type='radio' name='nt_nt' value="N">
            </li>
            <li>
              <labelfor='nt_title'>제목</label>
              <input type='text' name='nt_title' value='제목' required="required">
            </li>
            <li>
              <labelfor='content'>내용</label>
              <textarea name='nt_content' required="required" cols="100" rows="10"></textarea>
            </li>
            <li class='right'>
              <button type="submit">등록</button>
              <button type="button" onclick="location.href='./list.do'">목록</button>
            </li>         
          </ul>
        </fieldset>
      </FORM>
   </div>
 </div>
</div>
</body>

 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
<!-- -------------------------------------------- -->
</html> 