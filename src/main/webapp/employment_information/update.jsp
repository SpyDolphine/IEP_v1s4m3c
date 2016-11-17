<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title>채용정보 수정 </title>

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
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 ! -->
                                <i class="fa fa-arrow-circle-right"> 채용정보 수정 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! --> 
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
   
   <FORM name='frm' method='POST' class="form-horizontal" action='./update.do'  
       onsubmit="return send();" enctype="multipart/form-data">
       
       <input type='hidden' name='em_no' value='${vo.em_no }'> 
       
<!--                                      상대위치 -->
     <div class="content" style='position: relative; padding: 10px 10px; background-color: #f0f0f0;'>
      <div class="form-group">
       <label for='em_title' class="col-xs-2 col-lg-3 control-label">채용 제목</label>
       <div class="col-xs-2 col-lg-7">
        <input type='text' class="form-control" name='em_title' id='em_title' value='${vo.em_title}' 
         required="required">
       </div>
      </div>
     </div>
        
      <BR>
      <div class="form-group">   
       <label for='em_cof' class="col-xs-2 col-lg-3 control-label">자격 요건</label>
      </DIV>
      <DIV class="form-group">
       <label for='em_cof' class="col-xs-2 col-lg-3 control-label">핵심 직무 역량</label>
       <div class="col-xs-2 col-lg-7">
        <textarea class="form-control" name='em_cof' id='em_cof'  rows='10' cols='20'>
        ${vo.em_cof }
        </textarea>
        <BR>
       </DIV>
       <label for='em_pi' class="col-xs-2 col-lg-3 control-label">우대 사항</label>
       <div class="col-xs-2 col-lg-7">
        <textarea class="form-control" name='em_pi' id='em_pi'  rows='10' cols='20'>
        ${vo.em_pi }
        </textarea>
       </DIV>
      </div>
      
      <div class="form-group">   
       <label for='em_cof' class="col-xs-2 col-lg-3 control-label">채용 절차</label>
      </DIV>
      <DIV class="form-group">
       <label for='em_rp' class="col-xs-2 col-lg-3 control-label">채용 절차 내용</label>
       <div class="col-xs-2 col-lg-7">
        <textarea class="form-control" name='em_rp' id='em_rp'  rows='10' cols='20'>
        ${vo.em_rp }
        </textarea>
        <BR>
       </div>
       <label for='em_howtoapply' class="col-xs-2 col-lg-3 control-label">지원방법</label>
       <div class="col-xs-2 col-lg-7">
        <input type='text' class="form-control" name='em_howtoapply' id='em_howtoapply' value='${vo.em_howtoapply }' 
         required="required">
       </div>
      </DIV> 
      <div class="form-group">   
       <label for='em_url' class="col-xs-2 col-lg-3 control-label">기타</label>
      </DIV>
      <DIV class="form-group">
       <label for='em_url' class="col-xs-2 col-lg-3 control-label">홈페이지</label>
       <div class="col-xs-2 col-lg-7">
        <input type='url' class="form-control" name='em_url' id='em_url' value='${vo.em_url }' 
         required="required">
       </DIV>
       <BR>
       <BR>
       <label for='em_workplace' class="col-xs-2 col-lg-3 control-label">근무지</label>
       <div class="col-xs-2 col-lg-7">
        <input type='text' class="form-control" name='em_workplace' id='em_workplace' value='${vo.em_workplace }' 
         required="required">
        <input type='button' onclick='DaumPostcode()' value='주소찾기'><br>
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
                // document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                // document.getElementById('address1').value = fullAddr;
                document.getElementById('em_workplace').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                // $('#address2').focus();
                $('#em_workplace').focus();
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
       </DIV>
      </DIV>
     <BR>
     <BR>
     
   <div>
   
     <div class="form-group">   
       <label for='em_occupations' class="col-xs-2 col-lg-2 control-label">상세정보</label>
     </DIV>
         
    <table class="tbl_ty3 tbl_companies_info" style='width: 100%;'>
          
      <%-- table 컬럼 --%>
        <tr>
         <th>직종</th>
         <th>
          <select name='em_occupations'>
            <optgroup label="경영·사무">
              <option value='선택'>선택</option>
               <option value='기획' ${vo.em_occupations == "기획" ? "selected=selected" : "" }>기획</option>
               <option value='전략' ${vo.em_occupations == "전략" ? "selected=selected" : "" }>전략</option>
               <option value='사업기획' ${vo.em_occupations == "사업기획" ? "selected=selected" : "" }>전략</option>
               <option value='사업제휴' ${vo.em_occupations == "사업제휴" ? "selected=selected" : "" }>사업제휴</option>
               <option value='타당성분석' ${vo.em_occupations == "타당성분석" ? "selected=selected" : "" }>타당성분석</option>
               <option value='CEO' ${vo.em_occupations == "CEO" ? "selected=selected" : "" }>CEO</option>
               <option value='MBA' ${vo.em_occupations == "MBA" ? "selected=selected" : "" }>MBA</option>
               <option value='경영기획' ${vo.em_occupations == "경영기획" ? "selected=selected" : "" }>경영기획</option>
               <option value='경영혁신' ${vo.em_occupations == "경영혁신" ? "selected=selected" : "" }>경영혁신</option>
               <option value='기획조사' ${vo.em_occupations == "기획조사" ? "selected=selected" : "" }>기획조사</option>
               <option value='조직관리' ${vo.em_occupations == "조직관리" ? "selected=selected" : "" }>조직관리</option>
               <option value='변화관리' ${vo.em_occupations == "변화관리" ? "selected=selected" : "" }>변화관리</option>
               <option value='경영혁신' ${vo.em_occupations == "경영혁신" ? "selected=selected" : "" }>경영혁신</option>
               <option value='출판기획' ${vo.em_occupations == "출판기획" ? "selected=selected" : "" }>출판기획</option>
             </optgroup>
             <optgroup label="마케팅·무역·유통">
              <option value='선택'>선택</option>
              <option value='CMO' ${vo.em_occupations == "CMO" ? "selected=selected" : "" }>CMO</option>
              <option value='마케팅' ${vo.em_occupations == "마케팅" ? "selected=selected" : "" }>마케팅</option>
              <option value='마케팅기획' ${vo.em_occupations == "마케팅기획" ? "selected=selected" : "" }>마케팅기획</option>
              <option value='업무제휴' ${vo.em_occupations == "업무제휴" ? "selected=selected" : "" }>업무제휴</option>
              <option value='판촉' ${vo.em_occupations == "판촉" ? "selected=selected" : "" }>판촉</option>
              <option value='시장분석' ${vo.em_occupations == "시장분석" ? "selected=selected" : "" }>시장분석</option>
              <option value='전시' ${vo.em_occupations == "전시" ? "selected=selected" : "" }>전시</option>
              <option value='국제회의' ${vo.em_occupations == "국제회의" ? "selected=selected" : "" }>국제회의</option>
              <option value='브랜딩' ${vo.em_occupations == "브랜딩" ? "selected=selected" : "" }>브랜딩</option>
              <option value='프로모션' ${vo.em_occupations == "프로모션" ? "selected=selected" : "" }>프로모션</option>
              <option value='광고기획' ${vo.em_occupations == "광고기획" ? "selected=selected" : "" }>광고기획</option>
              <option value='라이센싱' ${vo.em_occupations == "라이센싱" ? "selected=selected" : "" }>라이센싱</option>
              <option value='IMC' ${vo.em_occupations == "IMC" ? "selected=selected" : "" }>IMC</option>
              <option value='CRM' ${vo.em_occupations == "CRM" ? "selected=selected" : "" }>CRM</option>
              <option value='소셜미디어'>소셜미디어</option>
              <option value='소셜미디어' ${vo.em_occupations == "소셜미디어" ? "selected=selected" : "" }>소셜미디어</option>
              <option value='퍼블리싱' ${vo.em_occupations == "퍼블리싱" ? "selected=selected" : "" }>퍼블리싱</option>
              <option value='바이럴마케팅' ${vo.em_occupations == "바이럴마케팅" ? "selected=selected" : "" }>바이럴마케팅</option>
             </optgroup>
             <optgroup label="영업·고객상담">
              <option value='선택'>선택</option>
              <option value='영업기획' ${vo.em_occupations == "영업기획" ? "selected=selected" : "" }>영업기획</option>
              <option value='장비영업' ${vo.em_occupations == "장비영업" ? "selected=selected" : "" }>장비영업</option>
              <option value='기술영업' ${vo.em_occupations == "기술영업" ? "selected=selected" : "" }>기술영업</option>
              <option value='국내영업' ${vo.em_occupations == "국내영업" ? "selected=selected" : "" }>국내영업</option>
              <option value='해외영업' ${vo.em_occupations == "해외영업" ? "selected=selected" : "" }>해외영업</option>
              <option value='제약영업' ${vo.em_occupations == "제약영업" ? "selected=selected" : "" }>제약영업</option>
              <option value='자동차영업' ${vo.em_occupations == "자동차영업" ? "selected=selected" : "" }>자동차영업</option>
              <option value='의료기영업' ${vo.em_occupations == "의료기영업" ? "selected=selected" : "" }>의료기영업</option>
              <option value='화장품영업' ${vo.em_occupations == "화장품영업" ? "selected=selected" : "" }>화장품영업</option>
              <option value='일반영업' ${vo.em_occupations == "일반영업" ? "selected=selected" : "" }>일반영업</option>
              <option value='법인영업' ${vo.em_occupations == "법인영업" ? "selected=selected" : "" }>법인영업</option>
              <option value='납품영업' ${vo.em_occupations == "납품영업" ? "selected=selected" : "" }>납품영업</option>
              <option value='중고차딜러' ${vo.em_occupations == "중고차딜러" ? "selected=selected" : "" }>중고차딜러</option>
              <option value='주류영업' ${vo.em_occupations == "주류영업" ? "selected=selected" : "" }>주류영업</option>
              <option value='식품영업' ${vo.em_occupations == "식품영업" ? "selected=selected" : "" }>식품영업</option>
              <option value='상조영업' ${vo.em_occupations == "상조영업" ? "selected=selected" : "" }>상조영업</option>
             </optgroup>
             <optgroup label="IT·인터넷">
              <option value='선택'>선택</option>
              <option value='웹 프로그래머' ${vo.em_occupations == "웹 프로그래머" ? "selected=selected" : "" }>웹 프로그래머</option>
              <option value='asp' ${vo.em_occupations == "asp" ? "selected=selected" : "" }>asp</option>
              <option value='jsp' ${vo.em_occupations == "jsp" ? "selected=selected" : "" }>jsp</option>
              <option value='Java'>Java</option>
              <option value='Java' ${vo.em_occupations == "Java" ? "selected=selected" : "" }>Java</option>
              <option value='Servlet' ${vo.em_occupations == "Servlet" ? "selected=selected" : "" }>Servlet</option>
              <option value='CORBA' ${vo.em_occupations == "CORBA" ? "selected=selected" : "" }>CORBA</option>
              <option value='php' ${vo.em_occupations == "php" ? "selected=selected" : "" }>php</option>
              <option value='cgi' ${vo.em_occupations == "cgi" ? "selected=selected" : "" }>cgi</option>
              <option value='xml' ${vo.em_occupations == "xml" ? "selected=selected" : "" }>xml</option>
              <option value='SQL' ${vo.em_occupations == "SQL" ? "selected=selected" : "" }>SQL</option>
              <option value='MySQL' ${vo.em_occupations == "MySQL" ? "selected=selected" : "" }>MySQL</option>
              <option value='wml' ${vo.em_occupations == "wml" ? "selected=selected" : "" }>wml</option>
              <option value='AJAX' ${vo.em_occupations == "cgi" ? "selected=selected" : "" }>AJAX</option>

              <option value='MS-SQL' ${vo.em_occupations == "MS-SQL" ? "selected=selected" : "" }>MS-SQL</option>
              <option value='WinForm' ${vo.em_occupations == "WinForm" ? "selected=selected" : "" }>WinForm</option>
              <option value='ASP.NET' ${vo.em_occupations == "ASP.NET" ? "selected=selected" : "" }>ASP.NET</option>
              <option value='MiPlatform' ${vo.em_occupations == "MiPlatform" ? "selected=selected" : "" }>MiPlatform</option>
             </optgroup>
             <optgroup label="연구개발·설계">
              <option value='선택'>선택</option>
              <option value='기구설계' ${vo.em_occupations == "기구설계" ? "selected=selected" : "" }>기구설계</option>
              <option value='기술연구소' ${vo.em_occupations == "기술연구소" ? "selected=selected" : "" }>기술연구소</option>
              <option value='기술직' ${vo.em_occupations == "기술직" ? "selected=selected" : "" }>기술직</option>
              <option value='메카트로닉스' ${vo.em_occupations == "메카트로닉스" ? "selected=selected" : "" }>메카트로닉스</option>
              <option value='생산기술' ${vo.em_occupations == "생산기술" ? "selected=selected" : "" }>생산기술</option>
              <option value='연구관리' ${vo.em_occupations == "연구관리" ? "selected=selected" : "" }>연구관리</option>
              <option value='연구원' ${vo.em_occupations == "연구원" ? "selected=selected" : "" }>연구원</option>
              <option value='제어' ${vo.em_occupations == "제어" ? "selected=selected" : "" }>제어</option>
              <option value='제품개발' ${vo.em_occupations == "제품개발" ? "selected=selected" : "" }>제품개발</option>
              <option value='CTO' ${vo.em_occupations == "CTO" ? "selected=selected" : "" }>CTO</option>
              <option value='R&D' ${vo.em_occupations == "R&D" ? "selected=selected" : "" }>R&D</option>
              <option value='기계' ${vo.em_occupations == "기계" ? "selected=selected" : "" }>기계</option>
              <option value='금속' ${vo.em_occupations == "금속" ? "selected=selected" : "" }>금속</option>
              <option value='조선' ${vo.em_occupations == "조선" ? "selected=selected" : "" }>조선</option>
              <option value='철강' ${vo.em_occupations == "철강" ? "selected=selected" : "" }>철강</option>
              <option value='건설' ${vo.em_occupations == "건설" ? "selected=selected" : "" }>건설</option>
              <option value='건축' ${vo.em_occupations == "건축" ? "selected=selected" : "" }>건축</option>
              <option value='금형설계' ${vo.em_occupations == "금형설계" ? "selected=selected" : "" }>금형설계</option>
              <option value='catia' ${vo.em_occupations == "catia" ? "selected=selected" : "" }>catia</option>
              <option value='플랜트' ${vo.em_occupations == "플랜트" ? "selected=selected" : "" }>플랜트</option>
             </optgroup>
             <optgroup label="생산·제조">
              <option value='선택'>선택</option>
              <option value='생산' ${vo.em_occupations == "생산" ? "selected=selected" : "" }>생산</option>
              <option value='품질' ${vo.em_occupations == "품질" ? "selected=selected" : "" }>품질</option>
              <option value='생산관리' ${vo.em_occupations == "생산관리" ? "selected=selected" : "" }>생산관리</option>
              <option value='품질관리' ${vo.em_occupations == "품질관리" ? "selected=selected" : "" }>품질관리</option>
              <option value='자재관리' ${vo.em_occupations == "자재관리" ? "selected=selected" : "" }>자재관리</option>
              <option value='공정관리' ${vo.em_occupations == "공정관리" ? "selected=selected" : "" }>공정관리</option>
              <option value='안전' ${vo.em_occupations == "안전" ? "selected=selected" : "" }>안전</option>
              <option value='환경관리' ${vo.em_occupations == "환경관리" ? "selected=selected" : "" }>환경관리</option>
              <option value='원가관리' ${vo.em_occupations == "원가관리" ? "selected=selected" : "" }>원가관리</option>
              <option value='ISO' ${vo.em_occupations == "ISO" ? "selected=selected" : "" }>ISO</option>
              <option value='공정' ${vo.em_occupations == "공정" ? "selected=selected" : "" }>공정</option>
              <option value='TPM' ${vo.em_occupations == "TPM" ? "selected=selected" : "" }>TPM</option>
              <option value='6시그마' ${vo.em_occupations == "6시그마" ? "selected=selected" : "" }>6시그마</option>
              <option value='공장장' ${vo.em_occupations == "공장장" ? "selected=selected" : "" }>공장장</option>
              <option value='QA' ${vo.em_occupations == "QA" ? "selected=selected" : "" }>QA</option>
              <option value='품질보증' ${vo.em_occupations == "품질보증" ? "selected=selected" : "" }>품질보증</option>
              <option value='품질검사' ${vo.em_occupations == "품질검사" ? "selected=selected" : "" }>품질검사</option>
              <option value='HACCP' ${vo.em_occupations == "HACCP" ? "selected=selected" : "" }>HACCP</option>
             </optgroup>
             <optgroup label="전문·특수직">
              <option value='선택'>선택</option>
              <option value='컨설턴트' ${vo.em_occupations == "컨설턴트" ? "selected=selected" : "" }>컨설턴트</option>
              <option value='금융컨설팅' ${vo.em_occupations == "금융컨설팅" ? "selected=selected" : "" }>금융컨설팅</option>
              <option value='경영컨설팅' ${vo.em_occupations == "경영컨설팅" ? "selected=selected" : "" }>경영컨설팅</option>
              <option value='창업컨설팅' ${vo.em_occupations == "창업컨설팅" ? "selected=selected" : "" }>창업컨설팅</option>
              <option value='매너컨설팅' ${vo.em_occupations == "매너컨설팅" ? "selected=selected" : "" }>매너컨설팅</option>
              <option value='웹컨설팅' ${vo.em_occupations == "웹컨설팅" ? "selected=selected" : "" }>웹컨설팅</option>
              <option value='경영기획' ${vo.em_occupations == "경영기획" ? "selected=selected" : "" }>경영기획</option>
              <option value='IPO' ${vo.em_occupations == "IPO" ? "selected=selected" : "" }>IPO</option>
              <option value='기업심사' ${vo.em_occupations == "기업심사" ? "selected=selected" : "" }>기업심사</option>
              <option value='투자심사' ${vo.em_occupations == "투자심사" ? "selected=selected" : "" }>투자심사</option>
              <option value='MBA' ${vo.em_occupations == "MBA" ? "selected=selected" : "" }>MBA</option>
              <option value='애널리스트' ${vo.em_occupations == "애널리스트" ? "selected=selected" : "" }>애널리스트</option>
              <option value='HR컨설팅' ${vo.em_occupations == "HR컨설팅" ? "selected=selected" : "" }>HR컨설팅</option>
              <option value='경영분석' ${vo.em_occupations == "경영분석" ? "selected=selected" : "" }>경영분석</option>
              <option value='M&A' ${vo.em_occupations == "M&A" ? "selected=selected" : "" }>M&A</option>
              <option value='투자자문' ${vo.em_occupations == "투자자문" ? "selected=selected" : "" }>투자자문</option>
             </optgroup>
             <optgroup label="디자인">
              <option value='선택'>선택</option>
              <option value='그래픽디자인' ${vo.em_occupations == "그래픽디자인" ? "selected=selected" : "" }>그래픽디자인</option>
              <option value='3D' ${vo.em_occupations == "3D" ? "selected=selected" : "" }>3D</option>
              <option value='3DMax' ${vo.em_occupations == "3DMax" ? "selected=selected" : "" }>3DMax</option>
              <option value='백터3D' ${vo.em_occupations == "백터3D" ? "selected=selected" : "" }>백터3D</option>
              <option value='Maya' ${vo.em_occupations == "Maya" ? "selected=selected" : "" }>Maya</option>
              <option value='일러스트레이터' ${vo.em_occupations == "일러스트레이터" ? "selected=selected" : "" }>일러스트레이터</option>
              <option value='포토샵' ${vo.em_occupations == "포토샵" ? "selected=selected" : "" }>포토샵</option>
              <option value='디렉터' ${vo.em_occupations == "디렉터" ? "selected=selected" : "" }>디렉터</option>
              <option value='CG' ${vo.em_occupations == "CG" ? "selected=selected" : "" }>CG</option>
              <option value='코렐드로우' ${vo.em_occupations == "코렐드로우" ? "selected=selected" : "" }>코렐드로우</option>
              <option value='도트디자인' ${vo.em_occupations == "도트디자인" ? "selected=selected" : "" }>도트디자인</option>
              <option value='시각디자인' ${vo.em_occupations == "시각디자인" ? "selected=selected" : "" }>시각디자인</option>
              <option value='CI' ${vo.em_occupations == "CI" ? "selected=selected" : "" }>CI</option>
              <option value='SIGN' ${vo.em_occupations == "SIGN" ? "selected=selected" : "" }>SIGN</option>
              <option value='아바타디자인' ${vo.em_occupations == "아바타디자인" ? "selected=selected" : "" }>아바타디자인</option>
              <option value='POP' ${vo.em_occupations == "POP" ? "selected=selected" : "" }>POP</option>
              <option value='GUI' ${vo.em_occupations == "GUI" ? "selected=selected" : "" }>GUI</option>
             </optgroup>
             <optgroup label="미디어">
              <option value='선택'>선택</option>
              <option value='PD·연출' ${vo.em_occupations == "PD·연출" ? "selected=selected" : "" }>PD·연출</option>
              <option value='AD·조연출' ${vo.em_occupations == "AD·조연출" ? "selected=selected" : "" }>AD·조연출</option>
              <option value='FD·연출보조' ${vo.em_occupations == "FD·연출보조" ? "selected=selected" : "" }>FD·연출보조</option>
              <option value='방송기획' ${vo.em_occupations == "방송기획" ? "selected=selected" : "" }>방송기획</option>
              <option value='방송제작' ${vo.em_occupations == "방송제작" ? "selected=selected" : "" }>방송제작</option>
              <option value='방송편성' ${vo.em_occupations == "방송편성" ? "selected=selected" : "" }>방송편성</option>
              <option value='방송엔지니어' ${vo.em_occupations == "방송엔지니어" ? "selected=selected" : "" }>방송엔지니어</option>
             </optgroup>
          </select>
         </th>
         <th>고용 형태</th>
         <th>
          <input type='checkbox' name='em_et' value='정규직' >정규직
          <input type='checkbox' name='em_et' value='비정규직' >비정규직
          <input type='checkbox' name='em_et' value='계약직' >계약직
          <input type='checkbox' name='em_et' value='병역특례' >병역특례
          <input type='checkbox' name='em_et' value='인턴직' >인턴직
          <input type='checkbox' name='em_et' value='프리랜서' >프리랜서
          <input type='checkbox' name='em_et' value='핸드헌팅' >핸드헌팅
          <input type='checkbox' name='em_et' value='파견대행' >파견대행
         </th>
       </tr>  
       <tr>
         <th>최종학력</th>
         <th>
          <select name='em_lastschool'>
            <option value='선택' selected="selected">선택</option>
            <option value='초등학교 졸업' ${vo.em_lastschool == "초등학교 졸업" ? "selected=selected" : "" }>초등학교 졸업</option>
            <option value='중학교 졸업' ${vo.em_lastschool == "중학교 졸업" ? "selected=selected" : "" }>중학교 졸업</option>
            <option value='방송엔지니어' ${vo.em_lastschool == "방송엔지니어" ? "selected=selected" : "" }>방송엔지니어</option>
            <option value='대학(2,3년) 졸업' ${vo.em_lastschool == "대학(2,3년) 졸업" ? "selected=selected" : "" }>대학(2,3년) 졸업</option>
            <option value='대학교(4년) 졸업' ${vo.em_lastschool == "대학교(4년) 졸업" ? "selected=selected" : "" }>대학교(4년) 졸업</option>
            <option value='대학원 (석사) 졸업' ${vo.em_lastschool == "대학원 (석사) 졸업" ? "selected=selected" : "" }>대학원 (석사) 졸업</option>
            <option value='대학원 (박사) 졸업' ${vo.em_lastschool == "대학원 (박사) 졸업" ? "selected=selected" : "" }>대학원 (박사) 졸업</option>
          </select>
         </th>
         <th>급여</th>
         <th>
          <select name='em_salary'>
            <option value='선택' selected="selected">선택</option>
            <option value='회사내규에 따름' ${vo.em_salary == "회사내규에 따름" ? "selected=selected" : "" }>회사내규에 따름</option>
            <option value='면접후 결정' ${vo.em_salary == "면접후 결정" ? "selected=selected" : "" }>면접후 결정</option>
            <option value='1400 만원 이하' ${vo.em_salary == "1400 만원 이하" ? "selected=selected" : "" }>1400 만원 이하</option>
            <option value='1400 ~ 1600 만원' ${vo.em_salary == "1400 ~ 1600 만원" ? "selected=selected" : "" }>1400 ~ 1600 만원</option>
            <option value='1600 ~ 1800 만원' ${vo.em_salary == "1600 ~ 1800 만원" ? "selected=selected" : "" }>1600 ~ 1800 만원</option>
            <option value='1800 ~ 2000 만원' ${vo.em_salary == "1800 ~ 2000 만원" ? "selected=selected" : "" }>1800 ~ 2000 만원</option>
            <option value='2000 ~ 2200 만원' ${vo.em_salary == "2000 ~ 2200 만원" ? "selected=selected" : "" }>2000 ~ 2200 만원</option>
            <option value='2200 ~ 2400 만원' ${vo.em_salary == "2200 ~ 2400 만원" ? "selected=selected" : "" }>2200 ~ 2400 만원</option>            
            <option value='2400 ~ 2600 만원' ${vo.em_salary == "2400 ~ 2600 만원" ? "selected=selected" : "" }>2400 ~ 2600 만원</option>
            <option value='2600 ~ 2800 만원' ${vo.em_salary == "2600 ~ 2800 만원" ? "selected=selected" : "" }>2600 ~ 2800 만원</option>
            <option value='2800 ~ 3000 만원' ${vo.em_salary == "2800 ~ 3000 만원" ? "selected=selected" : "" }>2800 ~ 3000 만원</option>
          </select>
         </th>
       </tr>
       <tr>
         <th>직급</th>
         <th>
          <select name='em_rank'>
            <option value='선택' selected="selected">선택</option>
            <option value='사원' ${vo.em_rank == "사원" ? "selected=selected" : "" }>사원</option>
            <option value='주임' ${vo.em_rank == "주임" ? "selected=selected" : "" }>주임</option>
            <option value='대리' ${vo.em_rank == "대리" ? "selected=selected" : "" }>대리</option>
            <option value='과장' ${vo.em_rank == "과장" ? "selected=selected" : "" }>과장</option>
            <option value='차장' ${vo.em_rank == "차장" ? "selected=selected" : "" }>차장</option>
            <option value='부장' ${vo.em_rank == "부장원" ? "selected=selected" : "" }>부장</option>
            <option value='임원' ${vo.em_rank == "임원" ? "selected=selected" : "" }>임원</option>
            <option value='이사' ${vo.em_rank == "이사" ? "selected=selected" : "" }>이사</option>
            <option value='부사장' ${vo.em_rank == "부사장" ? "selected=selected" : "" }>부사장</option>
            <option value='사장' ${vo.em_rank == "사장" ? "selected=selected" : "" }>사장</option>
          </select>
         </th>
         <th>직책</th>
         <th>
          <select name='em_position'>
            <option value='선택' selected="selected">선택</option>
            <option value='팀원' ${vo.em_position == "팀원" ? "selected=selected" : "" }>팀원</option>
            <option value='팀장' ${vo.em_position == "팀장" ? "selected=selected" : "" }>팀장</option>
            <option value='매니저' ${vo.em_position == "매니저" ? "selected=selected" : "" }>매니저</option>
            <option value='파트장' ${vo.em_position == "파트장" ? "selected=selected" : "" }>파트장</option>
            <option value='실장' ${vo.em_position == "실장" ? "selected=selected" : "" }>실장</option>
            <option value='지점장' ${vo.em_position == "지점장" ? "selected=selected" : "" }>지점장</option>
            <option value='지사장' ${vo.em_position == "지사장" ? "selected=selected" : "" }>지사장</option>
            <option value='원장' ${vo.em_position == "원장" ? "selected=selected" : "" }>원장</option>
            <option value='국장' ${vo.em_position == "국장" ? "selected=selected" : "" }>국장</option>
            <option value='본부장' ${vo.em_position == "본부장" ? "selected=selected" : "" }>본부장</option>
            <option value='센터장' ${vo.em_position == "센터장" ? "selected=selected" : "" }>센터장</option>
            <option value='공장장' ${vo.em_position == "공장장" ? "selected=selected" : "" }>공장장</option>
            <option value='그룹장' ${vo.em_position == "그룹장" ? "selected=selected" : "" }>그룹장</option>
          </select>
         </th>
       </tr> 
        
       <tr>
        <th>채용 접수 시작일</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_startdate' id='em_startdate' value='${vo.em_startdate }' 
          required="required">
         </th>
       </tr>
       <tr>
        <th>채용 접수 마감일</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_enddate' id='em_enddate' value='${vo.em_enddate }' 
          required="required">
         </th>
       </tr>
       <tr>
        <th>채용 서류 발표일</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_statedate' id='em_statedate' value='${vo.em_statedate }' 
          required="required">
         </th>
       </tr>
       <tr>
        <th>채용 면접 일자</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_interviewdate' id='em_interviewdate' 
          value='${vo.em_interviewdate }' required="required">
         </th>
       </tr>
       <tr>
       </tr>
    </table> 
          
      <div class="form-group">   
        <label for="em_supportformfile1MF" class="col-xs-2 col-lg-3 control-label">지원양식 파일명</label>
