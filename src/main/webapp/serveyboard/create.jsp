<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>설문조사</title>    
 
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
                                <i class="fa fa-arrow-circle-right"> 설문조사</i> 
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
      <FORM name='form_grp' method='POST' action='./create.do'>
      <h4><span>설문조사 글쓰기</span></h4>  
       <fieldset>
        <table>
         <tbody>
          <tr>
            <th scope="row">
              <label class='form_grp' >설문조사 제목</label></th>
             <td> 
              <input type='text' name='title' placeholder='오늘의 설문조사 주제를 입력해주세요' size='68' required="required">
             </td>
          </tr>    
          <tr>
            <th scope="row">
              <label class='form_grp'>설문 내용</label></th>
              <td> 
               <TEXTAREA name='content' rows='10' cols='70' placeholder='설문조사 관련 설명을 입력해주세요'></TEXTAREA>
              </td>
          </tr>  
         </tbody>
        </table>
      </fieldset>
      <div class='right'>
        <button type="submit" class="btn btn-default btn-xs">등록</button>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./list.do'">목록</button>
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