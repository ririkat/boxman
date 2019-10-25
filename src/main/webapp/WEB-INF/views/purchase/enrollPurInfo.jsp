<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="구매정보 등록" name="tabTitle"/> 
</jsp:include>

<style>
.inputConName {
	width: 280px;
	display: inline-block;
}
.inputChargeName {
	width: 280px;
}
.searchStuffName {
	width: 280px;
}
.inputSuperTax {
	width: 280px;
}
.inputTotAmt {
	width: 280px;
}
</style>

<section>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">구매정보 등록</h6>
        </div>
		<div class="card-body">
			
			<form name="enrollPurInfo" class="forms-sample" action="${path }/purchase/enrollPurInfoEnd.do" method="post" onsubmit="return enroll_validate();">
				<div class="dataTables_length" id="dataTable_length">
					<label>거래처 검색
						<select name="type" id="searchKeyword" class="form-control form-control-sm">
							<option value="#">거래처명</option>
							<option value="#">거래처 코드</option>
						</select>
						<input type="search" class="form-control form-control-sm" name="data" aria-controls="dataTable">
					</label>
					<button onclick="#" class="btn btn-light btn-icon-split">
						<span class="icon text-gray-600">
							<i class="fas fa-arrow-right"></i>
						</span>
						<span class="text">검색</span>
					</button>
				</div>
				<div class="inputConName form-group">
					<input type="text" class="form-control" id="conName" name="conName" placeholder="거래처명" required readonly />
				</div>
				<br/>
				<br/>
				
				<div class="inputChargeName form-group">
					<label>담당자</label>
					<input type="text" class="form-control" id="chargeName" name="chargeName" value="#" required />
				</div>
				<br/>
				
				<div class="form-group">
					<legend>구매 품목 리스트</legend>
					<div class="searchStuffName input-group mb-4">
			            <input type="search" placeholder="제품명으로 검색" aria-describedby="button-addon5" class="form-control">
			            <div class="input-group-append">
			              <button id="button-addon5" type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
			            </div>
			        </div>
			        <div class="row">
		                 <div class="col-sm-12">
		                    <table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
		                       <thead>
		                         <tr>
		                            <th>품번</th>
									<th>품명</th>
									<th>소분류</th>
									<th>단가</th>
									<th>중량</th>
									<th>가로</th>
									<th>세로</th>
									<th>높이</th>
									<th>색상</th>
									<th>재질</th>
									<th>비고</th>
		                         </tr>
		                       </thead>
		                       <tbody>
		                          <c:forEach items="#" var="#">
										<tr>
											<td><a href='#'><c:out value=''/></a></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
										</tr>
									</c:forEach>
		                       </tbody>
		                     </table>
		                   </div>
                 	</div>
                 	<div class="row">
		                 <div class="col-sm-12">
		                    <table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
		                       <thead>
		                         <tr>
		                            <th>품번</th>
									<th>품명</th>
									<th>소분류</th>
									<th>단가</th>
									<th>수량</th>
									<th>합계</th>
		                         </tr>
		                       </thead>
		                       <tbody>
		                          <c:forEach items="#" var="#">
										<tr>
											<td><a href='#'><c:out value=''/></a></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
											<td><c:out value='' /></td>
										</tr>
									</c:forEach>
		                       </tbody>
		                     </table>
		                   </div>
                 	</div>
				</div>
				<br/>
				
				<div class="inputSuperTax form-group">
					<label>부가세율</label>
					<input type="text" class="form-control" id="purSuperTax" name="purSuperTax" placeholder="0.0"/>
				</div>
				<br/>
				
				<div class="form-group">
					<label>거래 유형</label>
					<div class="col-sm-4">
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="purTranType" id="purTranType1" value="Y" checked=""> 부가세율 적용 <i class="input-helper"></i>
							</label>
						</div>
					
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="purTranType" id="purTranType2" value="N"> 부가세율 미적용 <i class="input-helper"></i>
							</label>
						</div>
					</div>
				</div>
				<br/>
				
				<div class="inputTotAmt form-group">
					<label>구매 총액</label>
					<input type="text" class="form-control" id="purTotAmt" name="purTotAmt" placeholder="총액"/>
				</div>

				<br/>
				<button type="submit" class="btn btn-success mr-2">등록</button>
				<button class="btn btn-light" onclick="submitCancel();">취소</button>
			</form>
		</div>
	</div>

</section>

<script>

</script>













