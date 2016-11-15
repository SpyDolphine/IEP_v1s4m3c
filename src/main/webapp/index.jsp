<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%
 String root = request.getContextPath();
 %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<script type="text/javascript">
function open_win(){
  window.open('<%=root%>/memberex/memberexv1_join.jsp','popup', 'width=500, height=300,left=200px,top=200px');
}
function com(){
  if(<%=session.getAttribute("me_id")%> ==null){
    alert("로그인 후에 사용 하여 주세요");
    Location.reload();
  }
}
</script>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>IEP</title>

<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
</head>
        <div class="slider-wrapper">
            <div class="slider">
                <div class="fs_loader"></div>
                <div class="slide">
                    <img src="./images/mainslide.jpg" width="1920" height="auto" data-in="fade" data-out="fade" />
                </div>
                <div class="slide">
                    <img src="./images/mainslide2.jpg" width="1920" height="auto" data-in="fade" data-out="fade" />
                </div>
                <div class="slide">
                    <img src="./images/mainslide3.jpg"  width="1920" height="auto" data-in="fade" data-out="fade" />
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row super_sub_content">
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 green">
                        <div class="service-icon">
                            <i class="fa fa-globe"></i>
                        </div>
                        <div class="service-content">
                            <h3>설문 조사</h3>
                            <p> 오늘의 설문조사 내용입니다. 조퇴할까요? </p>
                            <div class="read">
                                <a href="./serveyboard/list.do">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 purple">
                        <div class="service-icon">
                            <i class="fa fa-rocket"></i>
                        </div>
                          <c:if test="${sessionScope.me_id eq null }">
                          <div class="service-content">
                            <h3>기업 정보 확인</h3>
                            <p> 다양한 기업들의 정보를 확인하고 <br> 내게 맞는 기업을 찾아보세요! </p>
                            <div class="read">
                                <a id="contest" onclick="javascript:com()" href="./memberex/login.do">Read more</a>
                            </div>
                        </div>
                          </c:if>
                         <c:if test="${sessionScope.me_id != null }">
                          <div class="service-content">
                            <h3>기업 정보 확인</h3>
                            <p> 다양한 기업들의 정보를 확인하고 <br> 내게 맞는 기업을 찾아보세요! </p>
                            <div class="read">
                                <a href="#">Read more</a>
                            </div>
                        </div>
                          </c:if>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 red">
                        <div class="service-icon">
                            <i class="fa fa-bolt"></i>
                        </div>
                          <c:if test="${sessionScope.me_id eq null }">
                        <div class="service-content">
                            <h3>공모전</h3>
                            <p> 스펙을 위한 공모전! 경험을 위한 공모전! <br> 당신도 할 수 있습니다! </p>
                            <div class="read" id="contest">
                                <a id="contest" onclick="javascript:com()" href="./memberex/login.do">Read more</a>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${sessionScope.me_id != null }">
                        <div class="service-content">
                            <h3>공모전</h3>
                            <p> 스펙을 위한 공모전! 경험을 위한 공모전! <br> 당신도 할 수 있습니다! </p>
                            <div class="read" id="contest">
                                <a id="contest"  href="./contest/list.do">Read more</a>
                            </div>
                        </div>
                        </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 blue">
                        <div class="service-icon">
                            <i class="fa fa-users"></i>
                        </div>
                         <c:if test="${sessionScope.me_id eq null }">
                        <div class="service-content">
                            <h3>JOIN US</h3>
                            <p> 함께해요! 회원가입 해야만<br> 메뉴확인이 가능합니다^^ </p>
                            <div class="read">
                                 <a href="javascript:open_win();">회원가입</a>
                           </div>
                        </div>
                      </c:if>
                      <c:if test="${sessionScope.me_id != null }">
                        <div class="service-content">
                            <h3>JOIN</h3>
                            <p> ${sessionScope.me_nick }환영 해요! 로그인 감사합니다.</p>
                            <div class="read">
                               <p id="contest">  Welcome~!!</p>
                           </div>
                        </div>
                      </c:if>
                        
                    </div>
                </div>
            </div>
        
    <div style= 'margin: 100px 0 0 0;  position: relative;'>      
    <jsp:include page="/menu/bottom.jsp" flush='false' />
    </div>
</body>
</html>
 