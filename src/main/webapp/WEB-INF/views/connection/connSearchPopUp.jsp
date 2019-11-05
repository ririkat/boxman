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
<body>

<section>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">거래처 목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper"
					class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-hover" id="dataTable"
								width="100%" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr>
										<th>거래처코드</th>
										<th>거래처명</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="c">
										<tr>
											<td><c:out value='${c.conCode}' /></td>
											<td>${c.conName}</td>
											<td><button type="button" class="btn btn-success mr-2 choiceBtn">선택</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		${pageBar }
	</div>

</section>

<script>
$(".choiceBtn").click(function(){
	var choiceBtn = $(this);
	var tr = choiceBtn.parent().parent();
	var td = tr.children();
	var conName = td.eq(1).text();
	
	console.log(conName);

	opener.document.getElementById("conName").value = conName;
	self.close();	
});
</script>

</body>
</html>