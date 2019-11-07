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
	.btn-icon-split .icon {
	  background: #4e73df;
	  display: inline-block;
	  padding: 0.375rem 0.75rem;
}
	.text-gray-600 {
	    color: #3a3b45!important;
}
form {
	background: none;
}

form:active {
	background: rgb(240, 240, 240);
}
</style>
<section id="content">

<div></div>
<section class="section schedule">
	<div class="container">
		<div class="row">
		      <div class="col-sm-12 col-md-6">
		      
                 <form id="searchFrm">
                    <div class="dataTables_length" id="dataTable_length">
                       <label>
                           <input type="text" name="data" class="form-control form-control-sm" placeholder="사원명으로 검색" aria-controls="dataTable">
                      </label>
                      <button onclick = "searchEmp();" class="btn btn-light btn-icon-split">
                          <span class="icon text-gray-600">
                         <i class="fas fa-arrow-right"></i>
                          </span>
                          <span class="text">검색</span>
                        </button>
                    </div>
                 </form>
                 </div>
			<div class="col-12">
				<div class="section-title">
					<h3><span class="alternate">채팅</span></h3>
					<p>사원들간 실시간 메세지</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="schedule-tab">
					<ul class="nav nav-pills text-center">
					<li class="nav-item">
					    <a class="nav-link active" href="#nov20" data-toggle="pill">
					    	전체사원
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov21" data-toggle="pill">
					    	인사
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov22" data-toggle="pill">
							회계
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov23" data-toggle="pill">
					    	영업
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov24" data-toggle="pill">
							물류관리
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
					  			<div class="speaker">이름</div>
					  			<div class="depart">직위</div>
					  			<div class="subject">부서</div>
					  			<div class="venue">채팅방</div>
					  			<div></div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list }" var="list" varStatus="v">
							<c:if test="${list['EMPNO'] != loginEmp['EMPNO']}">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list["EMPNAME"] }'/></span>
							  		</div>
							  		<div class="depart">
										<span class="name"><c:out value='${list["JOBNAME"] }'/></span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">
							  			<span class="name"><c:out value='${list["DEPTNAME"] }'/></span>
							  			
							  		</div>
							  		<!-- Venue -->
							  		<div class="venue"> <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${path }/chat/chatRoom.do?receiver=${list['EMPNO']}&sender=${loginEmp['EMPNO'] }"><span>방열기</span></a></label></div>					  				
					  				<c:if test="${list['READCOUNT'] == 0}">
						  				<div class="venue">
						  					<i class="fas fa-comment-dots" style="color:#e73b66d6;"></i>
						  				</div>
					  				</c:if>
					  			</div>
					  		</li>
					  		</c:if>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					
					  <div class="tab-pane fade show schedule-item" id="nov21">
					  
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">번호</div>
					  			<div class="speaker">이름</div>
					  			<div class="subject">직위</div>
					  			<div class="venue">채팅방</div>
					  			<div class="venue"></div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list }" var="list" varStatus="v">
							<c:if test="${list['EMPNO'] != loginEmp['EMPNO'] && list['DEPTNAME'] == '인사부' }">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list["EMPNAME"] }'/></span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject"><c:out value='${list["JOBNAME"] }'/></div>
							  		<!-- Venue -->
							  		<div class="venue">
							  			 <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${path }/chat/chatRoom.do?receiver=${list['EMPNO']}&sender=${loginEmp['EMPNO'] }"><span>방열기</span></a></label>
							  		</div>
							  		<c:if test="${list['READCOUNT'] == 0}">
						  				<div class="venue">
						  					<i class="fas fa-comment-dots" style="color:#e73b66d6;"></i>
						  				</div>
					  				</c:if>	
					  			</div>
					  		</li>
					  		</c:if>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					  <div class="tab-pane fade show schedule-item" id="nov22">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">번호</div>
					  			<div class="speaker">이름</div>
					  			<div class="subject">직위</div>
					  			<div class="venue">채팅방</div>
					  			<div class="venue"></div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list }" var="list" varStatus="v">
					  		
							<c:if test="${list['EMPNO'] != loginEmp['EMPNO'] && list['DEPTNAME'] == '회계부' }">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list["EMPNAME"] }'/></span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject"><c:out value='${list["JOBNAME"] }'/></div>
							  		<!-- Venue -->
							  		<div class="venue"> <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${path }/chat/chatRoom.do?receiver=${list['EMPNO']}&sender=${loginEmp['EMPNO'] }"><span>방열기</span></a></label></div>
					  				<c:if test="${list['READCOUNT'] == 0}">
						  				<div class="venue">
						  					<i class="fas fa-comment-dots" style="color:#e73b66d6;"></i>
						  				</div>
					  				</c:if>
					  			</div>
					  		</li>
					  		</c:if>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					  <div class="tab-pane fade show schedule-item" id="nov23">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">번호</div>
					  			<div class="speaker">이름</div>
					  			<div class="subject">직위</div>
					  			<div class="venue">채팅방</div>
					  			<div class="venue"></div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list }" var="list" varStatus="v">
					  		
							<c:if test="${list['EMPNO'] != loginEmp['EMPNO'] && list['DEPTNAME'] == '영업부' }">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list["EMPNAME"] }'/></span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject"><c:out value='${list["JOBNAME"] }'/></div>
							  		<!-- Venue -->
							  		<div class="venue"> <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${path }/chat/chatRoom.do?receiver=${list['EMPNO']}&sender=${loginEmp['EMPNO'] }"><span>방열기</span></a></label></div>
					  				<c:if test="${list['READCOUNT'] == 0}">
						  				<div class="venue">
						  					<i class="fas fa-comment-dots" style="color:#e73b66d6;"></i>
						  				</div>
					  				</c:if>
					  			</div>
					  		</li>
					  		</c:if>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					  <div class="tab-pane fade show schedule-item" id="nov24">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">번호</div>
					  			<div class="speaker">이름</div>
					  			<div class="subject">직위</div>
					  			<div class="venue">채팅방</div>
					  			<div class="venue"></div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<c:forEach items="${list }" var="list" varStatus="v">

							<c:if test="${list['EMPNO'] != loginEmp['EMPNO'] && list['DEPTNAME'] == '물류관리부' }">
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">${v.count}</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name"><c:out value='${list["EMPNAME"] }'/></span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject"><c:out value='${list["JOBNAME"] }'/></div>
							  		<!-- Venue -->
							  		<div class="venue"> <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="${path }/chat/chatRoom.do?receiver=${list['EMPNO']}&sender=${loginEmp['EMPNO'] }"><span>방열기</span></a></label></div>
					  				<c:if test="${list['READCOUNT'] == 0}">
						  				<div class="venue">
						  					<i class="fas fa-comment-dots" style="color:#e73b66d6;"></i>
						  				</div>
					  				</c:if>
					  			</div>
					  		</li>
					  		</c:if>
					  		 </c:forEach>			  
					  	</ul>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	function searchEmp(){
	   $("#searchFrm").attr("action","${path}/chat/searchEmp.do");
	   $("#searchFrm").submit();
	}
</script>


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
