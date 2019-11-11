<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

  <title>${param.tabTitle }</title>

  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

  <!-- Custom fonts for this template-->
  <link href="${path }/resources/b4/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- CSS -->
  <link href="${path }/resources/b4/css/sb-admin-2.min.css" rel="stylesheet">
  
      <!-- Bootstrap core JavaScript-->
  <script src="${path }/resources/b4/vendor/jquery/jquery.min.js"></script>
  <script src="${path }/resources/b4/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${path }/resources/b4/js/sb-admin-2.min.js"></script>
  
  <!-- favicon -->
  <link rel="icon" href="${path }/resources/logo/boxmanLogo.ico" type="image/gif" sizes="16x16">
  <!-- datepicker -->
  <link rel="stylesheet" href="${path }/resources/hb/css/bootstrap-datepicker.css">
  <script src="${path }/resources/hb/js/bootstrap-datepicker.js"></script>
  <script src="${path }/resources/hb/js/bootstrap-datepicker.ko.js"></script>
  
  <!-- tableSorter -->
  <script src='${path }/resources/hb/js/jquery.tablesorter.min.js'></script>
    
  <!-- chart -->
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
 
    <!-- 달력 -->

    <link rel="stylesheet" href="${path }/resources/full/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${path }/resources/full/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${path }/resources/full/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${path }/resources/full/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">

    <link rel="stylesheet" href="${path }/resources/full/css/main.css">
   <!-- 달력 -->

</head>
<style>
.table-responsive {
    display: block;
    width: 100%;
    overflow-x: hidden;
    -webkit-overflow-scrolling: touch;
}

.btn-success{
   background-color: #4e73df;
   border-color: #4e73df;
}

.btn-success hover{
   background-color: white;
   border-color: #4e73df;
}

.btn-outline-success{
   background-color: #4e73df;
   border-color: #4e73df;
   color: white;
}

