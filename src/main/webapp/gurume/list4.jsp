<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>맛집 게시판 </title>   
  <!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<style>
  #columns{
    float:left;
    column-width:200px;
    column-gap: 20px;
  }
  #columns figure{
    display: inline-block;
    border:1px solid rgba(255,0,0,0.2);
    margin:0;
    margin-bottom: 30px;
    padding:10px;
    box-shadow: 2px 2px 5px rgba(0,0,255,0.5);
  }
  #columns figure figcaption{
    border-top:1px solid rgba(0,0,0,0.2);
    padding:10px;
    margin-top:11px;
  }
   #file2{
   width:100%;
  }
div#select_box {
    position: relative;
    text-align:right;
    width:87%;

}
div#select_box label {
    position: absolute;
    width:82px;
    height:26px;
    background: url(../gurume/images/select_arrow.png) no-repeat 63px 7px;
    border: 1px solid #E9DDDD;
    font-size: 14px;
    color: #a97228;
    top: 11px;
    right: 176px;
    text-align: left;
    padding-left: 15px;
    letter-spacing: 1px;
     
}
div#select_box select#color {
    width: 75px;
    height: 40px;
    min-height: 40px;
    line-height: 40px;
    margin-right:10px;
    padding: 0 10px;
    opacity: 0;
    filter: alpha(opacity=0); /* IE 8 */
}

</style>
<script>
jQuery(document).ready(function(){
  
  var select = $("select#color");
  
  select.change(function(){
      var select_name = $(this).children("option:selected").text();
      $(this).siblings("label").text(select_name);
  });
});
</script>
</head>

<body>
  <section class="wrapper">
    <section class="page_head">
        <div class="container">
             <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="../index.jsp">Home</a>/</li>
                                <li><A href='./list4.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 맛집</i> 
                            </ul> 
                        </nav>
                    </div>
                </div>
            </div>
    </section>
    </section>

 <form name="frmSearch" method="get" action="./list4.do" align="center" > 
    <A href='./create.do?divisionno=${divisionVO.divisionno}' class="btn btn-danger btn-sm"><i class="fa fa-pencil">
   우리 회사 근처 맛집을 추천해주세요!</i></A>
   <div  id="select_box" >

   <label for="color">선택</label>
       <select id="color" title="select color" class='content_menu' name="col"  >
   
        <option selected="selected">선택</option>
        <option value="title" ${searchDTO.col == "title" ? "selected=selected" : "" }>제목</option> 
        <option value="content" ${searchDTO.col == "content" ? "selected=selected" : "" }>내용</option> 
        <option value="title_content" ${searchDTO.col == "title_content" ? "selected=selected" : "" }>제목+내용</option> 
        <option value="total" ${searchDTO.col == "" ? "selected=selected" : "" }>전체 목록</option>
      <c:choose>
        <c:when test="${searchDTO.col != 'total' }"> <!-- 검색 상태 -->
          <input type="text" name="word" size="15" value="${searchDTO.word }">
        </c:when>
        <c:when test="${searchDTO.col == 'total' }"> <!-- 전체 레코드 -->
          <input type="text" name="word" size="15" value=""  style="border-color:#a97228">
        </c:when>
      </c:choose>
       </select> 
      <input type="image" class="btn-sch" src="../gurume/images/search_ico.gif" onclick="./list4.do"/> 
      <div style="clear:both;"></div> 
   </div> 
  </form>
<div class="container">
 <div class="row" align='center'>
   <div class="col-xs-12 col-lg-12">
    <DIV style= 'margin: 0 0 30px 0;'>${paging}</DIV>
  </div>
  </div>



    <div class="list_content" style='width: 100%; columns: 5;'>
      <c:forEach var="vo" items="${list }">
    <div id="columns">
      <figure>
         <c:choose>
              <c:when test="${vo.file1 == null}"></c:when>
              <c:when test="${vo.file1 != null}">
                <c:set var='file2' value="${fn:toLowerCase(vo.file2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(file2, '.jpg')}">
                  <a href="./read.do?gu_no=${vo.gu_no}">
                    <IMG id='file2' src='./storage/${vo.file2}' >
                  </a>
                  </c:when>
                  <c:when test="${fn:endsWith(file2, '.gif')}">
                  <a href="./read.do?gu_no=${vo.gu_no}">
                    <IMG id='file2'  src='./storage/${vo.file2}' >
                  </a>
                  </c:when>
                  <c:when test="${fn:endsWith(file2, '.png')}">
                  <a href="./read.do?gu_no=${vo.gu_no}">
                    <IMG id='file2'  src='./storage/${vo.file2}' >
                  </a>
                  </c:when>
                  <c:otherwise>
                    ${vo.file2}
                  </c:otherwise>
                </c:choose>
                </c:when>
            </c:choose>
        <figcaption>
            <h4>NO.${vo.gu_no}</h4>
             <span style='vertical-align: middle;'>
              <img src="./images/check.png" width='20px'/><!-- 맛집명 : --> 
             <a href="./read.do?gu_no=${vo.gu_no}">${vo.gu_title}</a> 
            </span><br>
            <span style='vertical-align: middle;'><img src="./images/check.png" width='20px'/><!-- 닉네임: -->${vo.gu_name}</span><br>
            <span><img src="./images/check.png" width='20px'/><!-- 지역 : -->${vo.gu_area}</span><br>
            <span><img src="./images/check.png" width='20px'/><!-- 분류 : -->${vo.gu_menu}</span><br>
           <span style='vertical-align: middle;'>
             <img src="./images/check.png" width='20px'/><!-- 조회수: -->${vo.gu_cnt}</span> <br>
            
            <span id="stars" style='vertical-align: middle;'> 
            <c:choose>
            <c:when test="${vo.gu_stars == 1 }">
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 2 }">
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 3 }" >
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 4 }">
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            <c:when test="${vo.gu_stars == 5 }">
            <img src="../gurume/images/yellow.png"width=20px >
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            <img src="../gurume/images/yellow.png" width=20px>
            </c:when>
            </c:choose>
           </span>
            <br>
            
            
              <span style='vertical-align: middle;'>
              <a href="./update.do?gu_no=${vo.gu_no}"><img src="./images/update1.png" title="수정" border='0' width="20px"/></a>
              <a href="./delete.do?gu_no=${vo.gu_no}"><img src="./images/delete1.png" title="삭제"  border='0' width="30px"/></a>
            </span>
             
        </figcaption>
   </figure>
   </div>
     </c:forEach>
 

 </div>
 </div>
   
</body>
<!-- -------------------------------------------- -->

<div style= 'margin: 100px 0 0 0;  position: relative;'>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>  
<!-- -------------------------------------------- -->
  
</html>
