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
			<button type="button" class="btn btn-primary" onclick="enrollApvl();">결재라인등록</button>
			<h2 class="title font-weight-bold text-primary">${dfOne["DFTITLE"]}</h2>

			<form id="apvDocModiForm" class="form-sample" method="post" action="">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-boarded">
								<tr>
									<th>기안제목</th>
									<td><input type="text" id="apvTitle" name="apvTitle"
										width="100%" /></td>
								</tr>
								<tr>
									<th>신청구분</th>
									<td><select id="apvType" name="apvType">
											<option value="일반">일반</option>
											<option value="품의">품의(비용청구)</option>
											<option value="휴가">휴가</option>
											<option value="출장">출장</option>
											<option value="근태">근태</option>
									</select></td>
								</tr>
								<tr>
									<th>문서분류</th>
									<td><input type="text" id="dcTitle" name="dcTitle"
										value="${dfOne['DCTITLE']}" readonly /> <input type="hidden"
										name="empNo" id="empNo" value="${loginEmp['EMPNO']}" />
										<input type="hidden"
										name="dcNo" id="dcNo" value="${dfOne['DCNO']}" /></td>
								</tr>
								<tr>
									<th colspan="2">결재폼</th>
								</tr>
								<tr>
									<td colspan="2">
										<div id="id01" class="text-center">
											${dfOne["DFHEADFORM"]}</div>
									</td>
								</tr>
								<tr>
									<th colspan="2">본문내용</th>
								</tr>
								<tr>
									<td colspan="2"><textarea id="dfContentForm"
											name="dfContentForm" rows="10" cols="100">${dfOne['DFCONTENTFORM']}</textarea></td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td><textarea id="moreInfo"
											name="moreInfo" rows="10" cols="100"></textarea></td>
								</tr>
							</table>

						</div>
					</div>
				</div>
				<button type="button" class="btn btn-primary" style="width: 100%" onclick="submitRequestApv();">기안하기</button>
			</form>
		</div>

		<script>
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
				
				function enrollApvl(){
					var url="${path}/apv/requestApvLineEnroll.do";
		      		var name="결재라인등록"
		            window.open(url,name,"width=1000,height=800,left=600");
				}
				
				function returnApvLA(value,idx){
					var inputApvlA=$('<input>');
					inputApvlA.val(value);
					inputApvlA.attr({"id":"apvLA"+idx,"type":"hidden","name":"apvLA"});
					
					$('#apvDocModiForm').append(inputApvlA);
				}
				function returnApvLE(value){
					var inputApvlE=$('<input>');
					inputApvlE.val(value);
					inputApvlE.attr({"id":"apvLE","type":"hidden","name":"apvLE"});
					
					$('#apvDocModiForm').append(inputApvlE);
				}
				function returnApvLR(value,idx){
					var inputApvlR=$('<input>');
					inputApvlR.val(value);
					inputApvlR.attr({"id":"apvLR"+idx,"type":"hidden","name":"apvLR"});
					
					$('#apvDocModiForm').append(inputApvlR);
				}
				
				function submitRequestApv(){
					var formContents = $('#apvDocModiForm').serializeObject();
					
					var headContent=$('#id01').html().trim();
					formContents["headContent"]=headContent;
					
					$.ajax({
						url:"${path}/apv/requestApvEnrollEnd.do",
						type : "post",
						data : JSON.stringify(formContents),
						contentType: "application/json",
						success : function(data) {
							if(data>0){
								alert("기안성공");
								self.close();
								window.opener.location.reload();
							}else{
								alert("기안실패");
							}
						}
					});
				}
				
				$.fn.serializeObject = function() {

					  var result = {}
					  var extend = function(i, element) {
					    var node = result[element.name]
					    if ("undefined" !== typeof node && node !== null) {
					      if ($.isArray(node)) {
					        node.push(element.value)
					      } else {
					        result[element.name] = [node, element.value]
					      }
					    } else {
					      result[element.name] = element.value
					    }
					  }

					  $.each(this.serializeArray(), extend)
					  return result
					}

				
				</script>
	</section>

</body>
</html>

