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
</script>
<style>
a.iep-top {
    position: fixed;
    right: 15px;
    bottom: 50px;
    border-radius: 20px;
    color: #ffffff;
    text-align: center;
    width: 35px;
    height: 35px;
    font-size: 20px;
    /*background-color: rgba(50,50,50,0.5);*/
    background-color:#323232; opacity:0.5; filter:alpha(opacity=50); /*ie8 호환을 위한코드 위와 동일한 것임 호환필요없으면 한줄로 rgba적으면됨*/
    z-index: 999;
}
</style>
</head>
<!-- 맨위로 버튼 -->
<a href="#" class="iep-top"><i class="fa fa-chevron-up" style="text-align: right;"></i></a>
<body class="home">
    <header id="header">
        <div id="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 top-info hidden-xs">
                        <div class="service-icon">
                           <span><a href="https://www.jobplanet.co.kr">잡플래닛<i class="fa fa-hand-o-up"></i></a></span>
                           <span><a href="https://www.jobkorea.co.kr">잡코리아<i class="fa fa-hand-o-up"></i></a></span>
                           <span><a href="https://www.saramin.co.kr">사람인<i class="fa fa-hand-o-up"></i></a></span>
                        </div>
                    </div>
                    <div class="col-sm-4 top-info">
                            <a href="" >로그인</a>  |
                            <a href="" >회원가입</a>  |
                            <a href="" >개인회원</a>  |
                            <a href="" >기업회원</a>  |
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
                            <h1><a href="<%=root %>/index.jsp"><img alt="logo" src="<%=root %>/menu/images/wind.jpg" style='width:100px;'/> &nbsp;IEP</a></h1>
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
                                    <li class="active"><a href="#">공지사항</a>
                                        <ul class="dropdown-menu">
                                            <li class="active"><a href="<%=root %>/notice/list.do">공지사항</a></li>
                                            <li><a href="<%=root %>/fnq/list.do?fq_ch=H">일반 F&A</a></li>
                                            <li><a href="<%=root %>/fnq/list.do?fq_ch=C">기업 F&A</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#">회사정보</a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="about.html">채용 정보</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">기업 정보</a></li>
                                                    <li><a href="<%=root %>/gurume/list.do">근처 맛집</a></li>
                                                </ul>
                                            </li>                                        
                                            <li><a href="#">블랙리스트</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#" >면접</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<%=root %>/aboutme/list.do">자소서</a></li>
                                            <li><a href="<%=root %>/interview/list.do">면접</a></li>
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
                                                <a href="#">웹 스터디방</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">HTML</a></li>
                                                    <li><a href="#">CSS5</a></li>
                                                    <li><a href="#">Spring</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">컴퓨터 언어방</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">JAVA</a></li>
                                                    <li><a href="#">JSP</a></li>
                                                    <li><a href="#">JQuery</a></li>
                                                </ul>
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

                                    <li><a href="#">공모전</a>
                                    </li>
                                    
                                    <li><a href="#" >커뮤니티</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<%=root %>/cfree/list.do">자유게시판</a></li>
                                            <li><a href="<%=root %>/mfree/list.do">정모방</a></li>
                                            <li><a href="<%=root %>/ifree/list.do">정보공유방</a></li>
                                            <li><a href="<%=root %>/gfree/list.do">상담/공감방</a></li>                                                                                        
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
    
