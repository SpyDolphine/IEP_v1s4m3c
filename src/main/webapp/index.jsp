<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>IEP</title>
<meta name="description" content="">

<!-- CSS FILES -->
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" data-name="skins">
<link rel="stylesheet" href="css/layout/wide.css" data-name="layout">
<link rel="stylesheet" href="css/fractionslider.css"/>
<link rel="stylesheet" href="css/style-fraction.css"/>
<link rel="stylesheet" href="css/animate.css"/>

</head> 
<jsp:include page="/menu/top.jsp" flush='false' />
                <!-- 
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
                            <a href="" >HOME</a>  |
                            <a href="" ><i class="fa fa-bookmark"></i>BOOKMARK</a>  
                    </div>
                </div>
            </div>
        </div>
        <div id="logo-bar">
            <div class="container">
                <div class="row">
                    Logo / Mobile Menu
                    <div  class="col-lg-3 col-sm-3 ">
                        <div id="logo">
                            <h1><a href="index.jsp"><img alt="logo들어가야함" src=""/></a></h1>
                        </div>
                    </div>
                    Navigation ==================================================
                    <div class="col-lg-9 col-sm-9">
                        <div class="navbar navbar-default navbar-static-top" role="navigation">
                             <div class="container">
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
                                            <li class="active"><a href="index.html">공지사항</a></li>
                                            <li><a href="#">일반 F&A</a></li>
                                            <li><a href="#">기업 F&A</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#">회사정보</a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="about.html">채용 정보</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">기업 정보</a></li>
                                                    <li><a href="#">근처 맛집</a></li>
                                                </ul>
                                            </li>                                        
                                            <li><a href="#">블랙리스트</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#" >면접</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">자소서</a></li>
                                            <li><a href="#">면접</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#">후기</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">취업 성공</a></li>
                                            <li><a href="./interviewfail/list.do">취업 실패</a></li>
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
                                            <li><a href="#">자유게시판</a></li>
                                            <li><a href="#">정모방</a></li>
                                            <li><a href="#">정보공유방</a></li>
                                            <li><a href="#">상담/공감방</a></li>                                                                                        
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
    </header> -->
        <div class="slider-wrapper">
            <div class="slider">
                <div class="fs_loader"></div>
                <div class="slide">
                    <img src="images/fraction-slider/base.jpg" width="1920" height="auto" data-in="fade" data-out="fade" />
                </div>
                <div class="slide">
                    <img src="images/fraction-slider/base_2.jpg" width="1920" height="auto" data-in="fade" data-out="fade" />
                </div>
                <div class="slide">
                    <img src="images/fraction-slider/base_3.jpg"  width="1920" height="auto" data-in="fade" data-out="fade" />
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
                                <a href="">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 purple">
                        <div class="service-icon">
                            <i class="fa fa-rocket"></i>
                        </div>
                        <div class="service-content">
                            <h3>기업 정보 확인</h3>
                            <p> 다양한 기업들의 정보를 확인하고 <br> 내게 맞는 기업을 찾아보세요! </p>
                            <div class="read">
                                <a href="">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 red">
                        <div class="service-icon">
                            <i class="fa fa-bolt"></i>
                        </div>
                        <div class="service-content">
                            <h3>공모전</h3>
                            <p> 스펙을 위한 공모전! 경험을 위한 공모전! <br> 당신도 할 수 있습니다! </p>
                            <div class="read">
                                <a href="">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="serviceBox_2 blue">
                        <div class="service-icon">
                            <i class="fa fa-users"></i>
                        </div>
                        <div class="service-content">
                            <h3>JOIN US</h3>
                            <p> 함께해요! 회원가입 해야만<br> 메뉴확인이 가능합니다^^ </p>
                            <div class="read">
                                <a href="">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
 