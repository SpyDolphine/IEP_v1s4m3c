<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title> 채용정보 내용 </title>

<script type="text/javascript">
  $(function(){
    $('#file2').load(function(){ // 태그 메모리 상주후 작동
      // var width = $('#file2').width();
      //alert('file2: ' + width); 
      if ($('#file2').width() > screen.width * 0.7){
        $('#file2').width('70%');      
      }
    });
  });
  
</script>
 
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
                                <li><A href='./update.do??em_no=${vo.em_no }&ei_no=${vo.ei_no }&col=${searchDTO.col}&word=${searchDTO.word}&nowPage=${searchDTO.nowPage }'>수정</A></li> 
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 !  -->
                                <i class="fa fa-arrow-circle-right"> 채용정보 내용 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! -->
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
   

   
<!--    ★★★ 내용입니다. -->
   
   <input type='hidden' name='ei_no' value='${vo.ei_no }'>
  
       <DIV style='line-height: 22px;'>
        <fieldset>
         <ul>
          <li>${vo.em_startdate.substring(0, 9) } ~ ${vo.em_enddate .substring(0, 9) }
          &nbsp;&nbsp; &nbsp; <span style='top: -1px; line-height: 20px;'>${vo.em_date } 등록</span></li>
         </ul>
        </fieldset>
        
       </DIV> 
       
<!--                                      상대위치 -->
       <div class="content" style='position: relative; padding: 10px 10px; background-color: #f0f0f0;'>
       <DIV>
        <fieldset>
         <ul>
          <li>${vo.em_title }</li>
         </ul>
        </fieldset>
       </DIV>  
        <BR>
         <div class="col-xs-4 col-lg-3" style='float: left; padding: 20px 0 0 5px; margin-bottom: 13px;'>
           <c:choose>
              <c:when test="${eiVO.ei_logofile1 == null}"></c:when>
              <c:when test="${eiVO.ei_logofile1 != null}">
                <c:set var='ei_logofile2' value="${fn:toLowerCase(eiVO.ei_logofile2)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(ei_logofile2, '.jpg')}">
                    <IMG id='file2' src='./storage/${eiVO.ei_logofile2}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ei_logofile2, '.gif')}">
                    <IMG id='file2'  src='./storage/${eiVO.ei_logofile2}' >
                  </c:when>
                  <c:when test="${fn:endsWith(ei_logofile2, '.png')}">
                    <IMG id='file2'  src='./storage/${eiVO.ei_logofile2}' >
                  </c:when>
                  <c:when test="${eiVO.ei_logofile2.length() > 0}">
                   ${eiVO.ei_logofile2 }
                  </c:when>
                </c:choose>
                </c:when>
            </c:choose>
          </div>         
        <fieldset>
          <div class="form-group" style='float: left; width: 575px; padding: 20px 0 20px 20px;'>
           ${eiVO.ei_corporationname}
          <ul>
           <li>
           <label for='ei_established' class="col-xs-2 col-lg-3 control-label">설립일</label>
              ${eiVO.ei_established }
           </li>
          </ul>
          <BR>
          <ul>
           <li>
            <label for='ei_employees' class="col-xs-2 col-lg-3 control-label">사원수</label>
             ${eiVO.ei_employees}
           </li>
          </ul>
          <BR>
          <ul>
           <li>
            <label for='ei_employees' class="col-xs-2 col-lg-4 control-label">홈페이지</label>
             ${eiVO.ei_url }
           </li>
          </ul>               
        </div>
        <DIV class="form-group" style='position: relative; width: 100%; z-index: 15;'>
        
        </DIV>
        
       </fieldset>
      </div>
      
      <BR>
      <BR>
      <div class="form-group">   
       <label for='em_cof' class="col-xs-2 col-lg-3 control-label">자격 요건</label>
      </DIV>
      <BR>
      <BR>
      <DIV class="form-group">
       <label for='em_cof' class="col-xs-2 col-lg-3 control-label">핵심 직무 역량</label>
       <div class="col-xs-2 col-lg-7">
        ${vo.em_cof }
        <BR>
       </DIV>
       <label for='em_pi' class="col-xs-2 col-lg-3 control-label">우대 사항</label>
       <div class="col-xs-2 col-lg-7">
        </textarea>
        <BR>
       </DIV>
      </div>
      
      <div class="form-group"> 
       <label for='em_rp' class="col-xs-2 col-lg-3 control-label">채용 절차</label>  
      </DIV>
      <DIV class="form-group">
       <label for='em_rp' class="col-xs-2 col-lg-10 control-label">채용 절차 내용</label>
       <div class="col-sm-4 col-lg-10">
        ${vo.em_rp }
       </div>
      </div>
      
      <div class="form-group">   
       <label for='em_occupations' class="col-xs-2 col-lg-10 control-label">상세정보</label>
      </DIV>
     <table class="tbl_ty3 tbl_companies_info" style='width: 100%;'>
     
          
      <%-- table 컬럼 --%>
        <tr>
         <th>직종</th>
         <th>${vo.em_occupations }</th> 
         <th>고용 형태</th>
         <th>${vo.em_et }</th> 
        </tr>
        <tr>
         <th>최종 학력</th>
         <th>${vo.em_lastschool }</th> 
         <th>급여</th>
         <th>${vo.em_salary }</th> 
        </tr>
        <tr>
         <th>직급</th>
         <th>${vo.em_rank }</th> 
         <th>직책</th>
         <th>${vo.em_position }</th> 
        </tr>
     </table>
     <BR>
     <BR>
     
        <div class="form-group">   
         <label for="content" class="col-xs-2 col-lg-2 control-label">등록된 파일</label>
         <span>
          <c:if test="${vo.em_supportformsize1 > 0}">
           <A href='${pageContext.request.contextPath}/download?dir=/employment_information/storage&filename=${vo.em_supportformfile1}'>
                    ${vo.em_supportformfile1}</A> (${vo.size2Label})
          </c:if>
         </span>
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