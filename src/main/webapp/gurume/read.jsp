<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>맛집 정보</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/lib/jquery.min.1.7.2.js"></script>
<script src="/lib/jquery.bpopup.min.js"></script>
<script src='/lib/zoom/jquery.elevatezoom.js'></script>
<script>
 // 추천
 function likeup(gu_no){ // 응답 처리 함수
    var params = 'gu_no=' + gu_no;
    $.get('./likeup.do', params, likeup_res, 'json');
    //alert('성공' + gu_no);
 }
 
 function likeup_res(data){ // 응답 처리 함수
   //alert('로그인이 필요합니다');
   //return false;
   $('#test_like' + data.gu_no).html(data.likeup);  
 }
 
 // 비추천
 function likedown(gu_no){ // 응답 처리 함수
   var params = 'gu_no=' + gu_no;
   $.get('./likedown.do', params, likedown_res, 'json');
   //alert('성공' + gu_no);
 }

 function likedown_res(data){ // 응답 처리 함수
   $('#test_unlike' + data.gu_no).html(data.likedown);  
 }
 
//-----------------------------------------------------------------------------------------------------------------//

 //iframe resize
 function autoResize(i)
{
   var iframeHeight=
   (i).contentWindow.document.body.scrollHeight;
   (i).height= iframeHeight;
}   
 

 $(document).ready(function(){
   $(".menu>a").click(function(){
       $(this).next("div").toggleClass("hide");
   });
});

 /* 기타소스 */
 $('#zoom_01').elevateZoom({
   zoomType: "window",
   cursor: "crosshair",
   zoomWindowFadeIn: 500,
   zoomWindowFadeOut: 750
  }); 
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
                                <li><A href='./list4.do'>목록</A></li>   
                                <i class="fa fa-arrow-circle-right"> 회사 근처맛집</i>   
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

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center" valign="top">
 
  <!-- 상단 메뉴 시작-->
  <table width="1190" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="300" height="182" valign="top">
       <a onFocus="this.blur();"></a> <!-- 왼쪽 여백부분 지우면안됨 -->
      </td>
      <td width="540" valign="bottom" align="right" style="padding-right:5px;">
  
  <!--레이어 메뉴 시작-->
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
        </tr>
        <tr>
          <td height="5" align="right"></td>
        </tr>
        <tr>
          <td align="right"><table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" valign="top">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>  
              <td align="center" style="padding-left:4px; padding-right:0px;">
              <div style="position:relative; z-index:100" > 
            <div style="position:absolute;left:-60px;top:46px;display:none" id="div_search"  onmouseout="div_search_onoff(0)" onMouseOver="div_search_onoff(1)">
   <!-- 메뉴 ------------------------------------------------------------------------------------------------------------------------------------>
              <table width="350" border="0" cellpadding="0" cellspacing="0" background="">
                <tr><td height="103" align="right" >
                <table border="0" cellspacing="0" cellpadding="0" width="254" height="103">
                  <tr>
                  <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="8" align="center" valign="bottom"></td>
                    </tr>
                    <tr>
                      <td align="center" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      </table></td>
                    </tr>
                    <tr>
                      <td height="11" align="center"></td>
                    </tr>
                    <tr>
                    <td height="63" align="center" valign="bottom" onMouseOver="div_allmenu_onoff(1)" onMouseOut="div_allmenu_onoff(0)">
          <div style="position:relative; z-index:100" > 
            <div style="position:absolute;left:-148px;top:34px;display:none" id="div_allmenu"  onmouseout="div_allmenu_onoff(0)" onMouseOver="div_allmenu_onoff(1)">
  <!-- 메뉴 ------------------------------------------------------------------------------------------------------------------------------------>
               <table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#E2E2E2" >
                <tr>
                  <td width="1" align="center" valign="bottom"></td>
                  <td align="center" valign="top" bgcolor="#FFFFFF">
                  <table width="380" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="25">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="center">
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
                  <td width="1" height="450" align="center" valign="bottom"></td>
                </tr>
                <tr>
                  <td height="1" align="center" valign="bottom"></td>
                  <td height="1" align="center" valign="bottom"></td>
                  <td height="1" align="center" valign="bottom"></td>
                </tr>
               </table>
               </div>
               <img src="/images_2015/top/topmenu_s_5c_04.gif" onMouseOver="div_allmenu_onoff(1)" onMouseOut="div_allmenu_onoff(0)"  onclick="javascript:location='#'" style="cursor:hand" /></div>                                    </td>
                </tr>
              </table></td>
                  </tr>
                </table>
                </td>
                </tr>
              </table>
