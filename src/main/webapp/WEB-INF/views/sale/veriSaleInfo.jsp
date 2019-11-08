<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="판매정보 조회" name="tabTitle"/> 
</jsp:include>

<style>
.inputSuperTax {
	width: 100px;
}
.stuffNum {
	width: 50px;
}
.calPrice {
	width: 85px;
}
.clickable {cursor: pointer;}
.active{ width:10px; height:10px; background:skyblue; color:white;}
</style>

<section>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">판매정보 조회</h6>
        </div>
		<div class="card-body">
			<form id = "enrollSalInfoFrm" class="forms-sample" method="post" action="${path }/sale/saleList.do">
				<div class="form-group" style="width:150px;">
					<label>판매코드</label>
					<input type="text" class="form-control" style="text-align:center;" value="${saleInfo['SALCODE'] }" readonly="readonly" />
				</div>
				<br/>
				
				<div class="form-group" style="width:250px;">
					<label>등록일자</label>
					<input type="text" class="form-control" style="text-align:center;" value="${saleInfo['SALENROLLDATE'] }" readonly="readonly" />
				</div>
				<br/>
				
				<div class="form-group" style="width:150px;">
					<label>담당자</label>
					<input type="text" class="form-control" id="chargeName" name="chargeName" style="text-align:center;" value="${saleInfo['EMPNAME'] }" readonly="readonly" />
				</div>
				<br/>
				
				<div class="form-group" style="width:150px;">
					<label>판매처</label>
					<input type="text" class="form-control" id="conName" name="conName" style="text-align:center;" value="${saleInfo['CONNAME'] }" required readonly />
				</div>
				<br/>
				
				<div class="form-group">
                 	<div class="row">
		                 <div class="col-sm-12" id = "area">
							<label>판매할 품목</label>
		                    <table class="table table-striped table-hover" id="dataTable2" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
		                       <thead>
		                         <tr align="center">
		                            <th>품번</th>
									<th>품명</th>
									<th>소분류</th>
									<th>단가</th>
									<th>수량</th>
									<th>합계</th>
		                         </tr>
		                       </thead>
		                       <tbody>
		                          <c:forEach items="${saleItemList }" var="s">
		                          	<tr style="text-align:center;">
		                          		<td><c:out value="${s['STUFFNO'] }"/></td>
		                          		<td><c:out value="${s['STUFFNAME'] }"/></td>
		                          		<td><c:out value="${s['SCNAME'] }"/></td>
		                          		<td><c:out value="${s['PRICE'] }"/></td>
		                          		<td><c:out value="${s['SITEMQUAN'] }"/></td>
		                          		<td style="text-align:right;"><c:out value="${s['PRICE'] *s['SITEMQUAN'] } 원"/></td>
		                          	</tr>
		                          </c:forEach>
		                       </tbody>
		                     </table>
		                   </div>
                 	</div>
				</div>
				<br/>
				
				<div class="form-group">
					<label>거래 유형</label>
					<c:if test="${saleInfo['SALTRANTYPE'].trim() eq 'N'}">
						<div class="col-sm-4">
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="salTranType" id="salTranType1" value="N" checked disabled> 부가세율 미적용 <i class="input-helper"></i>
								</label>
							</div>
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="salTranType" id="salTranType2" value="Y" disabled> 부가세율 적용 <i class="input-helper"></i>
								</label>
							</div>
						</div>
					</c:if>
					<c:if test="${saleInfo['SALTRANTYPE'].trim() eq 'Y'}">
						<div class="col-sm-4">
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="salTranType" id="salTranType1" value="N" disabled> 부가세율 미적용 <i class="input-helper"></i>
								</label>
							</div>
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="salTranType" id="salTranType2" value="Y" checked disabled> 부가세율 적용 <i class="input-helper"></i>
								</label>
							</div>
						</div>
						<br/>
						<div class="inputSuperTax form-group">
							<label>부가세율</label>
							<input type="number" step="0.01" min="0.00" class="form-control" id="saleSuperTax" name="saleSuperTax" value="${saleInfo['SALESUPERTAX'] }"/>
						</div>
					</c:if>
				</div>
				<br/>
				
				<div class="form-group" style="width:150px;">
					<label>판매 총액</label>
					<input type="text" class="form-control" id="salTotAmt" name="salTotAmt" value="${saleInfo['SALTOTAMT'] } 원" style="text-align:right;" readonly/>
				</div>
				<br/>
				
				<div class="form-group">
					<label>판매확정여부</label>
					<c:if test="${saleInfo['SALCK'].trim() eq 'N' }">
						<div class="col-sm-4">
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="N" checked disabled> 미확정 <i class="input-helper"></i>
								</label>
							</div>
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="Y" disabled> 판매확정 <i class="input-helper"></i>
								</label>
							</div>
						</div>
					</c:if>
					<c:if test="${saleInfo['SALCK'].trim() eq 'Y' }">
						<div class="col-sm-4">
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="N" disabled> 미확정 <i class="input-helper"></i>
								</label>
							</div>
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="Y" checked disabled> 판매확정 <i class="input-helper"></i>
								</label>
							</div>
						</div>
						<br/>
						<div class="form-group" style="width:250px;">
							<label>판매일자</label>
							<input type="text" class="form-control" style="text-align:center;" value="${saleInfo['SALDATE'] }" readonly="readonly" />
						</div>
					</c:if>
				</div>
				<br/>
				
				<div class="form-group">
					<label>송금여부</label>
					<c:if test="${saleInfo['REMITCK'].trim() eq 'N' }">
						<div class="col-sm-4">
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="N" checked disabled> 송금전 <i class="input-helper"></i>
								</label>
							</div>
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="Y" disabled> 송금완료 <i class="input-helper"></i>
								</label>
							</div>
						</div>
					</c:if>
					<c:if test="${saleInfo['REMITCK'].trim() eq 'Y' }">
						<div class="col-sm-4">
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="N" disabled> 송금전 <i class="input-helper"></i>
								</label>
							</div>
							<div class="form-radio">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" value="Y" checked disabled> 송금완료 <i class="input-helper"></i>
								</label>
							</div>
						</div>
						<br/>
						<div class="form-group" style="width:250px;">
							<label>송금일자</label>
							<input type="text" class="form-control" style="text-align:center;" value="${saleInfo['REMITDATE'] }" readonly="readonly" />
						</div>
					</c:if>
				</div>
				<br/>
				
				<div style="margin:0 auto; width:fit-content;">
					<button type="submit" class="btn btn-success mr-2">확인</button>
				</div>
 			</form>
		</div>
	</div>
</section>













