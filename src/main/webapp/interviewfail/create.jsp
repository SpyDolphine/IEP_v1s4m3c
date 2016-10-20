<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
$(function(){
 
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>새 글 등 록</DIV>
 
<DIV class='content' style='width: 50%;'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='if_id'>이메일(익명)</label>
        <input type='text' name='if_id' id='if_id' value='익명' required="required">
           &nbsp; &nbsp;
        <label class='label' for='if_nick'>아이디(익명)</label>
        <input type='text' name='if_nick' id='if_nick' value='익명' required="required">
      </li>
      <li>
        <label class='label' for='if_gender'>성별</label>&nbsp;
          <input type='radio' name='if_gender' id='if_gender' value='남자'> 남자
          <input type='radio' name='if_gender' id='if_gender' value='여자'> 여자
          <input type='radio' name='if_gender' id='if_gender' value='그외'> 그외
      </li>
      <li>  
        <label class='label' for='if_company'>취업지원직종 IT></label>
        <select name='if_company' id='if_company'>
           <option value="상세직종" selected="selected">상세직종</option>
           <option value="DBA(Database Admin.)">DBA(Database Admin.)</option>
           <option value="ERP">ERP</option>
           <option value="QA(Quality Assurance)">QA(Quality Assurance)</option>
           <option value="게임개발">게임개발</option>
           <option value="기획">기획</option>
           <option value="네트워크/보안/운영">네트워크/보안/운영</option>
           <option value="데이터분석">데이터분석</option>
           <option value="모바일앱개발">모바일앱개발</option>
           <option value="소프트웨어아키텍트">소프트웨어아키텍트</option>
           <option value="소프트웨어엔지니어">소프트웨어엔지니어</option>
           <option value="시스템엔지니어">시스템엔지니어</option>
           <option value="웹개발">웹개발</option>
           <option value="웹퍼블리셔">웹퍼블리셔</option>
           <option value="프로젝트매니저">프로젝트매니저</option>
           <option value="하드웨어엔지니어">하드웨어엔지니어</option>
           <option value="기타">기타</option>
        </select>
        &nbsp; &nbsp;
        <label class='label' for='if_position'>직급 및 직무</label>
        <select name='if_position' id='if_position'>
           <option value="직급 및 직무" selected="selected">직급 및 직무</option>
           <option value="사원-대졸">사원-대졸</option>
           <option value="사원-전문대졸">사원-전문대졸</option>
           <option value="사원-고졸">사원-고졸</option>
           <option value="주임/계장">주임/계장</option>
           <option value="대리">대리</option>
           <option value="과장">과장</option>
           <option value="차장">차장</option>
           <option value="부장">부장</option>
           <option value="이사">이사</option>
           <option value="상무">상무</option>
           <option value="전무">전무</option>
           <option value="부사장">부사장</option>
           <option value="사장">사장</option>
           <option value="기타">기타</option>
        </select> 
        &nbsp; &nbsp; 
        <label class='label' for='if_region'>근무지역</label>
        <select name='if_region' id='if_region'>
           <option value="서울" selected="selected">서울</option>
           <option value="인천">인천</option>
           <option value="대구">대구</option>
           <option value="대전">대전</option>
           <option value="광주">광주</option>
           <option value="울산">울산</option>
           <option value="부산">부산</option>
           <option value="경기">경기</option>
           <option value="강원">강원</option>
           <option value="경북">경북</option>
           <option value="경남">경남</option>
           <option value="전북">전북</option>
           <option value="전남">전남</option>
           <option value="충남">충남</option>
           <option value="충북">충북</option>
           <option value="제주">제주</option>
           <option value="해외">해외</option>
        </select>
      </li> 
      <li>
        <label for='if_title'>후기 한줄평</label><br>
        <textarea name='if_title' id='if_title' rows='2' style='width: 100%;' placeholder="총 평을 간략하게 적어주세요" required="required"></textarea>
      </li>        
      <li>
        <label for='if_content'>취업과정</label><br>
        <textarea name='if_content' id='if_content' rows='5' style='width: 100%;' placeholder="서류준비/포폴 및 면접과정" required="required"></textarea>
      </li>  
      <li>
        <label for='if_q'>면접 질문</label><br>
        <textarea name='if_q' id='if_q' rows='10' style='width: 100%;' placeholder="면접 질문에 대해 상세하게 적어주세요" required="required"></textarea>
      </li>  
      <li>
        <label for='if_a'>면접 답변</label><br>
        <textarea name='if_a' id='if_a' rows='10' style='width: 100%;' placeholder="면접 답변에 대해 상세하게 적어주세요" required="required"></textarea>
      </li>        
      <li>  
        <label class='label' for='if_level'>면접 난이도</label>
        <select name='if_level' id='if_level'>
           <option value="1" selected="selected">★</option>
           <option value="2">★★</option>
           <option value="3">★★★</option>
           <option value="4">★★★★</option>
           <option value="5">★★★★★</option>
        </select>
      </li>
      <li>
        <label class='label' for='if_exper'>면접경험</label>&nbsp;
          <input type='radio' name='if_exper' id='if_exper' value='잘 모르겠다'> 잘 모르겠다
          <input type='radio' name='if_exper' id='if_exper' value='부정적'> 부정적
          <input type='radio' name='if_exper' id='if_exper' value='보통'> 보통
          <input type='radio' name='if_exper' id='if_exper' value='긍정적'> 긍정적
      </li>   
      <li>
        <label class='label' for='if_where'>취업경로</label>&nbsp;
          <input type='radio' name='if_where' id='if_where' value='온라인지원'> 온라인지원
          <input type='radio' name='if_where' id='if_where' value='추천'> 추천
          <input type='radio' name='if_where' id='if_where' value='공개채용'> 공개채용
          <input type='radio' name='if_where' id='if_where' value='취업지원센터'> 취업지원센터
          <input type='radio' name='if_where' id='if_where' value='헤드헌터'> 헤드헌터
          <input type='radio' name='if_where' id='if_where' value='기타'> 기타
      </li> 
      <li>
        <label class='label' for='if_how'>채용방식</label>&nbsp;
          <input type='radio' name='if_how' id='if_how' value='인/적성검사'> 인/적성검사
          <input type='radio' name='if_how' id='if_how' value='그룹면접'> 그룹면접
          <input type='radio' name='if_how' id='if_how' value='개인면접'> 개인면접
          <input type='radio' name='if_how' id='if_how' value='토론'> 토론
          <input type='radio' name='if_how' id='if_how' value='임원면접'> 임원면접
          <input type='radio' name='if_how' id='if_how' value='기타'> 기타 
          <!-- <input type='text' name='if_how' id='if_how' placeholder='입력해주세요' required="required"> -->
      </li>  
      <li>
        <label class='label' for='if_when'>발표시기</label>
        <input type='text' name='if_when' id='if_id' value='발표시기' required="required">
      </li>        
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 