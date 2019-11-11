<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>기안조회</title>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Custom fonts for this template-->
<link
	href="${path }/resources/b4/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- CSS -->
<link href="${path }/resources/b4/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="${path }/resources/b4/vendor/jquery/jquery.min.js"></script>
<script
	src="${path }/resources/b4/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<%--   <script src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script> --%>

<!-- Custom scripts for all pages-->
<%--   <script src="${path }/resources/b4/js/sb-admin-2.min.js"></script> --%>

<script type="text/javascript"
	src="${path }/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
.title {
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}
</style>

</head>
<body id="page-top">
	<section>
		<div class="container">
			    <c:if test="${not empty apvOne['APVAPRIOR']}">
			    	<c:if test="${apvOne['APVAPRIOR'] eq apvOne['CURRTURN'] and apvOne['APVASTATUS'] eq '미결'}">
			    		<button type="button" class="btn btn-primary" onclick="apvPermit(${apvOne['APVNO']},${loginEmp['EMPNO']},${apvOne['APVAPRIOR']});">결재하기</button>
						<button type="button" class="btn btn-primary" onclick="apvReturn(${apvOne['APVNO']},${loginEmp['EMPNO']},${apvOne['APVAPRIOR']});">반려하기</button>
			    	</c:if>
			    </c:if>
			    <c:if test="${not empty apvOne['APVENO']}">
			    	<c:if test="${apvOne['APVESTATUS'] eq '미시행'}">
			    			<button type="button" class="btn btn-primary" onclick="apvEnforce(${apvOne['APVNO']},${loginEmp['EMPNO']});">시행하기</button>
							<button type="button" class="btn btn-primary" onclick="apvEReturn(${apvOne['APVNO']},${loginEmp['EMPNO']});">반송하기</button>
					</c:if>
			    </c:if>
			<h2 class="title font-weight-bold text-primary">${apvOne["APVTITLE"]}</h2>

			<form id="apvDocModiForm" class="form-sample" method="post" action="">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-boarded">
								<tr>
									<th>기안제목</th>
									<td>${apvOne['APVTITLE']}</td>
								</tr>
								<tr>
									<th>신청구분</th>
									<td>${apvOne['APVTYPE']}</td>
								</tr>
								<tr>
									<th>문서분류</th>
									<td>${apvOne['DCTITLE']}</td>
								</tr>
								<tr>
									<th colspan="2">결재폼</th>
								</tr>
								<tr>
									<td colspan="2">
										<div id="id01" class="text-center">
											${apvOne["APVHCONTENT"]}</div>
									</td>
								</tr>
								<tr>
									<th colspan="2">본문내용</th>
								</tr>
								<tr>
									<td colspan="2"><div id="id01" class="text-center">
											${apvOne['APVCCONTENT']}</div></td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td>${apvOne['MOREINFO']}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>

		<script>
		$(function(){
			window.opener.location.reload();
		});
		function apvPermit(apvNo,empNo,priorNo){
			if(confirm("결재처리하시겠습니까?")){
      			location.href="${path}/apv/apvPermit.do?apvNo="+apvNo+"&empNo="+empNo+"&priorNo="+priorNo;
      		}
		}
		function apvReturn(apvNo,empNo){
			var moreInfo = prompt("반려사유를 입력하세요","");
			location.href="${path}/apv/apvReturn.do?apvNo="+apvNo+"&empNo="+empNo+"&moreInfo="+moreInfo;
		}
		function apvEnforce(apvNo,empNo){
			if(confirm("시행처리하시겠습니까?")){
      			location.href="${path}/apv/apvEnforce.do?apvNo="+apvNo+"&empNo="+empNo;
      		}
		}
		function apvEReturn(apvNo,empNo){
			var moreInfo = prompt("반송사유를 입력하세요","");
			location.href="${path}/apv/apvEReturn.do?apvNo="+apvNo+"&empNo="+empNo+"&moreInfo="+moreInfo;
		}
		</script>
	</section>

</body>
</html>

