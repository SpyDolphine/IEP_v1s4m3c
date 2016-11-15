<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>STUDY</title>    
 
<style type="text/css">

#formcon {
  width: 60%;
}

#formcon h3 {
  padding: 0 0 10px 0;
  font-weight: bold
}

#formcon p {
  padding: 0 0 20px 0
}

#formcon table {
  width: 100%;
  border-top: 2px solid #000099;
  border-bottom: 2px solid #000099;
  border-spacing: 0
}

#formcon td {
  border-bottom: 1px solid #333;
  padding: 10px 0 10px 10px
}

#formcon th {
  border-bottom: 1px solid #333;
  padding: 10px 0 10px 10px;
  background: #ffffff;
  text-align: left
}

#formcon input {
  border: 1px solid #000099;
  color: black;
  padding: 1px
}

#formcon .input_btn input {
  border: 0;
  vertical-align: middle;
  margin-top: 5px
}
</style>
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
                                <li><A href='../STUDY/list.do?gate=${studyVO.gate}'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right">STUDY</i> 
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
      
      <FORM name='frm' method='POST' action='./update.do' enctype="multipart/form-data">
        <input type='hidden' name='sy_no' value='${studyVO.sy_no}'>
        <input type='hidden' name='gate' value='${studyVO.gate}'>
        
        <h4><span>수 정</span></h4>           
        <div id="formcon">     
         <fieldset>   
         <table>
           <tbody>
            <tr>         
              <th scope="row">
              <label class='form_grp' for='content'>과목 제목</label></th>
              <td><TEXTAREA name='title' rows='2' cols='70'>${studyVO.title}</TEXTAREA></td>
            </tr>
            <tr>         
              <th scope="row">          
              <label class='form_grp' for='content'>과목 내용</label></th>
              <td><TEXTAREA name='content' rows='20' cols='70'>${studyVO.content}</TEXTAREA></td>
            </tr>
            <tr>         
              <th scope="row">
              <label class='form_grp' for='file2'>등록된 파일</label></th>
              <td>
              <c:set var='file2' value="${fn:toLowerCase(studyVO.file2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(file2, '.jpg')}">
                    <IMG src='./storage/${studyVO.file1}'>
                  </c:when>
                  <c:when test="${fn:endsWith(file2, '.gif')}">
                    <IMG id='file2'  src='./storage/${studyVO.file1}'>
                  </c:when>
                  <c:when test="${fn:endsWith(file2, '.png')}">
                    <IMG id='file2'  src='./storage/${studyVO.file1}'>
                  </c:when>
                  <c:when test="${studyVO.file2.length() > 0}">
                    ${studyVO.file1 } 
                  </c:when>
                </c:choose>
              </td>  
            <tr>         
              <th scope="row">
               <label for='file2'>업로드 파일</label></th>
               <td>
                <input type="file" name='file2MF' id='file2MF' size='40' >
               </td>
            </tr>
           </tbody>
         </table>  
          
         <div class='right'>
            <button type="submit" class="btn btn-default btn-xs">등록</button>
            <button type="button" class="btn btn-default btn-xs" onclick="location.href='../STUDY/list.do?gate=${studyVO.gate}'">취소</button>
         </div>
        
        </fieldset>
        </div>
      </FORM>
    </DIV>
   </div>
</div>
</body>

<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
</html> 