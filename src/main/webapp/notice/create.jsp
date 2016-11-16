<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공지사항 등록</title>    
 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<style>
  strong {
    color : red;
  }
</style>
</head>

<section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 공지사항 등록</i> 
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
      <FORM name='frm' method='POST' action='./create.do'>
      <input type='hidden' name='me_no' value='1'>
      <h4><span>글쓰기</span></h4> 
       <fieldset>
        <table>
         <tbody>
          <tr>
            <th scope="row">
              <label>TOP 공지사항 여부 :</label></th>
              <td>
                YES &nbsp;<input type='radio' name='nt_nt' value="Y" required="required">
                NO &nbsp;<input type='radio' name='nt_nt' value="N" required="required">
               &nbsp;<strong> <i class="fa fa-check-square-o"></i> 공지사항 여부를 선택해주세요!</strong> 
              </td>
          </tr> 
          <tr>
            <th scope="row">
              <label for='nt_title'>제목</label></th>
             <td>
              <input type='text' name='nt_title' value='제목' size='68' required="required">
             </td>
          </tr>   
          <tr>
            <th scope="row">
              <label for='content'>내용</label></th>
              <td>
                <textarea name='nt_content' required="required" cols="70" rows="20" required="required"></textarea>
              </td>
            </tr>
           </tbody>
          </table>
        <div class='right'>
            <button type="submit" class="btn btn-default btn-xs">등록</button>
            <button type="button" class="btn btn-default btn-xs" onclick = "history.back()">취소</button>
        </div>         
        </fieldset>
      </FORM>
   </div>
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