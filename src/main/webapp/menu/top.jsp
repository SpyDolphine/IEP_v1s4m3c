<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%  String root = request.getContextPath(); %>

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
                    <!-- Logo / Mobile Menu -->
                    <div  class="col-lg-3 col-sm-3 ">
                        <div id="logo">
                            <h1><a href="<%=root %>/index.jsp"><img alt="logo들어가야함" src=""/></a></h1>
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
    </header>