</style>
<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Sidebar -->
      <ul
         class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
         id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <a
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="${path }/common/main.do?empNo=${loginEmp.EMPNO}">
            <div class="sidebar-brand-icon rotate-n-15">
               <!-- <i class="fas fa-laugh-wink"></i> -->
               <!-- <i class="fas fa-warehouse"></i> -->
               <i class="fas fa-box"></i>
            </div>
            <div class="sidebar-brand-text mx-3">
               BOXMAN <sup>2</sup>
            </div>
         </a>

         <!-- Divider -->
         <hr class="sidebar-divider">

         <!-- Heading -->
         <div class="sidebar-heading">index</div>
         
         <!-- 마이페이지 -->
            <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMy" aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>마이페이지</span>
              </a>
              <div id="collapseMy" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                  <a class="collapse-item" href="${path }/emp/selectEmpOne.do?empNo=${loginEmp.EMPNO}&temp=my">내정보확인</a>
                  <a class="collapse-item" href="${path }/emp/selectAttenList.do?empNo=${loginEmp.EMPNO}&temp=my">근태현황</a>
                  <a class="collapse-item" href="${path }/emp/selectDayOffList.do?empNo=${loginEmp.EMPNO}&temp=my">휴가현황</a>
                  <a class="collapse-item" href="${path }/emp/selectBTList.do?empNo=${loginEmp.EMPNO}&temp=my">출장현황</a>
                </div>
              </div>
            </li>

         <!-- 결재 관리 -->
         <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseApv" aria-expanded="true" aria-controls="collapseApv">
                  <i class="fas fa-fw fa-chart-area"></i> <span>결재 관리</span>
            </a>
            <div id="collapseApv" class="collapse" aria-labelledby="headingApv" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                   <a class="collapse-item" href="${path }/apv/requestApv.do">기안하기</a>
                  <a class="collapse-item" href="${path }/apv/sendApv.do?loginNo=${loginEmp['EMPNO'] }">상신결재함</a>
                  <a class="collapse-item" href="${path }/apv/receiveApvList.do?loginNo=${loginEmp['EMPNO'] }">수신결재함</a>
                  <a class="collapse-item" href="${path }/apv/enforceApvList.do?loginNo=${loginEmp['EMPNO'] }">시행결재함</a>
                  <a class="collapse-item" href="${path }/apv/referApvList.do?loginNo=${loginEmp['EMPNO'] }">참조결재함</a>
                  <a class="collapse-item" href="${path }/apv/apvLineList.do?loginNo=${loginEmp['EMPNO'] }">결재라인관리</a>
                  <a class="collapse-item" href="${path }/apv/apvDoc.do">결재양식관리</a>
                </div>
              </div>
         </li>

      <!-- 인사 관리 -->
      <li class="nav-item">
        <a class="nav-link collapsed" id="empNav" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>인사 관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="${path }/emp/empList.do?temp=all">사원관리</a>
            <a class="collapse-item" href="${path }/dept/deptList.do?t=N">부서관리</a>
            <a class="collapse-item" href="${path }/empJob/empJobList.do?t=N">직급관리</a>
            <a class="collapse-item" href="${path }/emp/selectAttenList.do?temp=all">근태현황</a>
            <a class="collapse-item" href="${path }/emp/selectDayOffList.do?temp=all">휴가현황</a>
            <a class="collapse-item" href="${path }/emp/selectBTList.do?temp=all">출장현황</a>
          </div>
        </div>
      </li>

         <!-- 영업 관리 -->
      <li class="nav-item" >
        <a class="nav-link collapsed" id="bizNav" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>영업 관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="${pageContext.request.contextPath}/stuff/stuffAllList.do">물품 관리</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/category/maincategoryUpdate.do">메인 카테고리 관리</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/category/subcategoryUpdate.do">서브 카테고리 관리</a>
            <a class="collapse-item"  href="${path}/connection/connList.do">거래처관리</a>
            <a class="collapse-item" href="${path}/purchase/purList.do">구매관리</a>
            <a class="collapse-item" href="${path}/sale/saleList.do">판매관리</a>
          </div>
        </div>
      </li>   

         <!-- 회계 관리 -->
         <li class="nav-item"><a class="nav-link collapsed" href="#" id="acctNav"
            data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities"> 
            <i class="fas fa-calculator"></i>&nbsp;&nbsp;<span>회계 관리</span>
         </a>
            <div id="collapseUtilities" class="collapse"
               aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <a class="collapse-item" href="${path }/acct/is.do">손익계산표</a>
                  <a class="collapse-item" href="${path }/acct/wage.do">월급 관리</a> 
                  <a class="collapse-item" href="${path }/acct/biztrip.do">출장비 관리</a>
                  <a class="collapse-item" href="${path }/acct/severance.do">퇴직금 관리</a>
               </div>
            </div></li>

         <!-- 일정 관리 -->
         <li class="nav-item"><a class="nav-link" href="${path }/calendar/allView.do?temp=${loginEmp['EMPNO'] }">
               <i class="fas fa-fw fa-tachometer-alt"></i> <span>일정 관리</span>
         </a></li>

         <!-- 게시판 관리 -->
         <li class="nav-item">
           <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseNotice" aria-expanded="true" aria-controls="collapseNotice">
             <i class="fas fa-fw fa-cog"></i>
             <span>게시판 관리</span>
           </a>
           
           <div id="collapseNotice" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
               <a class="collapse-item" href="${path }/notice/selectNoticeList.do">공지사항</a>
               <a class="collapse-item" href="${path }/notice/selectNoticeDeptList.do">부서별게시판</a>
               <a class="collapse-item" href="${path }/notice/guidelineList.do">지침/규정</a>
               <a class="collapse-item" href="${path }/notice/site.do">관련사이트</a>
             </div>
           </div>
         </li>



         <!-- Divider -->
         <hr class="sidebar-divider d-none d-md-block">

         <!-- Sidebar Toggler (Sidebar) -->
         <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
         </div>

      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">

            <!-- Topbar -->
            <nav
               class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                  <input type="button" id="goToWork" class="btn btn-primary mr-2" value="출근체크" style="width: 100px;display:none;">
                  <input type="button" id="offWork" class="btn btn-primary mr-2" value="퇴근체크" style="width: 100px;display:none;" >
               <!-- 각 날자에 출퇴근이 있는지 확인, 없으면 출근체크 버튼 나타남 -->
               <script>
               $(function(){
                  var d = new Date();
                  var day = d.getFullYear()+"-"+d.getMonth()+1+"-"+d.getDate();
                  var empNo = $('#empNo').val().trim();
                  $.ajax({
                     url:"${path}/emp/selectAttenOne.do",
                     data:{"day":day, "empNo":empNo},
                     method:"post",
                     success:function(data) {
                        if(data > 0) {
                           $('#offWork').show();
                        } else {
                           $('#goToWork').show();
                        }
                     }
                  });
               })
               
               </script>
               <!-- Sidebar Toggle (Topbar) -->
               <button id="sidebarToggleTop"
                  class="btn btn-link d-md-none rounded-circle mr-3">
                  <i class="fa fa-bars"></i>
               </button>
               <!-- <ul>
                    <li>위도:<span id="latitude"></span></li>
                    <li>경도:<span id="longitude"></span></li>
                </ul> -->
               <!-- 출퇴근 스크립트 -->
               <input type="hidden" value="${loginEmp.EMPNO}" name="empNo" id="empNo"/>
               <script>
                  $(function(){
                     var empNo = $('#empNo').val().trim();
                     //출근
                     $('#goToWork').click(function(){
                        if (navigator.geolocation) {
                              //위치 정보를 얻기
                              navigator.geolocation.getCurrentPosition (function(pos) {
                                  $('#latitude').html(pos.coords.latitude);     // 위도
                                  $('#longitude').html(pos.coords.longitude); // 경도
                                  var la = pos.coords.latitude;
                                  var lo = pos.coords.longitude;
                                  var d = new Date();
                                  var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초";
                                  
                                  $.ajax({
                                     url:"${path}/emp/empGotoWork.do",
                                     data:{"la":la,"lo":lo, "empNo":empNo},
                                     method:"post",
                                     success:function(data){
                                        if(data>0) {
                                           alert(currentTime + " 출근체크되었습니다.");
                                           $('#offWork').show();
                                           $('#goToWork').hide();
                                        } else {
                                           alert("지정된 위치에서 출근체크 해주세요.");
                                        }
                                     }
                                  }); 
                              });
                          } else {
                              alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
                          }
                     });
                     
                     //퇴근
                     $('#offWork').click(function(){
                        if (navigator.geolocation) {
                              //위치 정보를 얻기
                              navigator.geolocation.getCurrentPosition (function(pos) {
                                  $('#latitude').html(pos.coords.latitude);     // 위도
                                  $('#longitude').html(pos.coords.longitude); // 경도
                                  var la = pos.coords.latitude;
                                  var lo = pos.coords.longitude;
                                  var d = new Date();
                                  var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초";
                                  $.ajax({
                                     url:"${path}/emp/empOffWork.do",
                                     data:{"la":la,"lo":lo, "empNo":empNo},
                                     method:"post",
                                     success:function(data){
                                        if(data==1) {
                                           alert(currentTime + " 퇴근체크되었습니다.");
                                        } else {
                                           alert("지정된 위치에서 퇴근체크 해주세요.");
                                        }
                                     }
                                  }); 
                              });
                          } else {
                              alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
                          }
                     });
                  })
               
               </script>

               <!-- Topbar Navbar -->
               <ul class="navbar-nav ml-auto">

                  <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                  <li class="nav-item dropdown no-arrow d-sm-none"><a
                     class="nav-link dropdown-toggle" href="#" id="searchDropdown"
                     role="button" data-toggle="dropdown" aria-haspopup="true"
                     aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
                  </a> <!-- Dropdown - Messages -->
                     <div
                        class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                        aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                           <div class="input-group">
                              <input type="text"
                                 class="form-control bg-light border-0 small"
                                 placeholder="Search for..." aria-label="Search"
                                 aria-describedby="basic-addon2">
                              <div class="input-group-append">
                                 <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                 </button>
                              </div>
                           </div>
                        </form>
                     </div></li>

                  <!-- Nav Item - Alerts -->
                  <li class="nav-item dropdown no-arrow mx-1"><a
                     class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
                     role="button" data-toggle="dropdown" aria-haspopup="true"
                     aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
                        <span class="badge badge-danger badge-counter"></span>
                  </a> <!-- Dropdown - Alerts -->
                     <div
                        class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="alertsDropdown">
                        <h6 class="dropdown-header">Alerts Center</h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                           <div class="mr-3">
                              <div class="icon-circle bg-primary">
                                 <i class="fas fa-file-alt text-white"></i>
                              </div>
                           </div>
                           <div>
                              <div class="small text-gray-500">December 12, 2019</div>
                              <span class="font-weight-bold">A new monthly report is
                                 ready to download!</span>
                           </div>
                        </a> <a class="dropdown-item d-flex align-items-center" href="#">
                           <div class="mr-3">
                              <div class="icon-circle bg-success">
                                 <i class="fas fa-donate text-white"></i>
                              </div>
                           </div>
                           <div>
                              <div class="small text-gray-500">December 7, 2019</div>
                              $290.29 has been deposited into your account!
                           </div>
                        </a> <a class="dropdown-item d-flex align-items-center" href="#">
                           <div class="mr-3">
                              <div class="icon-circle bg-warning">
                                 <i class="fas fa-exclamation-triangle text-white"></i>
                              </div>
                           </div>
                           <div>
                              <div class="small text-gray-500">December 2, 2019</div>
                              Spending Alert: We've noticed unusually high spending for your
                              account.
                           </div>
                        </a> <a class="dropdown-item text-center small text-gray-500"
                           href="#">Show All Alerts</a>
                     </div></li>

                  <!-- Nav Item - Messages -->
                  <li class="nav-item no-arrow mx-1"><a
                     class="nav-link" href="${path }/chat/chatList.do" id="messagesDropdown"
                     role="button"  aria-haspopup="true"   aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
                        <!-- Counter - Messages -->
                  <span id = "unread" class="badge badge-danger badge-counter"></span>
                  </a> 
                  <!-- Nav Item - User Information 로그인정보-->
                  <li class="nav-item dropdown no-arrow">
                     <!-- 로그인 세션 있을 때, --> <c:if test="${not empty loginEmp }">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown"
                           role="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"> <span
                           class="mr-2 d-none d-lg-inline text-gray-600 small">${loginEmp.EMPNAME}</span>
                           <img class="img-profile rounded-circle"
                           src="${path}/resources/upload/emp/${loginEmp.EFRENAME}">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div
                           class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                           aria-labelledby="userDropdown">
                           <a href="${path}/emp/selectEmpOne.do?empNo=${loginEmp.EMPNO}" class="dropdown-item" href="#"> <i
                              class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                              Profile
                           </a>
                           <div class="dropdown-divider"></div>
                           <a class="dropdown-item" href="#"
                              data-toggle="modal" data-target="#logoutModal"> <i
                              class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                              Logout
                           </a>
                        </div>
                     </c:if> <!-- 로그인 세션 있을 때, 끝 -->
                  </li>

               </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                        <button class="close" type="button" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">×</span>
                        </button>
                     </div>
                     <div class="modal-body">로그아웃하시겠습니까?</div>
                     <div class="modal-footer">
                        <button class="btn btn-secondary" type="button"
                           data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="${path }/emp/logoutEmp.do">Logout</a>
                     </div>
                  </div>
               </div>
            </div>

         <!-- Begin Page Content -->
         <div class="container-fluid">

         <!-- Page Heading -->
         <h1 class="h3 mb-4 text-gray-800">${param.pageTitle }</h1>
               
         <form name="openMessageFrm" method="post">
            <input type="hidden" id="userId" name="userId" value="${loginEmp['EMPNO']}">
         </form>
         <input type="hidden" id="deptNo" name="deptNo" value="${loginEmp['DEPTNO']}">      
         <input type="hidden" id="jobNo" name="jobNo" value="${loginEmp['JOBNO']}">
