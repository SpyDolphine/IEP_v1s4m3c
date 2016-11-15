<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
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

#formcon strong {
  color: red;
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
</head>
 
<section class="wrapper">
  <section class="page_head">
      <div class="container">
           <div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12">
                      <nav id="breadcrumbs">
                          <ul>
                              <li><a href="../index.jsp">Home</a>/</li>
                              <c:choose>
                                <c:when test="${commuVO.cm_ch eq 'A'}">
                                  <li><A href='./listA.do'>목록</A></li>
                                </c:when>
                                <c:when test="${commuVO.cm_ch eq 'B'}">
                                  <li><A href='./listB.do'>목록</A></li>
                                </c:when>
                                <c:when test="${commuVO.cm_ch eq 'C'}">
                                  <li><A href='./listC.do'>목록</A></li>
                                </c:when>                                
                              </c:choose>
                              <i class="fa fa-arrow-circle-right"> 글 쓰 기</i> 
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
                <label for='cm_ch'>카테고리</label></th>
                <td>
                  <select name='cm_ch' id='cm_ch' required>
                     <option value="">선택</option>
                     <option value="A">정모방</option>
                     <option value="B">정보공유방</option>
                     <option value="C">상담/공감방</option>           
                  </select>
                  <strong><i class="fa fa-check-square-o"></i> 꼭 선택해주세요!</strong>
                </td>
              </tr>
              <tr>
                 <th scope="row">
                 <label for='cm_title'>제목</label></th>
                 <td><input type='text' name='cm_title' id='cm_title' size='60' required="required" placeholder="제목을 입력해주세요"></td>  
              </tr>
              <tr>
                 <th scope="row">
                 <label for='cm_nick'>닉네임</label></th>
                 <td><input type='text' name='cm_nick' id='cm_nick' value='복덩이' size='60' required="required"></td>  
              </tr>  
              <tr>
                <th scope="row">
                 <label for='cm_content'>내용</label></th>
                 <td>
                 <textarea name='cm_content' id='cm_content'  rows='5' cols='70' placeholder="내용을 입력해주세요"></textarea>
                 </td> 
              </tr>               
              <tr>
                 <th scope="row">
                 <label for='file1'>Thumb 파일</label> 
                 <td>Preview(미리보기) 이미지 자동 생성됩니다.</td>
              </tr>  
              <tr>
                 <th scope="row">
                 <label for='file2'>업로드 파일</label></th>
                 <td><input type="file" name='file2MF' id='file2MF' size='40' ></td>  
              </tr>             
              <tr>
               <th scope="row">
                <label for='cm_map'>지도</label></th>
               <td>
                 <textarea name='cm_map' id='cm_map'  rows='5' cols='70' placeholder="지도 URL을 입력해주세요"></textarea>
               </td>
              </tr>
              <tr>
               <th scope="row">
                <label for='cm_url'>url</label></th>
               <td>
                 <input type='text' name='cm_url' id='cm_url'size='60' placeholder="출처 주소를 입력해주세요">
               </td>
              </tr>              
             </tbody>
            </table>
          <div class='right'>
            <button type="submit">등록</button>
            <button type="button" onclick = "history.back()">취소</button>
          </div>
           </fieldset>
          </FORM>
          </div>
      </div></div></div>
</body>
<!-- -------------------------------------------- -->
<div style= 'margin: 100px 0 0 0;  position: relative;'>  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>       
<!-- -------------------------------------------- -->
</html> 