<!--         <label for="em_supportformfile1MF" class="col-xs-2 col-lg-3 control-label">업로드 파일</label> -->
        <div class="col-xs-4 col-lg-4">
          <input type="file" class="form-control" name='em_supportformfile1MF' id='em_supportformfile1MF' 
           size='40' >
          <br>
        </div>
      </div> 
      
      <div class="form-group">   
         <label for="content" class="col-xs-2 col-lg-2 control-label">등록된 파일</label>
         <span>
          <c:if test="${vo.em_supportformsize1 > 0}">
           <A href='${pageContext.request.contextPath}/download?dir=/employment_information/storage&filename=${vo.em_supportformfile1}'>
                    ${vo.em_supportformfile1}</A> (${vo.size2Label})
          </c:if>
         </span>
         <div class="col-xs-10 col-lg-10">
                <c:set var='em_supportformfile1' value="${fn:toLowerCase(vo.em_supportformfile1)}" />
                <c:choose>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.doc')}">
                    <IMG src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.docx')}">
                    <IMG id='file2'  src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.hwp')}">
                    <IMG id='file2'  src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:when test="${fn:endsWith(em_supportformfile1, '.ppt')}">
                    <IMG id='file2'  src='./storage/${vo.em_supportformfile1}' >
                  </c:when>
                  <c:when test="${vo.em_supportformfile1.length() > 0}">
                   ${vo.em_supportformfile1 } 
                  </c:when>
            </c:choose>
          </div>
        </div>
        <br>
  </div>
  <BR> 
                   
       <DIV class="" style='text-align: right;'>
         <button type="submit" class="btn btn-default">수정</button>
         <button type='button' class="btn btn-default" onclick="location.reload();">새로 고침</button>
       </DIV>
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