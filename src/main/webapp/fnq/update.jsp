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
                                <li>
                                 <c:choose>
                                    <c:when test="${fnqVO.fq_CH eq 'H'}">
                                      <A href='../fnq/listh.do'>목록</A> > 
                                    </c:when>
                                    <c:when test="${fnqVO.fq_CH eq 'C'}">
                                      <A href='../fnq/listc.do'>목록</A> > 
                                    </c:when>
                                  </c:choose>
                                </li>
                                <i class="fa fa-arrow-circle-right"> FnQ</i>
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

     <div id="formcon">
        <FORM name='frm' method='POST' action='./update.do'
                    enctype="multipart/form-data">
          <input type='hidden' name='fq_no' value='${fnqVO.fq_no}'>
          <input type='hidden' name='me_no' value='1'>
          <input type='hidden' name='fq_CH' value='${fnqVO.fq_CH}'>
        <h4><span>글 수 정</span></h4>  
         <fieldset>
          <table>
           <tbody>
            <tr>
              <th scope="row">          
                <label class='form_grp' for='content'>질문</label></th>
                <td>
                 <TEXTAREA name='fq_question' rows='10' cols='70'>${fnqVO.fq_question}</TEXTAREA>
                </td>
            </tr>   
            <tr>
              <th scope="row">
                <label class='form_grp' for='content'>답변</label></th>
                <td>
                  <TEXTAREA name='fq_answer' rows='10' cols='70'>${fnqVO.fq_answer}</TEXTAREA>
                </td>
            </tr>      
           </tbody>
          </table>
         </fieldset>
        <div class='right'>
          <button type="submit" class="btn btn-default btn-xs">수정</button>
          <button type="button" class="btn btn-default btn-xs" onclick="history.back()">취소</button>
        </div>         
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