<script>
      var userId = $("#userId").val();
      var deptNo1;
      var deptNo2;
      var jobNo = $('#jobNo').val().trim();
      var deptNo = $('#deptNo').val().trim();
      
      $('#empNav').on("click",function(e){
         deptNo1 = 100;
         if(jobNo != 100 && jobNo != 101) {
            if(deptNo!=deptNo1) {
               alert("권한이 없습니다.");
               e.stopPropagation();
               e.preventDefault();
            }
         }
      });
      $('#bizNav').on("click",function(e){
         deptNo1 = 102;
         deptNo2 = 103;
         if(jobNo != 100 && jobNo != 101) {
            if(deptNo!=deptNo1 && deptNo!=deptNo2) {
               alert("권한이 없습니다.");
               e.stopPropagation();
               e.preventDefault();
            }
         }
      });
      
      $('#acctNav').on("click",function(e){
         deptNo1 = 101;
         if(jobNo != 100 && jobNo != 101) {
            if(deptNo!=deptNo1) {
               alert("권한이 없습니다.");
               e.stopPropagation();
               e.preventDefault();
            }
         }
      });
      
      
      

      //안읽은메세지수 출력
      /* $(function(){
               timer = setInterval(function(){
                  $.ajax({
                     type:"post",
                     url: "${path }/chat/readCount.do",
                     data: {
                        userId: encodeURIComponent(userId)
                     },
                     success: function(result) {
                        if(result>=1) {
                           showUnread(result);
                        } else {
                           showUnread('0');
                        }
                     }
                  });
               },1000);
         });  */
         
         function showUnread(result){
            $('#unread').html(result);
         }
</script>
<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->

<section>
       <div class="card shadow mb-4">
     <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


              <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
                        <input type = "hidden" id = "empNo" value = "${loginEmp['EMPNO'] }"/>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                           <option value = "개인">개인</option>
                           <option value = "부서">부서</option>
                           <option value = "회사">회사</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" style = "resize: none"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"></h3>
            </div>
        </div>
        
        <div class="card-header py-3">
         <h4 class="m-0 font-weight-bold text-primary">새로운 일정</h4>
       </div>
           <div class="row">
                 <div class="col-sm-12">
                   <table class="table table-striped table-hover" id="myTable2" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
                  <tr>
                     <th scope="col">내용</th>                  
                     <th scope="col">카테고리</th>
                  </tr>
                       </thead>
                       <tbody>
                       <tr class = "rooo">
                             <td colspan="2" style = "text-align: center"><strong>새로운 일정이 없습니다.</strong></td>
                          </tr>
                       </tbody>
                   </table>
                 </div>
           </div>
        <div class="card-header py-3">
         <h4 class="m-0 font-weight-bold text-primary">일정 목록</h4>
       </div>


           <div class="row">
                 <div class="col-sm-12">
                    <table class="table table-striped table-hover tablesorter" id="myTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
                  <tr>
                     <th scope="col">No</th>
                     <th scope="col">내용</th>
                     <th scope="col">시작 날짜</th>
                     <th scope="col">종료 날짜</th>                     
                     <th scope="col">카테고리</th>
                     <th scope="col">참고번호</th>
                     <th scope="col"></th>
                  </tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${list}" var="cal" varStatus = "v">
                        <tr>
                        <td>
                           <c:if test="${param.cPage eq null }">
                                 <c:out value="${v.count }"/>
                           </c:if>
                            <c:if test="${param.cPage == 1 }">
                              <c:out value="${v.count }"/>
                        </c:if>         
                           <c:if test="${param.cPage > 1 }">
                              <c:out value="${v.count+(5*(param.cPage-1)) }"/>
                        </c:if>
                        </td>
                           <td>${cal.title}</td>
                           <td>${cal.start}</td>
                           <td>${cal.end}</td>                          
                           <td>${cal.type}</td>
                           <td>${cal._id }</td>
                           <td>
                              <button type ="button" class="btn btn-success mr-2 checkBtn" id = "btn1">수정</button>
                           <button type ="button" class="btn btn-success mr-2"
                           onclick="location.href='${pageContext.request.contextPath }/calender/deleteCal.do?data=${cal._id }&empNo=${loginEmp['EMPNO'] }'">삭제</button>
                        </td>
                        </tr>
                     </c:forEach>
                       </tbody>
                     </table>
                   </div>
                 </div>
               <div style="margin:0 auto; width:fit-content;">
                 ${pageBar }
               </div>
               <input type = "hidden" id = "empNo2" value = "${loginEmp['EMPNO'] }"/>
        
        <!-- /.filter panel -->
    </div>
    </div>
    <!-- /.container -->
