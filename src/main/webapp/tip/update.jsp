<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>취업준비</title>    

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
</head>
<section class="wrapper">
    <section class="page_head"> 
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list.do?tp_ch=${tp_ch}'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 자소서</i> 
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
    <DIV class='content' style='width: 100%;'>
      <FORM name='frm' method='POST' action='./update.do'
                  enctype="multipart/form-data">
        <input type='hidden' name='tp_no' value='${tipVO.tp_no}'>
        <input type='hidden' name='tp_ch' value='${tipVO.tp_ch}'>
        <h4><span>글쓰기</span></h4>  
         <fieldset>
          <table>
           <tbody>
            <tr>
              <th scope="row">
                <label class='form_grp' for='content'>제목</label></th>
              <td>  
                <input type='text' name='tp_title' value='${tipVO.tp_title}'>
              </td>
            </tr>
            <tr>
              <th scope="row">
               <label class='form_grp' for='content'>내용</label></th>
              <td> 
                <TEXTAREA name='tp_content' rows='10' cols='70'>${tipVO.tp_content}</TEXTAREA>
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
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 