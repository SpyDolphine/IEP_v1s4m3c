<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<!-- <title>★★★ 각 게시판 이름을 적어주세요 ! </title>     -->
<title> 채용정보 등록 </title> 
 
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
<!--                                 <i class="fa fa-arrow-circle-right"> ex. 커뮤니티 </i>   ★★★ 각 게시판 이름을 적어주세요 !  -->
                                <i class="fa fa-arrow-circle-right"> 채용정보 등록 </i>   <!-- ★★★ 각 게시판 이름을 적어주세요 ! -->
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
   
   <FORM name='frm' method='POST' class="form-horizontal" action='./create.do'  
       onsubmit="return send();" enctype="multipart/form-data">
       
     <div class="content" style='position: relative; padding: 10px 10px; background-color: #f0f0f0;'>
      <div class="form-group">
       <label for='em_title' class="col-xs-2 col-lg-3 control-label">채용 제목</label>
       <div class="col-xs-2 col-lg-7">
        <input type='text' class="form-control" name='em_title' id='em_title' value='' 
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
        </textarea>
        <BR>
       </DIV>
       <label for='em_pi' class="col-xs-2 col-lg-3 control-label">우대 사항</label>
       <div class="col-xs-2 col-lg-7">
        <textarea class="form-control" name='em_pi' id='em_pi'  rows='10' cols='20'>
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
        </textarea>
        <BR>
       </div>
       <label for='em_howtoapply' class="col-xs-2 col-lg-3 control-label">지원방법</label>
       <div class="col-xs-2 col-lg-7">
        <input type='text' class="form-control" name='em_howtoapply' id='em_howtoapply' value='' 
         required="required">
       </div>
      </DIV> 
      <div class="form-group">   
       <label for='em_url' class="col-xs-2 col-lg-3 control-label">기타</label>
      </DIV>
      <DIV class="form-group">
       <label for='em_url' class="col-xs-2 col-lg-3 control-label">홈페이지</label>
       <div class="col-xs-2 col-lg-7">
        <input type='url' class="form-control" name='em_url' id='em_url' value='' 
         required="required">
       </DIV>
       <BR>
       <BR>
       <label for='em_workplace' class="col-xs-2 col-lg-3 control-label">근무지</label>
       <div class="col-xs-2 col-lg-7">
        <input type='text' class="form-control" name='em_workplace' id='em_workplace' value='' 
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
               <option value='기획'>기획</option>
               <option value='전략'>전략</option>
               <option value='사업기획'>사업기획</option>
               <option value='사업제휴'>사업제휴</option>
               <option value='타당성분석'>타당성분석</option>
               <option value='CEO'>CEO</option>
               <option value='MBA'>MBA</option>
               <option value='경영기획'>경영기획</option>
               <option value='경영혁신'>경영혁신</option>
               <option value='기획조사'>기획조사</option>
               <option value='조직관리'>조직관리</option>
               <option value='변화관리'>변화관리</option>
               <option value='경영혁신'>경영혁신</option>
               <option value='출판기획'>출판기획</option>
             </optgroup>
             <optgroup label="마케팅·무역·유통">
              <option value='선택'>선택</option>
              <option value='CMO'>CMO</option>
              <option value='마케팅'>마케팅</option>
              <option value='마케팅기획'>마케팅기획</option>
              <option value='업무제휴'>업무제휴</option>
              <option value='판촉'>판촉</option>
              <option value='시장분석'>시장분석</option>
              <option value='전시'>전시</option>
              <option value='국제회의'>국제회의</option>
              <option value='브랜딩'>브랜딩</option>
              <option value='프로모션'>프로모션</option>
              <option value='광고기획'>광고기획</option>
              <option value='라이센싱'>라이센싱</option>
              <option value='IMC'>IMC</option>
              <option value='CRM'>CRM</option>
              <option value='소셜미디어'>소셜미디어</option>
              <option value='퍼블리싱'>퍼블리싱</option>
              <option value='바이럴마케팅'>바이럴마케팅</option>
             </optgroup>
             <optgroup label="영업·고객상담">
              <option value='선택'>선택</option>
              <option value='영업기획'>영업기획</option>
              <option value='장비영업'>장비영업</option>
              <option value='기술영업'>기술영업</option>
              <option value='국내영업'>국내영업</option>
              <option value='해외영업'>해외영업</option>
              <option value='제약영업'>제약영업</option>
              <option value='제약영업'>자동차영업</option>
              <option value='의료기영업'>의료기영업</option>
              <option value='화장품영업'>화장품영업</option>
              <option value='일반영업'>일반영업</option>
              <option value='법인영업'>법인영업</option>
              <option value='납품영업'>납품영업</option>
              <option value='중고차딜러'>중고차딜러</option>
              <option value='주류영업'>주류영업</option>
              <option value='식품영업'>식품영업</option>
              <option value='상조영업'>상조영업</option>
             </optgroup>
             <optgroup label="IT·인터넷">
              <option value='선택'>선택</option>
              <option value='웹 프로그래머'>웹 프로그래머</option>
              <option value='asp'>asp</option>
              <option value='jsp'>jsp</option>
              <option value='Java'>Java</option>
              <option value='Servlet'>servlet</option>
              <option value='CORBA'>CORBA</option>
              <option value='php'>php</option>
              <option value='cgi'>cgi</option>
              <option value='xml'>xml</option>
              <option value='SQL'>SQL</option>
              <option value='SQL'>MySQL</option>
              <option value='wml'>wml</option>
              <option value='AJAX'>AJAX</option>
              <option value='MS-SQL'>MS-SQL</option>
              <option value='WinForm'>WinForm</option>
              <option value='ASP.NET'>ASP.NET</option>
              <option value='MiPlatform'>MiPlatform</option>
             </optgroup>
             <optgroup label="연구개발·설계">
              <option value='선택'>선택</option>
              <option value='김치찌게'>기구설계</option>
              <option value='참치찌게'>기술연구소</option>
              <option value='기술직'>기술직</option>
              <option value='기술직'>메카트로닉스</option>
              <option value='기술직'>생산기술</option>
              <option value='기술직'>연구관리</option>
              <option value='기술직'>연구원</option>
              <option value='기술직'>제어</option>
              <option value='기술직'>제품개발</option>
              <option value='기술직'>CTO</option>
              <option value='기술직'>R&D</option>
              <option value='기술직'>기계</option>
              <option value='기술직'>금속</option>
              <option value='기술직'>조선</option>
              <option value='기술직'>철강</option>
              <option value='기술직'>건설</option>
              <option value='기술직'>건축</option>
              <option value='기술직'>금형설계</option>
              <option value='기술직'>catia</option>
              <option value='기술직'>플랜트</option>
             </optgroup>
             <optgroup label="생산·제조">
              <option value='선택'>선택</option>
              <option value='생산'>생산</option>
              <option value='품질'>품질</option>
              <option value='생산관리'>생산관리</option>
              <option value='품질관리'>품질관리</option>
              <option value='자재관리'>자재관리</option>
              <option value='공정관리'>공정관리</option>
              <option value='안전'>안전</option>
              <option value='환경관리'>환경관리</option>
              <option value='원가관리'>원가관리</option>
              <option value='ISO'>ISO</option>
              <option value='공정'>공정</option>
              <option value='TPM'>TPM</option>
              <option value='6시그마'>6시그마</option>
              <option value='공장장'>공장장</option>
              <option value='QA'>QA</option>
              <option value='품질보증'>품질보증</option>
              <option value='품질검사'>품질검사</option>
              <option value='HACCP'>HACCP</option>
             </optgroup>
             <optgroup label="전문·특수직">
              <option value='선택'>선택</option>
              <option value='컨설턴트'>컨설턴트</option>
              <option value='금융컨설팅'>금융컨설팅</option>
              <option value='경영컨설팅'>경영컨설팅</option>
              <option value='창업컨설팅'>창업컨설팅</option>
              <option value='매너컨설팅'>매너컨설팅</option>
              <option value='웹컨설팅'>웹컨설팅</option>
              <option value='경영기획'>경영기획</option>
              <option value='IPO'>IPO</option>
              <option value='기업심사'>기업심사</option>
              <option value='투자심사'>투자심사</option>
              <option value='MBA'>MBA</option>
              <option value='애널리스트'>애널리스트</option>
              <option value='HR컨설팅'>HR컨설팅</option>
              <option value='경영분석'>경영분석</option>
              <option value='M&A'>M&A</option>
              <option value='투자자문'>투자자문</option>
             </optgroup>
             <optgroup label="디자인">
              <option value='선택'>선택</option>
              <option value='그래픽디자인'>그래픽디자인</option>
              <option value='3D'>3D</option>
              <option value='3DMax'>3DMax</option>
              <option value='백터3D'>백터3D</option>
              <option value='Maya'>Maya</option>
              <option value='일러스트레이터'>일러스트레이터</option>
              <option value='포토샵'>포토샵</option>
              <option value='디렉터'>디렉터</option>
              <option value='CG'>CG</option>
              <option value='코렐드로우'>코렐드로우</option>
              <option value='도트디자인'>도트디자인</option>
              <option value='시각디자인'>시각디자인</option>
              <option value='CI'>CI</option>
              <option value='SIGN'>SIGN</option>
              <option value='아바타디자인'>아바타디자인</option>
              <option value='POP'>POP</option>
              <option value='GUI'>GUI</option>
             </optgroup>
             <optgroup label="미디어">
              <option value='선택'>선택</option>
              <option value='PD·연출'>PD·연출 </option>
              <option value='AD·조연출'>AD·조연출</option>
              <option value='FD·연출보조'>FD·연출보조</option>
              <option value='방송기획'>방송기획</option>
              <option value='방송제작'>방송제작</option>
              <option value='방송편성'>방송편성</option>
              <option value='방송엔지니어'>방송엔지니어</option>
             </optgroup>
          </select>
         </th>
         <th>고용 형태</th>
         <th>
          <input type='checkbox' name='em_et' value='정규직'>정규직
          <input type='checkbox' name='em_et' value='비정규직'>비정규직
          <input type='checkbox' name='em_et' value='계약직'>계약직
          <input type='checkbox' name='em_et' value='병역특례'>병역특례
          <input type='checkbox' name='em_et' value='인턴직'>인턴직
          <input type='checkbox' name='em_et' value='프리랜서'>프리랜서
          <input type='checkbox' name='em_et' value='핸드헌팅'>핸드헌팅
          <input type='checkbox' name='em_et' value='파견대행'>파견대행
         </th>
       </tr>  
       <tr>
         <th>최종학력</th>
         <th>
          <select name='em_lastschool'>
            <option value='선택' selected="selected">선택</option>
            <option value='초등학교 졸업'>초등학교 졸업</option>
            <option value='중학교 졸업'>중학교 졸업</option>
            <option value='고등학교 졸업'>고등학교 졸업</option>
            <option value='대학(2,3년) 졸업'>대학(2,3년) 졸업</option>
            <option value='대학교(4년) 졸업'>대학교(4년) 졸업</option>
            <option value='대학원 (석사) 졸업'>대학원 (석사) 졸업</option>
            <option value='대학원 (박사) 졸업'>대학원 (박사) 졸업</option>
          </select>
         </th>
         <th>급여</th>
         <th>
          <select name='em_salary'>
            <option value='선택' selected="selected">선택</option>
            <option value='회사내규에 따름'>회사내규에 따름</option>
            <option value='면접후 결정'>면접후 결정</option>
            <option value='1400 만원 이하'>1400 만원 이하</option>
            <option value='1400 ~ 1600 만원'>1400 ~ 1600 만원</option>
            <option value='1600 ~ 1800 만원'>1600 ~ 1800 만원</option>
            <option value='1800 ~ 2000 만원'>1800 ~ 2000 만원</option>
            <option value='2000 ~ 2200 만원'>2000 ~ 2200 만원</option>
            <option value='2200 ~ 2400 만원'>2200 ~ 2400 만원</option>
            <option value='2400 ~ 2600 만원'>2400 ~ 2600 만원</option>
            <option value='2600 ~ 2800 만원'>2600 ~ 2800 만원</option>
            <option value='2800 ~ 3000 만원'>2800 ~ 3000 만원</option>
          </select>
         </th>
       </tr>
       <tr>
         <th>직급</th>
         <th>
          <select name='em_rank'>
            <option value='선택' selected="selected">선택</option>
            <option value='사원'>사원</option>
            <option value='주임'>주임</option>
            <option value='대리'>대리</option>
            <option value='과장'>과장</option>
            <option value='차장'>차장</option>
            <option value='부장'>부장</option>
            <option value='임원'>임원</option>
            <option value='이사'>이사</option>
            <option value='이사'>부사장</option>
            <option value='사장'>사장</option>
          </select>
         </th>
         <th>직책</th>
         <th>
          <select name='em_position'>
            <option value='선택' selected="selected">선택</option>
            <option value='팀원'>팀원</option>
            <option value='팀장'>팀장</option>
            <option value='매니저'>매니저</option>
            <option value='파트장'>파트장</option>
            <option value='실장'>실장</option>
            <option value='지점장'>지점장</option>
            <option value='지사장'>지사장</option>
            <option value='원장'>원장</option>
            <option value='국장'>국장</option>
            <option value='본부장'>본부장</option>
            <option value='센터장'>센터장</option>
            <option value='공장장'>공장장</option>
            <option value='그룹장'>그룹장</option>
          </select>
         </th>
       </tr> 
        
       <tr>
        <th>채용 접수 시작일</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_startdate' id='em_startdate' value='' 
          required="required">
         </th>
       </tr>
       <tr>
        <th>채용 접수 마감일</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_enddate' id='em_enddate' value='' 
          required="required">
         </th>
       </tr>
       <tr>
        <th>채용 서류 발표일</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_statedate' id='em_statedate' value='' 
          required="required">
         </th>
       </tr>
       <tr>
        <th>채용 면접 일자</th>
        <th>
         <input type="datetime-local" class="form-control" name='em_interviewdate' id='em_interviewdate' value='' 
          required="required">
         </th>
       </tr>
       <tr>
        <th colspan="2" style="font-family: 'Apple SD Gothic Neo', Tahoma, Verdana, '맑은 고딕','Malgun Gothic', 
             '나눔고딕', NanumGothic, '돋움', dotum, Arial, sans-serif;">${vo.ei_ci }
        </th>
       </tr>
    </table>   
      <div class="form-group">   
        <label for="em_supportformfile1MF" class="col-xs-2 col-lg-3 control-label">지원양식 파일명</label>
        <div class="col-xs-4 col-lg-4">
          <input type="file" class="form-control" name='em_supportformfile1MF' id='em_supportformfile1MF' 
           size='40' >
          <br>
<!--           Preview(미리보기) 이미지 자동 생성됩니다. -->
        </div>
      </div> 
  </div>
  <BR> 
                   
       <DIV class="" style='text-align: right;'>
         <button type="submit" class="btn btn-default">등록</button>
         <button type='button' class="btn btn-default" onclick="location.reload();">새로 고침</button>
         <button type="button" class="btn btn-default" onclick="location.href='./list.do'">취소(목록)</button>
       </DIV>
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