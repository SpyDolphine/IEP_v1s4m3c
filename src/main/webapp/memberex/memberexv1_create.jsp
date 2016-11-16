<%@page import="dev.mvc.memberEx.MemberExVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="web.tool.*"%>

<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<title>일반회원가입</title>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<script type="text/javascript">
  $(function() {
    $.removeCookie('checkId'); // 기존의 쿠기 값을 삭제
    $.removeCookie('checkNick'); // 기존의 쿠키 값을 삭제(닉네임)
  });

  /*
    아이디를 중복 체크하는 jqeury 부분 
   */
  function checkId() {
    var params = 'me_id=' + $('#me_id').val();
    // 요청 주소, 전달 값, 응답 처리 함수, 전송 받는 형식
    $.post('./checkId.do', params, checkId_res, 'json');
  }

  function checkNick() {
    var params = 'me_nick=' + $('#me_nick').val();
    // 요청 주소, 전달 값, 응답 처리 함수, 전송 받는 형식
    $.post('./checkNick.do', params, checkNick_res, 'json');
  }
  /*
  아이디를 중복 체크하는 jqeury 부분
   */
  function checkId_res(data) {
    if (data.cnt == 0) {
      $('#panel_id').css('color', '#00AA00');
      $('#panel_id').css('font-size', '16px');
      $('#panel_id').html('아이디가 사용 가능합니다.');
      $.cookie('checkId', 'PASS'); // 쿠키 생성
    } else if (data.cnt == 1) {
      $('#panel_id').css('color', '#FF0000');
      $('#panel_id').html('아이디가 중복됩니다.');
      $('#me_id').focus();
    }
  }
  /*
  닉네임를 중복 체크하는 jqeury 부분
   */
  function checkNick_res(data){
    if (data.cnt == 0) {
      $('#panel_nick').css('color', '#00AA00');
      $('#panel_nick').css('font-size', '16px');
      $('#panel_nick').html('닉네임이 사용 가능합니다.');
    } else if (data.cnt == 1) {
      $('#panel_nick').css('color', '#FF0000');
      $('#panel_nick').html('닉네임이 중복됩니다.');
      $('#me_nick').focus();
    }
  }

  $(document).ready(function() {
    $('#me_pw').keyup(function() {
      $('#panel_pw').text('');
    });
    $('#reme_pw').keyup(function() {
      if ($('#me_pw').val() != $('#reme_pw').val()) {
        $('#panel_pw').html("<b> 비밀번호가 일치 하지 않습니다.</b>");
      } else {
        $('#panel_pw').html("<b> 비밀번호가 일치</b>");
      }
    });
  });
  
  function send() {
    
  }
</script>
<style type="text/css">

#formcon {
  width: 60%;
}

#formcon h3 {
  padding: 0 0 20px 0;
  font-weight: bold
}

#formcon strong {
  color: #bfbfbf;
  font-size: 12px;
}

#formcon p {
  padding: 0 0 20px 0
}

#formcon table {
  width: 100%;
  border-top: 2px solid grey;
  border-bottom: 2px solid grey;
  border-spacing: 0
}

#formcon td {
  border-bottom: 1px solid #333;
  padding: 10px 0 10px 10px
}

#formcon th {
  border-bottom: 1px solid #333;
  padding: 10px 0 10px 10px;
  background: #ffffff;
  text-align: left
}

#formcon input {
  border: 1px solid grey;
  color: black;
  padding: 1px
}

#formcon .input_btn input {
  border: 0;
  vertical-align: middle;
  margin-top: 5px
}
</style>
</head>

<section class="wrapper">
  <section class="page_head">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
          <nav id="breadcrumbs">
            <ul>
              <li><a href="../index.jsp">Home</a></li>
              <i class="fa fa-arrow-circle-right"></i> 일반회원가입</ul>
          </nav>
        </div>
      </div>
    </div>
  </section>
</section>

