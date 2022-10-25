<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>T.M.I</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- Top Background Image Wrapper -->
 <jsp:include page = "top.jsp" flush = "false"/>
<!-- End Top Background Image Wrapper -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <div class="content"> 
      <div id="gallery">
        <figure>
          <header class="heading">테스트</header>
          <ul class="nospace clear">
            <li class="one_quarter first"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter first"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter first"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="images/demo/gallery/01.png" alt=""></a></li>
          </ul>
        </figure>
      </div>
      <nav class="pagination">
        <ul>
          <li><a href="#">&laquo; 이전</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><strong>&hellip;</strong></li>
          <li><a href="#">6</a></li>
          <li class="current"><strong>7</strong></li>
          <li><a href="#">8</a></li>
          <li><a href="#">9</a></li>
          <li><strong>&hellip;</strong></li>
          <li><a href="#">14</a></li>
          <li><a href="#">15</a></li>
          <li><a href="#">다음 &raquo;</a></li>
        </ul>
      </nav>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <p class="fl_left">Copyright &copy; 2022 - All Rights Reserved - <a target="_blank" href="#" title="3학년 1반 - 1조">Disease</a></p>
  </div>
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>