<!-- 메뉴 ------------------------------------------------------------------------------------------------------------------------------------>                    
            </div>
            <span  onMouseOver="div_menu_onoff(1)" onMouseOut="div_menu_onoff(0)"  onclick="javascript:location='#'" style="cursor:hand" />        </div>      </td>
            </tr>
          </table></td>
        </tr>
      </table></td>
        </tr>
      </table>
  <!--레이어 메뉴 종료-->
      
  <!-- 상품옵션 선택 테이블 시작-->
  <form name="frm"  method="get"action='./update.do'>
  <input type="hidden" name="gu_no" value="${gurumeVO.gu_no}">
  <fieldset class="fieldset">
  <table width="1130" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td valign="top" >
        <table width="1130" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <tr>
      <td>
       <table width="1130" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="300" align="center" valign="top">
        <table width="300" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
             <img id="zoom_01" src="./storage/${gurumeVO.file2}" style=" width:200%; height:100%;" data-zoom-image="./storage/${gurumeVO.file2}">
           </td>
          </tr>
        </table> 
     </td>
   <td width="400" align="right"></td>
      <td width="400" valign="top">
      <!-- 옵션 선택 테이블 시작-->
<table width="400" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
<table width="400" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td bgcolor="#FFFFFF">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="470" align="left" valign="top" style="padding-bottom: 5px;">

                      <strong><font color="000000" size="3">${gurumeVO.gu_title}</font></strong>
                      </td>
                </tr>
                <tr>
                  <td align="left"  style="padding-bottom: 10px;" readonly="readonly">

                       <c:choose>
                          <c:when test="${gurumeVO.gu_stars == 1 }">
                          <img src="../gurume/images/yellow.png" width=20px>
                          </c:when>
                          <c:when test="${gurumeVO.gu_stars == 2 }">
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          </c:when>
                          <c:when test="${gurumeVO.gu_stars == 3 }">
                          <img src="../gurume/images/yellow.png"width= 20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          </c:when>
                          <c:when test="${gurumeVO.gu_stars == 4 }">
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          </c:when>
                          <c:when test="${gurumeVO.gu_stars == 5 }">
                          <img src="../gurume/images/yellow.png"width=20px >
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          <img src="../gurume/images/yellow.png" width=20px>
                          </c:when>
                        </c:choose> 
                        </td>
                     </tr>
                  <tr><td height="2" bgcolor="#b3ccff"></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
  </table></td>
</tr>
<tr>
  <td style="padding-top:10px;" align="left" ></td>
</tr>
</table>
</td>
  </tr>
<td height="35" align="left" >
<table width="470" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="80" align="left" ><strong>닉네임</strong></td>
      <td width="20" align="left" ><strong>: </strong></td>
      <td align="left" >${gurumeVO.gu_name}
      <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
        </td>
        </tr>
</table></td>
<td style="padding-left:10px;"></td>
  </tr>
</table></td>
 </tr>
<tr><td height="1" bgcolor="#b3ccff"></td></tr>
<!-- 적립금 시작 -->
<tr>
  <td height="35" align="left" ><table width="470" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80" align="left"  ><strong>지역</strong></td>
        <td width="20" align="left" ><strong>: </strong></td>
        <td width="370" align="left" >${gurumeVO.gu_area}
     </td>
      </tr>
  </table></td>
</tr>
<tr><td height="1" bgcolor="#b3ccff"></td></tr>
<!-- 적립금 종료 -->
<tr>
  <td height="35" align="left" >
  <table width="470" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80" align="left" ><strong>분류 
          </strong></td>

        <td width="20" align="left" ><strong>:</strong></td>
        <td width="370" align="left" >${gurumeVO.gu_menu}</td>
      </tr>
  </table>                                      </td>
</tr>
<tr><td height="1" bgcolor="#b3ccff"></td></tr>
<tr>
 <td height="35" align="left" >
  <table width="470" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80" align="left" ><strong>가격대 
          </strong></td>
        <td width="20" align="left" ><strong>: </strong></td>
        <td width="370" align="left" >${gurumeVO.gu_price}
                              </td>
      </tr>
 </table></td>
</tr>
<tr><td height="1" bgcolor="#b3ccff"></td></tr>
<tr>
  <td height="35" align="left" >
  <table width="470" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80" align="left" ><strong>등록일</strong></td>
    <td width="20" align="left" ><strong>  : </strong></td>
    <td width="370" align="left" >${gurumeVO.gu_date.substring(0, 16)}
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="15"></td>
          <td width="10"></td>
        </tr>
      </table>       
   <td width="55" valign="top"></td>
   <td valign="top"><table border="0" cellspacing="0" cellpadding="0">
   </table>
   </table>
   </table>
</table> 
    <tr>
     <td valign="top">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
        </tr>
        <tr>
          <td>
          <table border="0" cellspacing="0" cellpadding="0">
            </tr>
          </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>   
 </td>
  </tr>
<tr>
 <td align="center" height="50"></td>
</tr>
</table>      
</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="1" bgcolor="#E1E1E1"></td>
  </tr>
</table>


<div id="good_info_s0"  style="display:''">
 <!-- 상품설명-->
 <table width="1190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50">&nbsp;</td>
  </tr>
  <tr>
    <td align="center">
      <table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr><td align="center"></td>
        <tr><td height="50"></td>
        </tr>
        <tr>
          <td align="center" class="good-content"><p>
          <span style="font-size:14px" readonly="readonly"><strong>${gurumeVO.gu_cont}</strong></span><br /><br>
        </tr>
      </table>
      <table width="650" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30"></td>
        </tr>
        <tr>
          <td align="center" margin: 0 auto; >
          <table width="520" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="40"></td>
            </tr>
            <tr>
              <td class="good-content">
              ${gurumeVO.gu_map}</td>
            </tr>
            <tr>
              <td height="40"></td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
     </td>
     </tr>
 </table>
</div>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="center">
    <table width="800" border="0" cellpadding="0" cellspacing="0"></td>
  <tr> 
   <td height="50">
    <table width="100%" border="0" cellspacing="0" cellpadding="1">
   <tr>
    <td width="130"><span class="style10"></span></td>
      <span class='right'>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./list4.do?gu_no=<%-- ?divisionno=${boardVO.divisionno} --%>&col=${searchDTO.col}&word=${searchDTO.word}'">목록보기</button>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./update.do?gu_no=${gurumeVO.gu_no}&col=${searchDTO.col}&word=${searchDTO.word}'">수정</button>
        <button type="button" class="btn btn-default btn-xs" onclick="location.href='./delete.do?gu_no=${gurumeVO.gu_no}'">삭제</button>
      </span>
    <!------------------------------------------------- 댓글 시작  --------------------------------------------->
      <div class="menu">
          <a href='#' onclick="<!-- alert('로그인이 필요합니다'); return false; -->" class="btn btn-primary btn-xs btn-alt">
          <i class="fa fa-comments-o"></i> 댓글</a> 
          <iframe id="iframe" width="100%" onload="autoResize(this)" frameborder="0" src="../dat/datlist.do?gu_no=${gurumeVO.gu_no }"></iframe>
      </div>   
    <!------------------------------------------------- 댓글 종료  --------------------------------------------->   
        </tr>
      </table>
    </td>
   </tr>
  </table>
 </td>
</tr>
</table>
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