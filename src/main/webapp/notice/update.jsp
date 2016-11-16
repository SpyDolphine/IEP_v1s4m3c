<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>공지사항 수정</title>    
 
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
                                <i class="fa fa-arrow-circle-right"> 공지사항 수정</i> 
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
        <input type='hidden' name='nt_no' value='${noticeVO.nt_no}'><!-- 현재 글 번호 -->
        <input type='hidden' name='me_no' value='1'><!-- 현재 접속한 유저의 번호 -->
        <h4><span>글 수 정</span></h4> 
         <fieldset>
          <table>
           <tbody>
            <tr>
              <th scope="row">
               <label for='content'>공지사항 여부 :</label></th>
              <td>  
                <c:choose>
                  <c:when test="${noticeVO.nt_nt eq 'Y'}">
                  YES &nbsp;<input type='radio' name='nt_nt' value="Y"  checked>
                  NO &nbsp;<input type='radio' name='nt_nt' value="N" >
                  </c:when>
                  <c:when test="${noticeVO.nt_nt eq 'N'}">
                  YES &nbsp;<input type='radio' name='nt_nt' value="Y"  >
                  NO &nbsp;<input type='radio' name='nt_nt' value="N" checked>
                  </c:when>
                </c:choose>
               </td>
             </tr>   
            <tr>
              <th scope="row">
                <label class='form_grp' for='title'>제목</label></th>
              <td>
                <input type='text' name='nt_title' value='${noticeVO.nt_title}' size='68' required="required">
              </td>
            </tr>    
            <tr>
              <th scope="row">
                <label class='form_grp' for='content'>내용</label></th>
                <td>
                 <TEXTAREA name='nt_content' cols="70" rows="20">${noticeVO.nt_content}</TEXTAREA>
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