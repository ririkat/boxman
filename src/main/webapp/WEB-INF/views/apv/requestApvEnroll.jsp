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

<title>기안하기</title>

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
	
	<script src="https://www.w3schools.com/lib/w3.js"></script>

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
			<h2 class="title font-weight-bold text-primary">${dfOne["DFTITLE"]}</h2>

			<form id="apvDocModiForm" class="form-sample" method="post" action="">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							결재폼
							<hr/>
							<div id="id01" class="text-center">
								${dfOne["DFHEADFORM"]}
							</div>
							
							<table class="table table-borded">
								<tr>
									<td>
									본문내용
									</td>
								</tr>
								<tr>
									<td><textarea id="dfContentForm"
											name="dfContentForm" rows="10" cols="100">${dfOne['DFCONTENTFORM']}</textarea></td>
								</tr>
							</table>

						</div>
					</div>
				</div>
				<input type="submit" />
				</form>
				</div>
				
				<script>{{}}
				var oEditors = [];
				$(function() {

					nhn.husky.EZCreator
							.createInIFrame({
								oAppRef : oEditors,
								elPlaceHolder : "dfContentForm",
								sSkinURI : "${path }/resources/se2/SmartEditor2Skin.html",
								fCreator : "createSEditor2"
							});

				});
				
				var myObject = {"loginEmp.empName" : "류별리", "dfTitle" : "테스트1","inputText1":"<input type='text'/>","inputNumber1":"<input type='number'/>"};
				w3.displayObject("id01", myObject);
				</script>
	</section>

</body>
</html>

