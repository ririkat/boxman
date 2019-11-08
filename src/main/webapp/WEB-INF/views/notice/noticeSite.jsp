<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>


  <!-- PLUGINS CSS STYLE -->
  <!-- Bootstrap -->
  <link href="${path }/resources/kio/css/bootstrap.min.css" rel="stylesheet">
  <!-- Themefisher Font -->  
  <link href="${path }/resources/kio/plugins/themefisher-font/style.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="${path }/resources/kio/css/font-awesome.min.css" rel="stylesheet">
  <!-- Magnific Popup -->
  <link href="${path }/resources/kio/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
  <!-- Slick Carousel -->
  <link href="${path }/resources/kio/plugins/slick/slick.css" rel="stylesheet">
  <link href="${path }/resources/kio/plugins/slick/slick-theme.css" rel="stylesheet">
  <!-- CUSTOM CSS -->
  <link href="${path }/resources/kio/css/style.css" rel="stylesheet">

<!--==============================
=            Schedule            =
===============================-->

<style>
	.bg-gradient-primary {
    background-color: #4e73df;
    background-image: linear-gradient(180deg,#4e73df 10%,#224abe 100%);
    background-size: cover;
}
.btn-outline-success2 {
    background-color: #e73b66d6;
    border-color: #e73b66d6;
    color: white;
}
</style>

  
  <section class="section schedule">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h3><span class="alternate">관련 사이트</span></h3>
					<p>내부/외부 사이트 바로가기</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
			<form id="site" class="forms-sample">
				<div class="schedule-tab">
					<ul class="nav nav-pills text-center">
					  <li class="nav-item">
					    <a class="nav-link active" href="#nov20" data-toggle="pill">
					    	협회
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov21" data-toggle="pill">
							거래처
					    </a>
					  </li>
					</ul>
				</div>
				<div class="schedule-contents bg-schedule">
					<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active schedule-item" id="nov20">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">번호</div>
					  			<div class="speaker">형식</div>
					  			<div class="depart">업체명</div>
					  			<div class="subject">링크</div>
					  			<div class="venue"></div>
					  			
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list }" var ="list" varStatus="v">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list["STCHECK"]}'/></span>
							  		</div>
							  		<!-- Depart -->
							  		<div class="depart" name="stName"><c:out value='${list["STNAME"]}'/></div>
							  		<!-- Subject -->
							  		<div class="subject"> <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${list['STLINK']}" target="_blank"><span>사이트연결</span></a></label></div>
					  				<!-- Venue -->
					  				<div class="venue">
					  					<button type="button" class="b-related btn btn-outline-success2 my-2 my-sm-0" onclick="location.href='${path }/notice/deleteSite.do?stname=${list['STNAME']}'" >삭제</button>
							  		</div>
					  			</div>
					  		</li>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					  <div class="tab-pane fade schedule-item" id="nov21">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">번호</div>
					  			<div class="speaker">형식</div>
					  			<div class="depart">업체명</div>
					  			<div class="subject">링크</div>
					  			<div class="venue"></div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list2 }" var ="list2" varStatus="v">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list2["STCHECK"]}'/></span>
							  		</div>
							  		<!-- Depart -->
							  		<div class="depart"><c:out value='${list2["STNAME"]}'/></div>
							  		<!-- Subject -->
							  		<div class="subject"> <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${list2['STLINK']}" target="_blank"><span>사이트연결</span></a></label></div>
					  				<!-- Venue -->
					  				<div class="venue">
					  					<button type="button" class="b-related btn btn-outline-success2 my-2 my-sm-0" onclick="location.href='${path }/notice/deleteSite.do?stname=${list2['STNAME']}'" >삭제</button>
							  		</div>
					  			</div>
					  		</li>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					</div>
				</div>
		</form>
					<div class="download-button text-center">
						<a href="${path}/notice/insertSite.do" class="btn btn-light btn-icon-split btn btn-main-md">사이트등록</a>
					</div>
				
			</div>
		</div>
	</div>
</section>

 <!-- JAVASCRIPTS -->
  <!-- jQuey -->
  <script src="${path }/resources/kio/plugins/jquery/jquery.js"></script>
  <!-- Popper js -->
  <script src="${path }/resources/kio/plugins/popper/popper.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="${path }/resources/kio/plugins/bootstrap/js/bootstrap.min.js"></script>
  <!-- Smooth Scroll -->
  <script src="${path }/resources/kio/plugins/smoothscroll/SmoothScroll.min.js"></script>  
  <!-- Isotope -->
  <script src="${path }/resources/kio/plugins/isotope/mixitup.min.js"></script>  
  <!-- Magnific Popup -->
  <script src="${path }/resources/kio/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
  <!-- Slick Carousel -->
  <script src="${path }/resources/kio/plugins/slick/slick.min.js"></script>  
  <!-- SyoTimer -->
  <script src="${path }/resources/kio/plugins/syotimer/jquery.syotimer.min.js"></script>
  <!-- Google Mapl -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
  <script type="text/javascript" src="${path }/resources/kio/plugins/google-map/gmap.js"></script>
  <!-- Custom Script -->
  <script src="${path }/resources/kio/js/custom.js"></script>

