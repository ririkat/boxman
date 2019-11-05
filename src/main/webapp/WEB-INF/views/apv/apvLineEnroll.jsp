<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="BoxMan" name="tabTitle"/> 
   <jsp:param value="양식" name="pageTitle"/>
</jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>결재양식등록</title>

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
<script
	src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${path }/resources/b4/js/sb-admin-2.min.js"></script>

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
			<h2 class="title font-weight-bold text-primary">결재 라인 등록</h2>
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-4">
							<p>조직도</p>
							<hr />
							<a href="#">전체</a><br />
							<ul>
								<c:forEach items="${deptList }" var="dl">
									<a href="#" id="${dl['DEPTNO'] }" class="empLoad">
									<li> &nbsp;${dl['DEPTNAME'] }</li></a>
								</c:forEach>
							</ul>
						</div>
						<div class="col-sm-8">
							<div class="row">
								<table id="empListTbl">
									<tr>
										<th>선택</th>
										<th>사원번호</th>
										<th>부서번호</th>
										<th>직급번호</th>
										<th>사원명</th>
									</tr>
								</table>
							</div>
							<div class="row">

								<div class="col-sm-6">
									<ul>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
									</ul>
								</div>
								<div class="col-sm-6">
									<ul>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<ul>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
									</ul>
								</div>
								<div class="col-sm-6">
									<ul>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				$('.empLoad')
						.on(
								'click',
								function() {
									var deptNo = $(this).attr('id');

									$
											.ajax({
												url : "${path }/apv/selectDeptToEmp.do",
												type : "post",
												data : {
													"deptNo" : deptNo
												},
												dataType : "json",
												contentType : "application/x-www-form-urlencoded; charset=UTF-8",
												success : function(data) {
													var result = data;
													var table = $('#empListTbl');
													$
															.each(
																	result,
																	function(
																			idx,
																			val) {
																		//체크박스
																		//사원번호
																		//부서
																		//직급
																		//사원명
																		var tr = $('<tr>');
																		var ckbox = $(
																				'<input>')
																				.attr(
																						{
																							"type" : "checkbox",
																							"name" : "emp",
																							"value" : val.EMPNO
																						});
																		var td1 = $('<td>');
																		td1
																				.append(ckbox);
																		var td2 = $('<td>');
																		td2
																				.html(val.EMPNO);
																		var td3 = $('<td>');
																		td3
																				.html(val.DEPTNO);
																		var td4 = $('<td>');
																		td4
																				.html(val.JOBNO);
																		var td5 = $('<td>');
																		td5
																				.html(val.EMPNAME);

																		tr
																				.append(
																						td1)
																				.append(
																						td2)
																				.append(
																						td3)
																				.append(
																						td4)
																				.append(
																						td5);
																		table
																				.append(tr);

																	});
												}
											});
								});
			});
		</script>

	</section>

</body>
</html>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>