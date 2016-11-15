<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>STUDY</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
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
<script>
  window.onload = function() {
    CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
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
              <li><A href='./list.do?gate=AJ'>목록</A></li>
              <i class="fa fa-arrow-circle-right"> STUDY 글쓰기</i>
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

          <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
          <input type='hidden' name='gate' value='${gate}'>
            
          <h4><span>글쓰기</span></h4>           
          <div id="formcon">
           <fieldset>
            <table>
             <tbody>
              <tr>
                 <th scope="row">
                 <label for="title">과목 제목</label></th>
                 <td><input type="text" name="title" id="title" style='width: 95%;'/></td>  
              </tr>
              <tr>
                <th scope="row">
                 <label for="content">과목 내용</label></th>
                 <td>
                 <textarea name="content" id="content" rows="20" cols="70"></textarea>
                 </td> 
              </tr>
              <tr>
               <th scope="row">
                <label for="file2MF">사진을 올려주세요</label></th>
               <td>
                 <input type="file" name='file2MF' id='file2MF' size='40'>
               </td>
              </tr>
             </tbody>
            </table>
          <div class='right'>
            <button type="submit" class="btn btn-default btn-xs">등록</button>
            <button type="button" class="btn btn-default btn-xs" onclick = "history.back()">취소</button>
          </div>
           </fieldset>
          </div>
          </FORM>
        </DIV>
      </div>
    </div>
</body>

<!-- -------------------------------------------- -->
<div style='margin: 100px 0 0 0; position: relative;'>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html>