<body>
  <div class="container">
  <div class="dividerHeading">
    <h4><span><i class="fa fa-bullhorn"></i> 회원가입</span></h4>
  </div>  
  
    <div class="row" align='center'>
      <div class="col-xs-12 col-lg-12">

        <div id="formcon">
          <form id="frm" name="frm" action="./create.do" method='post'  onsubmit='return send();'>
          <h3><span>기본정보입력</span></h3>  
           <fieldset>
            <table>
             <tbody>
              <tr>
                <th scope="row">
                <label class='' for='me_id' class="col-xs-2 col-lg-2 control-label">아이디</label></th>
                <td>
                  <input  type="email" id="me_id" name="me_id"  placeholder="example@example.com" class="form-control" required="required">
                  보유하신 이메일을 입력해주세요<br>
                    <button type='button' class="btn btn-primary btn-xs" onclick="checkId()">중복확인</button>
                    <SPAN id='panel_id'></SPAN> <!-- id 중복관련 메시지 -->
                </td>
              </tr>
              <tr>
                <th scope="row">                
                <label class='' for='me_pw' >비밀번호</label></th>
                <td>
                 <input  type='password' name='me_pw' id='me_pw' class="form-control" required="required" placeholder="패스워드를 입력하세요">
                </td>
              </tr>  
              <tr>
                <th scope="row">
                 <label class='' for='reme_pw'>비밀번호 확인</label></th> 
                 <td>
                  <input   type='password' name='reme_pw' id='reme_pw' class="form-control" required="required" placeholder="패스워드를 다시 입력하세요">
                  <SPAN id='panel_pw' name="panel_pw">비밀번호 확인</SPAN>
                 </td>
              </tr>   
              <tr>
                <th scope="row">
                <label class='' for='me_nick'>닉네임</label></th>
                <td>
                 <input  type="text" id="me_nick" name="me_nick" class="form-control" required="required" >    
                 <button type='button' class="btn btn-primary btn-xs" onclick="checkNick()">중복확인</button>
                  <SPAN id='panel_nick'></SPAN> <!-- id 중복관련 메시지 -->
                </td>
              </tr>  
              <tr>
                <th scope="row">
                 <label class='' for='me_name'>이름</label></th>
                 <td>
                  <input  type="text" id="me_name" name="me_name" class="form-control" required="required" > 
                  <SPAN  id='panel_name'></SPAN> <!-- id 중복관련 메시지 -->
                 </td>
              </tr>  
              <tr>
                <th scope="row">
                 <label class='' for='me_tel'>전화번호</label></th>
                 <td>
                  <input   type="tel" id="me_tel" name="me_tel" class="form-control" required="required" > 
                  <SPAN  id='panel_name'></SPAN> <!-- id 중복관련 메시지 -->
                 </td>
              </tr>   
              <tr>
                <th scope="row">
                 <label class='' for='me_zipcode'>우편번호</label></th>
                 <td>
                  <input   type='text' name='me_zipcode' id='me_zipcode' required="required"   placeholder="우편번호" class="form-control"> 
                  <input type="button" class="btn btn-default btn-xs" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                  <SPAN id='panel_name'></SPAN> <!-- id 중복관련 메시지 -->
                 </td>
              </tr>  
              <tr>
                <th scope="row">                
                 <label class='' for='me_address'>주소</label></th>
                 <td>
                  <input   type='text' name='me_addr1' id='me_addr1' value=''  size='40'  required="required"  placeholder="주소" class="form-control"> 
                  <input type='text'  name='me_addr2' id='me_addr2' value='' size='15' required="required"   placeholder="상세 주소" class="form-control"> 
                  <SPAN id='panel_addr'></SPAN>
                  <!-- id 중복관련 메시지 -->
                 </td>
              </tr>
              <tr>
                <th scope="row">
                 <label class=''></label> <!-- ----- DAUM 우편번호 API 시작 ----- --></th>
                <td>
                  <div id="wrap"
                    style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
                    <img
                      src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
                      id="btnFoldWrap"
                      style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
                      onclick="foldDaumPostcode()" alt="접기 버튼">
                  </div> 
                  <script
                    src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                  <script>
                                      // 우편번호 찾기 찾기 화면을 넣을 element
                                      var element_wrap = document
                                          .getElementById('wrap');

                                      function foldDaumPostcode() {
                                        // iframe을 넣은 element를 안보이게 한다.
                                        element_wrap.style.display = 'none';
                                      }

                                      function DaumPostcode() {
                                        // 현재 scroll 위치를 저장해놓는다.
                                        var currentScroll = Math.max(
                                            document.body.scrollTop,
                                            document.documentElement.scrollTop);
                                        new daum.Postcode(
                                            {
                                              oncomplete : function(data) {
                                                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                var fullAddr = data.address; // 최종 주소 변수
                                                var extraAddr = ''; // 조합형 주소 변수

                                                // 기본 주소가 도로명 타입일때 조합한다.
                                                if (data.addressType === 'R') {
                                                  //법정동명이 있을 경우 추가한다.
                                                  if (data.bname !== '') {
                                                    extraAddr += data.bname;
                                                  }
                                                  // 건물명이 있을 경우 추가한다.
                                                  if (data.buildingName !== '') {
                                                    extraAddr += (extraAddr !== '' ? ', '
                                                        + data.buildingName
                                                        : data.buildingName);
                                                  }
                                                  // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                                  fullAddr += (extraAddr !== '' ? ' ('
                                                      + extraAddr + ')'
                                                      : '');
                                                }

                                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                document
                                                    .getElementById('me_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                                                document
                                                    .getElementById('me_addr1').value = fullAddr;

                                                // iframe을 넣은 element를 안보이게 한다.
                                                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                                element_wrap.style.display = 'none';

                                                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                                document.body.scrollTop = currentScroll;

                                                $('#me_addr2').focus();
                                              },
                                              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                                              onresize : function(size) {
                                                element_wrap.style.height = size.height
                                                    + 'px';
                                              },
                                              width : '100%',
                                              height : '100%'
                                            }).embed(element_wrap);

                                        // iframe을 넣은 element를 보이게 한다.
                                        element_wrap.style.display = 'block';
                                      }
                                    </script> <!-- ----- DAUM 우편번호 API 종료----- -->
                                 </td>
                               </tr>
                             </tbody>
                           </table>
                <div class='right'>
                  <button type="submit" class="btn btn-info btn-sm">가입</button>
                  <button type="button" class="btn btn-default btn-sm" onclick="javascript:history.back()">취소</button>
                </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>

<!-- -------------------------------------------- -->
<div style='margin: 100px 0 0 0; position: relative;'>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</div>
<!-- -------------------------------------------- -->
</html>
