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
                                <li><a href="../index.jsp">Home </a>/</li>
                                <li><A href='./listh.do'>홈페이지 질문 목록 </A>/</li>   
                                <li><A href='./listc.do'>회사 질문 목록</A></li>   
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
        <FORM name='frm' method='POST' action='./create.do'
                    enctype="multipart/form-data">
          <input type='hidden' name='me_no' value='1'>
            <!-- <input type='hidden' name='me_no' value='${me_no}'>  -->
            <!-- 회원정보를 읽어와야하지만 아직 그렇지 못해서 선택해야합니다 -->
        
          <h4><span>글쓰기</span></h4>
           <fieldset>
            <table>
             <tbody>
              <tr>
                <th scope="row">
                 <label class='form_grp' for='content' >선택</label></th>
                 <td> 
                  <input type='radio' name='fq_CH' value='H' required="required"> 홈페이지 &nbsp;
                  <input type='radio' name='fq_CH' value='C' required="required"> 회사
                 </td>
              </tr>
              <tr>
                <th scope="row">                
                 <label class='form_grp' for='content'>질문</label></th>
                 <td>
                  <TEXTAREA name='fq_question' rows='10' cols='70' required="required"></TEXTAREA>
                 </td>
              </tr>   
              <tr>
                <th scope="row">  
                 <label class='form_grp' for='content'>답변</label></th>
                 <td> 
                  <TEXTAREA name='fq_answer' rows='10' cols='70' required="required"></TEXTAREA>
                 </td>
              </tr>    
             </tbody>
            </table>
           </fieldset>
          
          <div class='right'>
            <button type="submit" class="btn btn-default btn-xs">등록</button>
            <button type="button" class="btn btn-default btn-xs" onclick = "history.back()">취소</button>
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