</section>
    <script src="${path }/resources/full/vendor/js/bootstrap.min.js"></script>
    <script src="${path }/resources/full/vendor/js/moment.min.js"></script>
    <script src="${path }/resources/full/vendor/js/fullcalendar.min.js"></script>
    <script src="${path }/resources/full/vendor/js/ko.js"></script>
    <script src="${path }/resources/full/vendor/js/select2.min.js"></script>
    <script src="${path }/resources/full/vendor/js/bootstrap-datetimepicker.min.js"></script>
   <script src="${path }/resources/full/js/main.js"></script>
    <script src="${path }/resources/full/js/addEvent.js"></script>
    <script src="${path }/resources/full/js/editEvent.js"></script>
    <script src="${path }/resources/full/js/etcSetting.js"></script>
    <script>
    
    $(function() {
        $("#myTable").tablesorter();
      });
    

    $(".checkBtn").click(function(){ 
      
      var str = ""
      var tdArr = new Array();   // 배열 선언
      var checkBtn = $(this);
      
      // checkBtn.parent() : checkBtn의 부모는 <td>이다.
      // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
      var tr = checkBtn.parent().parent();
      var td = tr.children();
      
      var no = td.eq(5).text();
      console.log(no);
      
      window.open("${path}/calendar/updateCal.do?calNo="+no,"일정 수정","width=800, height=800, top=100, left=500, location=no, menubar=no, status=no");
      

      
    });

      
      

       

    </script>



    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />