<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String root = request.getContextPath();
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>정보 수정 </title>    
 <script type="text/javascript">
 function open_win(){
  window.open("./passwd.do?me_no=${sessionScope.me_no}",'popup', 'width=500, height=300,left=200px,top=200px');
} 
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
                                <li class="fa fa-arrow-circle-right"> ex. 커뮤니티 </li>   ★★★ 각 게시판 이름을 적어주세요 ! 
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
<DIV class='title'>회원 정보 수정</DIV>
 
<DIV class='content'>
<FORM name='frm' method='POST' action='./update.do'>
  <input type='hidden' name='me_no' value='${memberExVO.me_no}'>         
  <fieldset>
    <ul>
      <li>
        <label class='' for='me_id'>아이디</label>
        ${memberExVO.me_id} 
        <SPAN id='panel_id'>(ID는 변경할 수 없습니다.)</SPAN>
      </li>
      <li>
        <label class='' for='me_pw'>비밀번호</label>
        <button type="button" name="me_pw" id="me_pw" onclick="javascript:open_win();">비밀번호 변경</button>
      </li>
      <li>
        <label class='' for='me_name'>성명</label>
        ${memberExVO.me_name}
         <SPAN id='panel_nema'>(이름은 변경할 수 없습니다.)</SPAN>
      </li>
      <li>
      <label class='' for='me_nick'>닉네임</label>
        ${memberExVO.me_nick}
         <SPAN id='panel_nick'>(닉네임은 변경할 수 없습니다.)</SPAN>
      </li>
      <li>
        <label class='' for='me_tel'>전화번호</label>
        <input type="tel" name='me_tel' id='me_tel' value='${memberExVO.me_tel}'> 예) 010-0000-0000
      </li>
      <li>
        <label class='' for='me_zipcode'>우편번호</label>
        <input type='text' name='me_zipcode' id='me_zipcode' value='${memberExVO.me_zipcode}' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>        
      </li>
      <li>
        <label class='' for='me_addr1'>주소</label>
        <input type='text' name='me_addr1' id='me_addr1' value='${memberExVO.me_addr1}' size='60' placeholder="주소">  
      </li>
      <li>
        <label class='' for='me_addr2'>상세 주소</label>
        <input type='text' name='me_addr2' id='me_addr2' value='${memberExVO.me_addr2}' size='40' placeholder="상세 주소">      
      </li>
      <li>
        <label class='label'></label>  
<!-- ----- DAUM 우편번호 API 시작 ----- -->
 
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('me_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('me_addr1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#me_addr2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
        
      </li>
      <li class='right'>
        <button type="submit">저장</button>
         <button type='button' onclick="location.href='<%=root%>/index.do'">홈으로</button>
         <c:choose>
          <c:when test="${memberExVO.me_vis eq 'y' }">
        <button type="button" onclick="location.href='./memberout.do?me_no=${memberExVO.me_no}'">회원 탈퇴</button>  
          </c:when>
          <c:when test="${memberExVO.me_vis eq 'n' }">
        <button type="button" onclick="location.href='./memberin.do?me_no=${memberExVO.me_no}'">회원 복귀</button>  
          </c:when>
         </c:choose>
        
        
        
      </li>         
    </ul>
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