<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%  String root = request.getContextPath(); %>

<meta name="description" content="">

<!-- CSS FILES -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen" data-name="skins">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout/wide.css" data-name="layout">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fractionslider.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-fraction.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css"/> 

<!-- JS FILES --> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/retina-1.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script> <!-- jQuery cookie -->
<script src="${pageContext.request.contextPath}/js/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jflickrfeed.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easypiechart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/swipe.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-hoverdirection.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-scrolltofixed-min.js"></script>

<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script type="text/javascript"> 
function com(){
  if(<%=session.getAttribute("me_id")%> ==null){
    alert("로그인 후에 사용 하여 주세요");
    Location.reload();
  }

function bookmarksite(title,url) { 
   // Internet Explorer
   if(document.all)
   {
       window.external.AddFavorite(url, title); 
   }
   // Google Chrome
   else if(window.chrome){
      alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
   }
   // Firefox
   else if (window.sidebar) // firefox 
   {
       window.sidebar.addPanel(title, url, ""); 
   }
   // Opera
   else if(window.opera && window.print)
   { // opera 
      var elem = document.createElement('a'); 
      elem.setAttribute('href',url); 
      elem.setAttribute('title',title); 
      elem.setAttribute('rel','sidebar'); 
      elem.click(); 
   }
} 
function open_win(){
  window.open('<%=root%>/memberex/memberexv1_join.jsp','popup', 'width=700, height=500,left=450px,top=150px');
}
</script>

</head>

<body class="home">
    <header id="header">
        <div id="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 top-info hidden-xs">
                        <div class="service-icon">
                           <span><a href="https://www.jobplanet.co.kr">잡플래닛<i class="fa fa-hand-o-up"></i></a></span>
                           <span><a href="https://www.jobkorea.co.kr">잡코리아<i class="fa fa-hand-o-up"></i></a></span>
                           <span><a href="https://www.saramin.co.kr">사람인<i class="fa fa-hand-o-up"></i></a></span>
                        </div>
                    </div>
                    <div class="col-sm-5 top-info">
                           <c:if test="${empty sessionScope.me_id }">
                            <a class='' href='<%=root %>/memberex/login.do'>로그인</a> |
                            <a class=''  href="javascript:open_win();">회원가입</a> |
                          </c:if> 
                            <c:if test="${not empty sessionScope.me_id}">
                              ${ sessionScope.me_nick} 님 환영합니다. 
                              <c:if test="${sessionScope.me_grade eq 'A' }">
                              (관리자)
                              </c:if>
                              <c:if test="${sessionScope.me_grade eq 'C' }">
                              (기업회원)
                              </c:if>
                              <c:if test="${sessionScope.me_grade eq 'M' }">
                              (사용자)
                              </c:if>
                              <br>
                                <a class='' href='<%=root %>/memberex/logout.do'>로그 아웃</a> |
                                <c:if test="${sessionScope.me_grade eq 'A'}">
                            <a class='' href='<%=root %>/memberex/memberlist.do'>회원 목록</a> |
                                </c:if>
                            <a class='' href='<%=root %>/memberex/read.do?me_no=${sessionScope.me_no }'>회원관리 수정</a> |
                            <a class='' href = '<%=root %>/scrap/list.do?me_no=${sessionScope.me_no}'>스크랩 함</a>|
                            <a class='' href = '<%=root %>/calender/calendermode.jsp'>일정</a>|
                         </c:if>
                            <a href="<%=root %>/index.jsp" >HOME</a>  |
                            <a href="javascript:bookmarksite('IEP 프로젝트', 'http://localhost:9090/IEP/index.jsp')"><i class="fa fa-bookmark"></i> BOOKMARK</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="logo-bar">
            <div class="container">
                <div class="row">
                    <!-- Logo / Mobile Menu -->
                    <div  class="col-lg-3 col-sm-3 ">
                        <div id="logo">
                            <h1><a href="<%=root %>/index.jsp"><img alt="logo" src="<%=root %>/menu/images/logo.png" style='width:300px;'/></a></h1>
                        </div>
                    </div>
                    <!-- Navigation ================================================== -->
                    <div class="col-lg-9 col-sm-9">
                        <div class="navbar navbar-default navbar-static-top" role="navigation">
                            <!--  <div class="container">-->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                <c:if test="${sessionScope.me_id != null }" >
                                    <li class="active"><a href="#">공지사항</a>
                                        <ul class="dropdown-menu">
                                            <li class="active"><a href="<%=root %>/notice/list.do">공지사항</a></li>
                                            <li><a href="<%=root %>/fnq/listh.do">일반 F&A</a></li>
                                            <li><a href="<%=root %>/fnq/listc.do">기업 F&A</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.me_id  == null }">
                                    <li class="active"><a href="#">공지사항</a>
                                        <ul class="dropdown-menu">
                                            <li class="active"><a href="<%=root %>/memberex/login.do" onclick="javascript:com()">공지사항</a></li>
                                            <li><a href="<%=root %>/fnq/listh.do">일반 F&A</a></li>
                                            <li><a href="<%=root %>/fnq/listc.do">기업 F&A</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                    <li><a href="#">회사정보</a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="about.html">채용 정보</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="<%=root %>/enterprise_information/list.do">기업 정보</a></li>
                                                    <li><a href="<%=root %>/gurume/list.do">근처 맛집</a></li>
                                                </ul>
                                            </li>                                        
                                            <li><a href="#">블랙리스트</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#" >면접</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<%=root %>/tip/list.do?tp_ch=A">자소서</a></li>
                                            <li><a href="<%=root %>/tip/list.do?tp_ch=I">면접</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#">후기</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<%=root %>/seico/list.do">취업 성공</a></li>
                                            <li><a href="<%=root %>/interviewfail/list.do">취업 실패</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#">공부방</a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="<%=root %>/STUDY/list.do?gate=AJ">WEB/APP 스터디방</a>
                                            </li>
                                            <li>
                                                <a href="#">자격증</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">기출문제</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">IT 중고서적방</a>
                                            </li>                                            
                                        </ul>
                                    </li>
                                    <li>
                                    <c:if test="${sessionScope.me_id eq null }">
                                    <a href="<%=root %>/memberex/login.do" onclick="javascript:com()">공모전</a>
                                   </c:if>
                                     <c:if test="${sessionScope.me_id != null }">
                                    <a href="<%=root %>/contest/list.do">공모전</a>
                                    </c:if>
                                    </li>
                                    <li><a href="#" >커뮤니티</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<%=root %>/cfree/list.do">자유게시판</a></li>
                                            <li><a href="<%=root %>/community/listA.do">정모방</a></li>
                                            <li><a href="<%=root %>/community/listB.do">정보공유방</a></li>
                                            <li><a href="<%=root %>/community/listC.do">상담/공감방</a></li>                                                                                        
                                        </ul>
                                    </li>   
                                    <li><a href="#">Q&A</a>
                                    </li>                                                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
