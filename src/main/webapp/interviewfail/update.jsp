<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    

<!-- Button trigger modal -->
 <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">수정</button>
 
 <div class="container">  
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <p class="modal-title" id="myModalLabel"><h4>취업 실패 후기 수정
         <span class="glyphicon glyphicon-inbox"></span></h4></p>
      </div>
      
      <FORM name='frm' method='POST' action='./update.do'>
      <input type='hidden' name='if_no' id='if_no' value='${ifVO.if_no}'> 
      <div class="modal-body">
      <!-- 내용 -->
      <div>
        <label for='if_id'>이메일(익명)</label>
        <input type='text' name='if_id' id='if_id' value='익명' required="required">
        &nbsp; &nbsp;
        <label for='if_nick'>아이디(익명)</label>
        <input type='text' name='if_nick' id='if_nick' value='익명' required="required">
      </div>
      <div>
        <label for='if_gender'>성별</label>&nbsp;
          <input type='radio' name='if_gender' id='if_gender' value='${ifVO.if_gender}' checked>${ifVO.if_gender}
          <input type='radio' name='if_gender' id='if_gender' value='남자'> 남자
          <input type='radio' name='if_gender' id='if_gender' value='여자'> 여자
          <input type='radio' name='if_gender' id='if_gender' value='그외'> 그외
      </div>
      <div>  
        <label for='if_company'>취업지원직종 IT></label>
        <select name='if_company' id='if_company'>
           <option value="${ifVO.if_company}" selected="selected">${ifVO.if_company}</option>
           <option value="상세직종">상세직종</option>
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
        <label for='if_position'>직급 및 직무</label>
        <select name='if_position' id='if_position'>
           <option value="${ifVO.if_position}" selected="selected">${ifVO.if_position}</option>
           <option value="직급 및 직무">직급 및 직무</option>
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
        <label for='if_region'>근무지역</label>
        <select name='if_region' id='if_region'>
           <option value="${ifVO.if_region}" selected="selected">${ifVO.if_region}</option>
           <option value="서울">서울</option>
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
      </div> 
<!--       <div>
        <label for='if_title'>후기 한줄평</label><br>
        <textarea name='if_title' id='if_title' rows='2' style='width: 100%;' placeholder="총 평을 간략하게 적어주세요" required="required"></textarea>
      </div>   -->
      <div>
        <label for='if_title'>후기 한줄평</label>
        <input type='text' maxlength='25' name='if_title' id='if_title' value='${ifVO.if_title}' style='width: 100%;' required="required">
      </div>            
      <div>
        <label for='if_content'>취업과정</label><br>
        <textarea name='if_content' id='if_content' rows='5' style='width: 100%;' required="required">${ifVO.if_content}</textarea>
      </div>  
      <div>
        <label for='if_q'>면접 질문</label><br>
        <textarea name='if_q' id='if_q' rows='10' style='width: 100%;' required="required">${ifVO.if_q}</textarea>
      </div>  
      <div>
        <label for='if_a'>면접 답변</label><br>
        <textarea name='if_a' id='if_a' rows='10' style='width: 100%;' required="required">${ifVO.if_a}</textarea>
      </div>        
      <div>  
        <label for='if_level'>면접 난이도</label>
        <select name='if_level' id='if_level'>
           <option value="${ifVO.if_level}" selected="selected">${ifVO.if_level}</option>
           <option value="★">★</option>
           <option value="★★">★★</option>
           <option value="★★★">★★★</option>
           <option value="★★★★">★★★★</option>
           <option value="★★★★★">★★★★★</option>
        </select>
      </div>
      <div>
        <label for='if_exper'>면접경험</label>&nbsp;
          <input type='radio' name='if_exper' id='if_exper' value='${ifVO.if_exper}' checked>${ifVO.if_exper}
          <input type='radio' name='if_exper' id='if_exper' value='잘 모르겠다'> 잘 모르겠다
          <input type='radio' name='if_exper' id='if_exper' value='부정적'> 부정적
          <input type='radio' name='if_exper' id='if_exper' value='보통'> 보통
          <input type='radio' name='if_exper' id='if_exper' value='긍정적'> 긍정적
      </div>   
      <div>
        <label for='if_where'>취업경로</label>&nbsp;
          <input type='radio' name='if_where' id='if_where' value='${ifVO.if_where}' checked>${ifVO.if_where}
          <input type='radio' name='if_where' id='if_where' value='온라인지원'> 온라인지원
          <input type='radio' name='if_where' id='if_where' value='추천'> 추천
          <input type='radio' name='if_where' id='if_where' value='공개채용'> 공개채용
          <input type='radio' name='if_where' id='if_where' value='취업지원센터'> 취업지원센터
          <input type='radio' name='if_where' id='if_where' value='헤드헌터'> 헤드헌터
          <input type='radio' name='if_where' id='if_where' value='기타'> 기타
      </div> 
      <div>
        <label for='if_how'>채용방식</label>&nbsp;
          <input type='radio' name='if_how' id='if_how' value='${ifVO.if_how}' checked>${ifVO.if_how}
          <input type='radio' name='if_how' id='if_how' value='인/적성검사'> 인/적성검사
          <input type='radio' name='if_how' id='if_how' value='그룹면접'> 그룹면접
          <input type='radio' name='if_how' id='if_how' value='개인면접'> 개인면접
          <input type='radio' name='if_how' id='if_how' value='토론'> 토론
          <input type='radio' name='if_how' id='if_how' value='임원면접'> 임원면접
          <input type='radio' name='if_how' id='if_how' value='기타'> 기타 
          <!-- <input type='text' name='if_how' id='if_how' placeholder='입력해주세요' required="required"> -->
      </div>  
      <div>
        <label for='if_when'>발표시기</label>
        <input type='text' name='if_when' id='if_when' value='${ifVO.if_when}' required="required">
      </div>        
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button"  class="btn btn-default" onclick="location.href='./list.do?if_no=${ifVO.if_no}'">목록</button>
        <button type="submit" class="btn btn-primary">저장</button>
      </div>
      </FORM>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 -->
 
</div>
