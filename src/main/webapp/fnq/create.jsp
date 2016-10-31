<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>FnQ</title>    
 
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
                                <i class="fa fa-arrow-circle-right">FnQ</i>
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
        <div class='content_menu' style='width: 100%;'>
          <A href='./list.do'>목록</A> > 
          <A href="javascript:location.reload();">새로고침</A>
        </div>
        
      <DIV class='content' style='width: 100%;'>
        <FORM name='frm' method='POST' action='./create.do'
                    enctype="multipart/form-data">
          <input type='hidden' name='me_no' value='1'>
            <!-- <input type='hidden' name='me_no' value='${me_no}'>  -->
            <ul>
            <li>
              <!-- 회원정보를 읽어와야하지만 아직 그렇지 못해서 선택해야합니다 -->
              <label class='form_grp' for='content'>선택</label><br>
              <input type='radio' name='fq_CH' value='C'>회사
              <input type='radio' name='fq_CH' value='H'>홈페이지
            </li>
            <li>
              <label class='form_grp' for='content'>질문</label><br>
              <TEXTAREA name='fq_question' rows='10' cols='70'></TEXTAREA>
            </li>
            <li>
              <label class='form_grp' for='content'>답변</label><br>
              <TEXTAREA name='fq_answer' rows='10' cols='70'></TEXTAREA>
            </li>
            <li class='right'>
              <button type="submit">등록</button>
              <button type="button" onclick="location.href='./list.do'">취소</button>
            </li>         
          </ul>
        </FORM>
      </DIV>
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