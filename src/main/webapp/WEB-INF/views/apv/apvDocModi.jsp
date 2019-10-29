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

<title>결재양식수정</title>

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

			<form id="apvDocModiForm" class="form-sample" method="post">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold">기본정보</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							
							<table class="table table-borded">
								<tr>
									<th>양식번호</th>
									<td><input type="text" id="dfNo" name="dfNo" value='${dfOne["DFNO"]}'/></td>
								</tr>
								<tr>
									<th>양식분류</th>
									<td>
										<select name = "dcNo" id = "dcNo" class="form-control">
					                        <option value = "0">양식분류카테고리선택</option>
					                        <c:forEach items="${docCate}" var="dcate">
					                          <option value = "<c:out value='${dcate["DCNO"]}'/>" ${dfOne['DCNO']==dcate['DCNO']?'selected="selected"':''} ><c:out value='${dcate["DCTITLE"]}'/></option>
					                        </c:forEach>
					                     </select>
									</td>
								</tr>
								<tr>
									<th>양식명</th>
									<td><input type="text" id="dfTitle" name="dfTitle" value='${dfOne["DFTITLE"]}'/></td>
								</tr>
								<tr>
									<th>문서설명</th>
									<td><input type="text" id="dfExp" name="dfExp" value='${dfOne["DFEXP"]}' /></td>
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
						<th>양식불러오기</th>
						<td>
							<select name = "docFormHeader" id = "docFormHeader" class="form-control">
					                        <option value = "0">결재폼양식선택</option>
					                        <option value = "1">기획서</option>
					                        <option value = "2">품의서</option>
					                        <option value = "3">근태</option>
					                        <%-- <c:forEach items="${dept}" var="dept"> --%>
					                          <%--  <option value = "<c:out value='${dept["DEPTNO"]}'/>"><c:out value='${dept["DEPTNAME"]}'/></option> --%>
					                        <%-- </c:forEach> --%>
					                     </select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="dfHeadForm" name="dfHeadForm" rows="10"
								cols="100">${dfOne['DFHEADFORM']}</textarea></td>
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
						<th>양식불러오기</th>
						<td>
							<select name = "docFormContent" id = "docFormContent" class="form-control">
					                        <option value = "0">본문양식선택</option>
					                        <option value = "1">기획서</option>
					                        <option value = "2">품의서</option>
					                        <option value = "3">근태</option>
					                        <%-- <c:forEach items="${dept}" var="dept"> --%>
					                          <%--  <option value = "<c:out value='${dept["DEPTNO"]}'/>"><c:out value='${dept["DEPTNAME"]}'/></option> --%>
					                        <%-- </c:forEach> --%>
					                     </select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="dfContentForm" name="dfContentForm" rows="10"
								cols="100">${dfOne['DFCONTENTFORM']}</textarea></td>
					</tr>
				</table>
				</div>
					</div>
				</div>
				<button class="btn btn-primary" onclick="saveContents()" style="width:50%">수정</button>
				<button class="btn btn-primary" onclick="javascript:window.close();" style="width:50%">취소</button>
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

				});
				function saveContents() {
					var content = oEditors.getById["dfHeadForm"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					var txAreaContent = $('#dfHeadForm').val();
					var content2 = oEditors.getById["dfContentForm"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					var txAreaContent2 = $('#dfContentForm').val();
					/* 여기서 내용들을 넘겨주면 되겠네!! 백단으로 submit 해주는 로직 구현 */
/* 					$('#apvDocEnrollForm').submit(); */
					$.ajax({
						url:"${path}/apv/apvDocModiEnd.do",
						type : "post",
						data : $('#apvDocModiForm').serialize(),
						success : function(data) {
							//그 형제 태그 안에 ajax 결과값을 출력해줌
							if(data>0){
								window.opener.location.reload();
								window.close();
							}else{
								alert("저장실패");
							}
						}
					});
					
					
				}
			</script>
	</section>

</body>
</html>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>