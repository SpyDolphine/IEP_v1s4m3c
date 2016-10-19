<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title> 

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<link href="./css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">

</style>
</head> 
<!-- ----------------------------------------- -->
  <div class="container">       
    <jsp:include page="./menu/top.jsp" flush='false' />
    <jsp:include page="./menu/left.jsp" flush='false' />
        <!-- 본문 시작 -->
        <div id="carousel-example-generic" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
             <!-- Carousel items -->
         <div class="carousel-inner">
            <div class="item active">
               <img src="./menu/images/slide1.jpg" alt="First slide">
            </div>
            <div class="item">
               <img src="./menu/images/slide2.jpg" alt="Second slide">               
            </div>
            <div class="item">
               <img src="./menu/images/slide3.jpg" alt="Third slide">                 
            </div>
         </div>
        <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            <span class="icon-prev"></span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
            <span class="icon-next"></span>
          </a>
        </div>
        <!-- 본문 끝 -->
     <jsp:include page="./menu/bottom.jsp" flush='false' />
  </div>
</body>
<!-- -------------------------------------------- -->
</html> 