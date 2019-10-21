<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="BoxMan" name="tabTitle" />
	<jsp:param value='${emp["EMPNAME"]}' name="pageTitle" />
</jsp:include>

<section>
	<div class="col-12 grid-margin">
		<div class="card">
			<div class="card-body">
				<form class="form-sample" id="empFrm" method="post"
					enctype="multipart/form-data">
					<p class="card-description">Personal info</p>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">이름</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empName"
										value='${emp["EMPNAME"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">부서</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empName"
										value='${dept["DEPTNAME"]}' readonly> <select
										name="deptNo" id="deptNo" class="form-control"
										style="display: none;">
										<option value="0">해당 부서를 선택하세요</option>
										<c:forEach items="${deptList}" var="d">
											<option value="<c:out value='${d["DEPTNO"]}'/>"><c:out
													value='${d["DEPTNAME"]}' /></option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">아이디</label>
								<div class="col-sm-9">
									<div id="userId-container">
										<input type="text" class="form-control"
											placeholder="아이디 (4글자이상)" name="empId"
											value='${emp["EMPID"]}' id="empId" readonly>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">직급</label>
								<div class="col-sm-9">
									<input type="text" class="form-control"
										value='${job["JOBNAME"] }' readonly /> <select name="jobNo"
										id="jobNo" class="form-control" style="display: none;">
										<option value="0">해당 직급을 선택하세요</option>
										<c:forEach items="${jobList}" var="j">
											<option value="<c:out value='${j["JOBNO"]}'/>"><c:out
													value='${j["JOBNAME"]}' /></option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">연봉</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="empSal"
										value='${emp["EMPSAL"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">은행</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empSal"
										value='${emp["EMPBANK"]}' readonly> <select
										name="empBank" id="empBank" class="form-control"
										style="display: none;">
										<option value="0">은행을 선택하세요</option>
										<option value="국민은행">국민은행</option>
										<option value="농협은행">농협은행</option>
										<option value="새마을금고">새마을금고</option>
										<option value="신한은행">신한은행</option>
										<option value="우리은행">우리은행</option>
										<option value="카카오뱅크">카카오뱅크</option>
										<option value="하나은행">하나은행</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">주민등록번호</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empSSN"
										value='${emp["EMPSSN"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">계좌번호</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empBankNum"
										value='${emp["EMPBANKNUM"]}' readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">성별</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empGender"
										value='${emp["EMPGENDER"]}' readonly> <select
										class="form-control" name="empGender" style="display: none;">
										<option value="M">Male</option>
										<option value="F">Female</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">전화번호</label>
								<div class="col-sm-9" style="">
									<input type="text" class="form-control" name="empPhone"
										value='${emp["EMPPHONE"]}' readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">이메일</label>
								<div class="col-sm-9" style="">
									<input type="email" class="form-control" name="empEmail"
										value='${emp["EMPEMAIL"]}' readonly>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">주소</label>
								<div class="col-sm-9">
									<input type="text" id="sample6_postcode" style="width: 350px;"
										class="form-control" value='${addr[0]}' readonly> <input
										type="text" class="form-control" id="sample6_address"
										style="width: 350px;" value='${addr[1]}' readonly> <input
										type="text" class="form-control" id="sample6_detailAddress"
										style="width: 170px;" value='${addr[2]}' readonly> <input
										type="text" class="form-control" id="sample6_extraAddress"
										style="width: 170px;" value='${addr[3]}' readonly>
								</div>
							</div>
						</div>
					</div>
					<%-- <div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">전화번호</label>
								<div class="col-sm-9" style="">
									<input type="text" class="form-control" name="empPhone"
										value='${emp["EMPPHONE"]}' readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">이메일</label>
								<div class="col-sm-9" style="">
									<input type="email" class="form-control" name="empEmail"
										value='${emp["EMPEMAIL"]}' readonly>
								</div>
							</div>
						</div>
					</div> --%>
					<c:forEach var="f" items="${list}">
						<div class="row">
							<c:if test="${f.efcName eq '증명사진'}">
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">사원사진</label>
									<div class="col-sm-9">
											<img src="${path}/resources/upload/emp/${f.efReName}" style="width:200px; height:auto;" />
										
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${f.efcName eq '결재도장'}">
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">결재도장</label>
									<div class="col-sm-9">
											<img src="${path}/resources/upload/emp/${f.efReName}" style="width:200px; height:auto;"/>
										
									</div>
								</div>
							</div>
							</c:if>
						</div>
						<div class="row">
							<c:if test="${f.efcName eq '자격증'}">
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">자격증사진 </label>
									<div class="col-sm-9">
										<img src="${path}/resources/upload/emp/${f.efReName}" style="width:200px; height:auto;"/>
									</div>
								</div>
							</div>
							</c:if>
							<div class="col-md-6">
								<div class="form-group row" id="setHeight" style="height: 40px;">
								</div>
							</div>
						</div>
					</c:forEach>
					<div style="margin: 0 auto; width: fit-content;">
						<input type="button" id="updateEmp" class="btn btn-success mr-2"
							value="수정" style="width: 150px;">
					</div>
				</form>
			</div>
			<form name="updateFrm" action="${path }/emp/selectEmpOne.do">
				<input type="hidden" value='${emp[EMPNO]}' name="empNo" />
			</form>
		</div>
	</div>
</section>
<script>
	$(function(){
		$('#updateEmp').click(function(){
			updateFrm.submit();
		});
	});
   
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />