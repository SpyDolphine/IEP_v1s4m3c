<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>새 글 작성</title>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</head>
  
<body>
 <div class="container">  

<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
성공후기 등록
</button>
 
    
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <p class="modal-title" id="myModalLabel"><h4>취업 성공 후기 작성 게시판
         <span class="glyphicon glyphicon-inbox"></span></h4></p>
      </div>
      
      <FORM name='frm' method='POST' action='./createboot.do' enctype="multipart/form-data"> 
      <div class="modal-body">
      <!-- 내용 -->
      <div>
    <!--     <label for='if_id'>이메일(익명)</label>
        <input type='text' name='if_id' id='if_id' value='익명' required="required">
        &nbsp; &nbsp; -->
        <label for='sc_name'>아이디</label>
        <input type='text' name='sc_name' id='sc_name' value='닉네임' required="required">
      </div>
      <div>
        <label for='sc_gender'>성별</label>&nbsp;
          <input type='radio' name='sc_gender' id='sc_gender' value='남자' checked> 남자
          <input type='radio' name='sc_gender' id='sc_gender' value='여자'> 여자
          <input type='radio' name='sc_gender' id='sc_gender' value='그외'> 그외
      </div>
      <div>  
        <label for='sc_jobs'>취업지원직종 IT></label>
        <select name='sc_jobs' id='sc_jobs' required>
           <option value="" >상세직종</option>
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
        <label for='sc_position'>직급 및 직무</label>
        <select name='sc_position' id='sc_position' required>
           <option value="">직급 및 직무</option>
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
        <label for='sc_area'>근무지역</label>
        <select name='sc_area' id='sc_area' required>
           <option value="" selected="selected">지역</option>
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
      <div>
        <label for='sc_title'>제목</label>
        <input type='text' maxlength='25' name='sc_title' id='sc_title' placeholder='총 평을 간략하게 적어주세요' style='width: 100%;' required="required">
      </div>            
           
      <div>
        <label for='sc_cont'>취업과정</label><br>
        <textarea name='sc_cont' id='sc_cont' rows='5' style='width: 100%;' placeholder="서류준비/포폴 및 면접과정" required="required"></textarea>
      </div>  
      <div>
        <label for='sc_q'>면접 질의응답</label><br>
        <textarea name='sc_q' id='sc_q' rows='10' style='width: 100%;' placeholder="면접 질문에 대해 상세하게 적어주세요" required="required"></textarea>
      </div>  
      <div>
        <label for='sc_tip'>성공 팁</label><br>
        <textarea name='sc_tip' id='sc_tip' rows='10' style='width: 100%;' placeholder="성공 팁에 대해 상세하게 적어주세요" required="required"></textarea>
      </div>        
      <div>  
        <label for='sc_stars'>면접 난이도</label>
        <select name='sc_stars' id='sc_stars' required>
           <option value="" selected="selected">난이도 선택</option>
           <option value="★">★</option>
           <option value="★★">★★</option>
           <option value="★★★">★★★</option>
           <option value="★★★★">★★★★</option>
           <option value="★★★★★">★★★★★</option>
        </select>
      </div>
      <div>
        <label for='sc_ex'>면접경험</label>&nbsp;
          <input type='radio' name='sc_ex' id='sc_ex' value='잘 모르겠다' checked> 잘 모르겠다
          <input type='radio' name='sc_ex' id='sc_ex' value='부정적'> 부정적
          <input type='radio' name='sc_ex' id='sc_ex' value='보통'> 보통
          <input type='radio' name='sc_ex' id='sc_ex' value='긍정적'> 긍정적
      </div>   
      <div>
        <label for='sc_where'>취업경로</label>&nbsp;
          <input type='radio' name='sc_where' id='sc_where' value='온라인지원' checked> 온라인지원
          <input type='radio' name='sc_where' id='sc_where' value='추천'> 추천
          <input type='radio' name='sc_where' id='sc_where' value='공개채용'> 공개채용
          <input type='radio' name='sc_where' id='sc_where' value='취업지원센터'> 취업지원센터
          <input type='radio' name='sc_where' id='sc_where' value='헤드헌터'> 헤드헌터
          <input type='radio' name='sc_where' id='sc_where' value='기타'> 기타
      </div> 
        <div>
        <label for='file1'></label>
        <label for='file2'>업로드자료</label>
        <input type="file" name='file2MF' id='file2MF' size='40' >
      </div>
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-default" onclick="location.href='./list.do'">목록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary" >저장</button> 
                
      </div>
    
      </FORM>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 -->
 
</div>
</body>
</html>