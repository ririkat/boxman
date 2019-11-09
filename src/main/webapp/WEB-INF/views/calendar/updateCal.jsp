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
  
  <!-- tableSorter -->
  <script src='${path }/resources/hb/js/jquery.tablesorter.min.js'></script>
    
  <script src="${path }/resources/hb/js/bootstrap-datepicker.js"></script>
  <script src="${path }/resources/hb/js/bootstrap-datepicker.ko.js"></script>
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
			<h6 class="m-0 font-weight-bold text-primary">일정 수정</h6>
		</div>
		<div class="card-body">
		<input type = "hidden" name = "calNo" value = "${c._id }"/>
			<div class="form-group">
				<label for="exampleInputName1">Title</label> 
				<input type="text" class="form-control" id="stuffName" value = "${c.title }" name="title">
			</div>
			<div class="form-group">
				<label for="exampleInputName1">Start</label>
 				<input type="date"
					class="form-control" id="exampleInputName1"
					name="calsStart" value = "${c.start }">
			</div>
			
			<div class="form-group">
				<label for="exampleInputName1">End</label>
 				 				<input type="date"
					class="form-control" id="exampleInputName1"
					name="calsEnd" value = "${c.end }">
			</div>
			
		    <div class = "form-group row">
				<label class = "col-sm-2 col-form-labe">카테고리</label>
				</div>
				<div class = "col-sm-10">
					<select name = "stuffMain" id = "stuffMain" class = "form-control">
						<option value="#D25565" style="color: #D25565;">빨간색</option>
						<option value="#9775fa" style="color: #9775fa;">보라색</option>
						<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
						<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
						<option value="#f06595" style="color: #f06595;">핑크색</option>
						<option value="#63e6be" style="color: #63e6be;">연두색</option>
						<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
						<option value="#4d638c" style="color: #4d638c;">남색</option>
						<option value="#495057" style="color: #495057;">검정색</option>
					</select>	
				</div>

		</div>
	</div>

</section>


</body>
</html>