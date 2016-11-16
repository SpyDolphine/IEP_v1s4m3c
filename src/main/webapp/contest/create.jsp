<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공모전 등록</title>   
 
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('ct_content');  // <TEXTAREA>태그 id 값
  };
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
                                <li><A href='./list.do'>목록</A></li>   
                                <li class="fa fa-arrow-circle-right"> 공모전</li> 
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
    <FORM name='frm' method='POST' action='./create.do'  enctype="multipart/form-data">
      <input type='hidden' name='me_no' id='me_no' value='${sessionScope.me_no }'>${sessionScope.me_no }
      <h3><span>공모전 등록</span></h3>
       <fieldset>
        <table>
         <tbody>
          <tr>
           <th scope="row">      
             <label for="ct_title" class="">공모전 <br>명칭</label></th>
               <td>              
                 <input type='text' class="form-control" name='ct_title' id='ct_title' value='소프트웨어 프로그램 공모전' required="required">
               </td>
          </tr>  
          <tr>
           <th scope="row">           
            <label for="ct_host" class="">주최</label></th>
             <td>  
              <input type='text' class="form-control" name='ct_host' id='ct_host' value='한국 솔데스크 연맹' required="required">
             </td>
          </tr>
          <tr>
           <th scope="row">              
             <label for="ct_supervision" class="">주관</label></th>
              <td> 
               <input type='text' class="form-control" name='ct_supervision' id='ct_supervision' value='솔데스크 학원' required="required">
              </td>
          </tr>  
          <tr>
           <th scope="row"> 
             <label for="ct_entry" class="">참가자격</label></th>
            <td>  
              <input type='text' class="form-control" name='ct_entry' id='ct_entry' value='솔데스크 학생 전원' required="required">
            </td>
          </tr> 
          <tr>
           <th scope="row">           
            <label for="ct_enter" class="">접수 방법</label></th>
             <td> 
               <input type='text' class="form-control" name='ct_enter' id='ct_enter' value='홈페이지 접수' required="required">
             </td>
          </tr>   
          <tr>
           <th scope="row"> 
             <label for="ct_award" class="">시상 자격</label></th>
              <td>
                <input type='text' class="form-control" name='ct_award' id='ct_award' value='현재 개발 하고자 하는 분야 맞게 심사' required="required">
              </td>
           </tr>   
          <tr>
           <th scope="row"> 
             <label for="ct_startdate" class="">접수 시작일</label></th>
            <td>  
              <input type='datetime-local' class="form-control" name='ct_startdate' id='ct_startdate' >
            </td>
          </tr>    
          <tr>
           <th scope="row"> 
            <label for="ct_enddate" class="">접수 마감일</label></th>
              <td>
                <input type="datetime-local" class="form-control" name='ct_enddate' id='ct_enddate' >
              </td>
          </tr>     
          <tr>
           <th scope="row"> 
            <label for="ct_daydate" class="">공모 당일</label></th>
            <td> 
              <input type="datetime-local" class="form-control" name='ct_daydate' id='ct_daydate' >
            </td>
          </tr>    
          <tr>
           <th scope="row"> 
            <label for="ct_statedate" class="">발표일자</label></th>
             <td>
              <input type='datetime-local' class="form-control" name='ct_statedate' id='ct_statedate' >
             </td>
           </tr>   
          <tr>
           <th scope="row"> 
            <label for="ct_url" class="">관련페이지</label></th>
             <td>
              <input type="url" class="form-control" name='ct_url' id='ct_url' value='http://' required="required">
             </td>
           </tr>   
          <tr>
           <th scope="row">           
            <label for="ct_content" class="">공모 <br>상세 정보</label></th>
             <td>
              <textarea class="form-control" name='ct_content' id='ct_content'  rows='10' cols='60'>미시령 단풍</textarea>
             </td>
          </tr>
          <tr>
           <th scope="row"> 
             <label for="file2MF" class="">공모전 포스터</label></th>
             <td>
              <input type="file" class="form-control" name='file2MF' id='file2MF'>
              <br>
              Preview(미리보기) 이미지 자동 생성됩니다.
             </td>
          </tr>
         </tbody>
        </table>
       </fieldset>
               
      <div class='right'>
        <button type="submit" class="btn btn-info btn-sm">등록</button>
        <button type="button" class="btn btn-default btn-sm" onclick="javascript:history.back()">취소</button>
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
 
</html> 