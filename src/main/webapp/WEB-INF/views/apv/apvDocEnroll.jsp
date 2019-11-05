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
<%--   <script src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script> --%>

<!-- Custom scripts for all pages-->
<%--   <script src="${path }/resources/b4/js/sb-admin-2.min.js"></script> --%>

<script type="text/javascript"
	src="${path }/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
.title{
	margin-top:20px;
	margin-bottom:20px;
	text-align:center;
}
</style>
</head>
<body id="page-top">
	<section>
		<div class="container">
		<h2 class="title font-weight-bold text-primary">결재 양식 등록</h2>

			<form id="apvDocEnrollForm" class="form-sample" method="post">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold">기본정보</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							
							<table class="table table-borded">
								<tr>
									<th>양식분류</th>
									<td>
										<select name = "dcNo" id = "dcNo" class="form-control">
					                        <option value = "0">양식분류카테고리선택</option>
					                        <c:forEach items="${docCate}" var="dcate">
					                          <option value = "<c:out value='${dcate["DCNO"]}'/>"><c:out value='${dcate["DCTITLE"]}'/></option>
					                        </c:forEach>
					                     </select>
									</td>
								</tr>
								<tr>
									<th>양식명</th>
									<td><input type="text" id="dfTitle" name="dfTitle" /></td>
								</tr>
								<tr>
									<th>문서설명</th>
									<td><input type="text" id="dfExp" name="dfExp" /></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold">결재폼</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
				<table class="table table-borded">
					<tr>
						<th>결재폼양식불러오기</th>
						<td>
							<select name = "docFormHeader" id = "docFormHeader" class="form-control">
											<option value = "0">결재폼양식선택</option>
					                        <c:forEach items="${docHCate}" var="dfh">
					                          <option value = "<c:out value='${dfh["DFHNO"]}'/>"><c:out value='${dfh["DFHTITLE"]}'/></option>
					                        </c:forEach>
					                     </select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="dfHeadForm" name="dfHeadForm" rows="10"
								cols="100"></textarea></td>
					</tr>
				</table>
										</div>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold">본문</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
				<table class="table table-borded">
					<tr>
						<th>본문양식불러오기</th>
						<td>
							<select name = "docFormContent" id = "docFormContent" class="form-control">
											<option value = "0">결재본문양식선택</option>
					                        <c:forEach items="${docCCate}" var="dfc">
					                          <option value = "<c:out value='${dfc["DFCNO"]}'/>"><c:out value='${dfc["DFCTITLE"]}'/></option>
					                        </c:forEach>
					                     </select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="dfContentForm" name="dfContentForm" rows="10"
								cols="100"></textarea></td>
					</tr>
				</table>
				</div>
					</div>
				</div>
				<button class="btn btn-primary" onclick="submitContents()" style="width:100%">등록</button>
			</form>

		</div>


		<script type="text/javascript">
				var oEditors = [];

				$(function() {

					nhn.husky.EZCreator
							.createInIFrame({
								oAppRef : oEditors,
								elPlaceHolder : "dfHeadForm",
								sSkinURI : "${path }/resources/se2/SmartEditor2Skin.html",
								fCreator : "createSEditor2"
							});
					nhn.husky.EZCreator
							.createInIFrame({
								oAppRef : oEditors,
								elPlaceHolder : "dfContentForm",
								sSkinURI : "${path }/resources/se2/SmartEditor2Skin.html",
								fCreator : "createSEditor2"
							});
					/* 결재폼 불러오기 selectbox 변경 이벤트 */
					$('#docFormHeader').on('change',function(){
						var no=$(this).val();
						$.ajax({
							url:"${path}/apv/apvDocHChange.do",
							type : "post",
							data : {"no":no},
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								$('#dfHeadForm').val(data);
								$('#dfHeadForm').html(data);
								editAdd();
								
							}
						});
					});
					/* 본문 양식 불러오기 selectbox 변경 이벤트 */
					$('#docFormContent').on('change',function(){
						var no=$(this).val();
						$.ajax({
							url:"${path}/apv/apvDocCChange.do",
							type : "post",
							data : {"no":no},
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								$('#dfContentForm').val(data);
								$('#dfContentForm').html(data);
								editAdd2();
								
							}
						});
					});
				});
				
				/* ajax로 불러온 데이터 에디터에 그려주기 이벤트 */
				function editAdd(){
					$("#dfHeadForm").next().remove();
					nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "dfHeadForm",
						sSkinURI : "${path }/resources/se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});
				}
				function editAdd2(){
					$("#dfContentForm").next().remove();
					nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "dfContentForm",
						sSkinURI : "${path }/resources/se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});
				}
				
				function submitContents() {
					var content = oEditors.getById["dfHeadForm"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					var txAreaContent = $('#dfHeadForm').val();
					var content2 = oEditors.getById["dfContentForm"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					var txAreaContent2 = $('#dfContentForm').val();
					/* 여기서 내용들을 넘겨주면 되겠네!! 백단으로 submit 해주는 로직 구현 */
/* 					$('#apvDocEnrollForm').submit(); */
					$.ajax({
						url:"${path}/apv/apvDocEnrollEnd.do",
						type : "post",
						data : $('#apvDocEnrollForm').serialize(),
						success : function(data) {
							if(data>0){
								self.close();
								window.opener.location.reload();
							}else{
								alert("등록실패");
							}
						}
					});
				}
			</script>
	</section>

</body>
</html>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>