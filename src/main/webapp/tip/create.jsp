<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>자기소개서</title>    
 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<style>
  strong {
    color : red;
  }
</style>
<script>
window.onload=function(){
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
}; 

// content: textarea name
if (CKEDITOR.instances['content'].getData() == '') {
  window.alert('내용을 입력해 주세요.');
  CKEDITOR.instances['content'].focus();
  return false;
}  
</script>
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
                                <i class="fa fa-arrow-circle-right"> ${ch }</i>
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
        <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
          <h4><span>글쓰기</span></h4>  
           <fieldset>
            <table>
             <tbody>
              <tr>
                <th scope="row">
                 <label class='form_grp' for='content'>선택</label></th>
                <td> 
                  <input type='radio' name='tp_ch' value='A'>자소서
                  <input type='radio' name='tp_ch' value='I'>면접
                  &nbsp;<strong> <i class="fa fa-check-square-o"></i> 카테고리를 선택해주세요!</strong>
                </td>
              </tr>    
              <tr>
                <th scope="row">
                 <label>제목</label></th>
                <td> 
                  <input name='tp_title'>
                </td>
              </tr>     
              <tr>
                <th scope="row">
                 <label class='form_grp' for='content'>내용</label></th>
                <td>
                 <TEXTAREA name='tp_content' id='content' rows='10' cols='70'></TEXTAREA>
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