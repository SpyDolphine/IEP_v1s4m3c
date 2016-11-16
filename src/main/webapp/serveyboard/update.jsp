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
<script type="text/javascript">
// iframe resize
function autoResize(i)
{
    var iframeHeight=
    (i).contentWindow.document.body.scrollHeight;
    (i).height=iframeHeight+20;
}
</script>
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
        <FORM name='form_grp' method='POST' action='./update.do'>
          <input type='hidden' name='sb_no' id='sb_no' value='${serveyboardVO.sb_no}'>
          <h4><span>설 문 조 사  수 정</span></h4>  
           <fieldset>
            <table>
             <tbody>
              <tr>
                <th scope="row">
                  <label class='form_grp' for='title'>제목</label></th>
                 <td> 
                  <input type='text' name='title' value='${serveyboardVO.title}' size='68' required="required">
                 </td>
              </tr>   
              <tr>
                <th scope="row">
                  <label class='form_grp' for='content'>내용</label></th>
                 <td> 
                   <TEXTAREA name='content' rows='10' cols='70'>${serveyboardVO.content}</TEXTAREA>
                 </td>
              </tr>
              <tr>
                <th scope="row"></th>
                <td>  
                 <iframe src="../servey/list.do?sb_no=${serveyboardVO.sb_no}" onload="autoResize(this)" scrolling="no" frameborder="0"></iframe> 
                </td>
              </tr>
            </tbody>
           </table>         
          </fieldset>
          <div class='right'>
            <button type="submit" class="btn btn-default btn-xs">수정</button>
            <button type="button" class="btn btn-default btn-xs" onclick ="location.href='./list.do'">취소</button>
          </div>
          <div style='clear:both;'></div>          
          </FORM>
          
          <FORM name='form_grp' method='POST' action='../servey/create.do'>
            <input type='hidden' name='sb_no' value='${serveyboardVO.sb_no}'>
            <fieldset>
            <table>
              <tr>
                <th scope="row">
                  <label>보기 항목 추가</label></th>
                 <td> 
                  <input type='text' name='item' placeholder='추가할 보기를 입력해 주세요' required="required" size='68'>
                  <button type="submit" class="btn btn-default btn-xs">등록</button>
                 </td>
              </tr>
             </table> 
            </fieldset>
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