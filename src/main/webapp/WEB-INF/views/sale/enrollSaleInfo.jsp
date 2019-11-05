<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="판매정보 등록" name="tabTitle"/> 
</jsp:include>

<style>
.inputChargeName {
	width: 280px;
}
.inputConName {
	width: 280px;
	display: inline-block;
}
.searchStuffName {
	width: 280px;
}
.inputSuperTax {
	width: 100px;
}
.inputTotAmt {
	width: 130px;
}
.stuffNum {
	width: 50px;
}
.calPrice {
	width: 85px;
}
</style>

<section>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">판매정보 등록</h6>
        </div>
		<div class="card-body">
			<form id = "enrollSalInfoFrm" class="forms-sample" method="post">
				<div class="inputChargeName form-group">
					<label>담당자</label>
					<input type="text" class="form-control" id="chargeName" name="chargeName" style="text-align:center;" value="${loginEmp['EMPNAME'] }" readonly="readonly" />
					<input type="hidden" name="chargeNo" value="${loginEmp['EMPNO'] }" />
				</div>
				<br/>
				
				<div class="dataTables_length" id="dataTable_length">
					<label>판매처 검색
						<select name="type" id="type" class="form-control form-control-sm">
							<option value="conName">거래처명</option>
							<option value="conCode">거래처 코드</option>
						</select>
						<input type="search" class="form-control form-control-sm" name="data" aria-controls="dataTable" id = "data">
					</label>
				    <button type="button" class="btn btn-light btn-icon-split" onclick="searchConnection();">
                   		 <span class="icon text-gray-600">
                    	  <i class="fas fa-arrow-right"></i>
                   		 </span>
                   		 <span class="text">검색</span>
                    </button>
				</div>
				<div class="inputConName form-group">
					<input type="text" class="form-control" id="conName" name="conName" style="text-align:center;" required readonly />
				</div>
				<br/>
				<br/>
				<br/>
				
				<div class="form-group">
						<label>물품 검색</label>
					<div class="searchStuffName input-group mb-4">
			            <input type="search" placeholder="제품명으로 검색" aria-describedby="button-addon5" class="form-control" name="stuffName" id="stuffName" value="">
			            <div class="input-group-append">
			              <button id="button-addon5" type="button" class="btn btn-primary">
			              	<i class="fa fa-search"></i>
			              </button>
			            </div>
			        </div>
			        <div class="row">
		                 <div class="col-sm-12">
		                    <table class="table table-striped table-hover" id="dataTable1" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
		                       <thead>
		                         <tr align="center">
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
									<th>판매 목록에 추가</th>
		                         </tr>
		                       </thead>
		                       <tbody>

		                       </tbody>
		                     </table>
		                   </div>
                 	</div>
                 	<br>
                 	<br>
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
									<th>삭제</th>
		                         </tr>
		                       </thead>
		                       <tbody>
		                          
		                       </tbody>
		                     </table>
		                   </div>
                 	</div>
				</div>
				<br/>
				
				<div class="inputSuperTax form-group">
					<label>부가세율</label>
					<input type="text" class="form-control" id="saleSuperTax" name="saleSuperTax" placeholder="0.0"/>
				</div>
				<br/>
				
				<div class="form-group">
					<label>거래 유형</label>
					<div class="col-sm-4">
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="salTranType" id="salTranType1" value="Y" checked=""> 부가세율 적용 <i class="input-helper"></i>
							</label>
						</div>
					
						<div class="form-radio">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="salTranType" id="salTranType2" value="N"> 부가세율 미적용 <i class="input-helper"></i>
							</label>
						</div>
					</div>
				</div>
				<br/>
				
				<div class="inputTotAmt form-group">
					<label>구매 총액</label>
					<input type="text" class="form-control" id="salTotAmt" name="salTotAmt" placeholder=" 원" style="text-align:right;" readonly/>
				</div>

				<br/>
				<button type="submit" class="btn btn-success mr-2">등록</button>
				<button class="btn btn-light" onclick="submitCancel();">취소</button>
 			</form>
		</div>
	</div>

	<form name="searchConFrm" method="post">
		<input type="hidden" name="type_" />
		<input type="hidden" name="data_" />
	</form>
</section>

<script>
function searchConnection(){	
	var url = "${path}/connection/searchConnection3.do";
	var name = "거래처 검색";
	var option = "width=500, height=500, top=100, left=500, location=no, menubar=no, status=no"
	var popup = open("", name, option);
	
	var type = $("select[name=type]").val().trim();
	var data = $("input[name=data]").val().trim();
	
	searchConFrm.type_.value = type;
	searchConFrm.data_.value = data;
	searchConFrm.target = name;
	searchConFrm.action = url;
	searchConFrm.submit();
}

$("#button-addon5").click(function(){
	var stuffName = $('#stuffName').val();
	$.ajax({
		url : "${path}/stuff/searchStuffName2.do?stuffName="+stuffName,
		type : "post",
		success:function(data){
			$("#dataTable1").find(".dataTable1").remove();
			for(var i = 0; i < data.length; i++) {
				tr = $('<tr class="dataTable1" align="center"/>');
				tr.append("<td>" + data[i].stuffNo + "</td>");
				tr.append("<td>" + data[i].stuffName + "</td>");
				tr.append("<td>" + data[i].scName + "</td>");
				tr.append("<td>" + data[i].price + "</td>");
		        tr.append("<td>" + data[i].weight + "</td>");
		        tr.append("<td>" + data[i].size1 + "</td>");
		        tr.append("<td>" + data[i].size2 + "</td>");
		        tr.append("<td>" + data[i].size3 + "</td>");
		        tr.append("<td>" + data[i].color + "</td>");
		        tr.append("<td>" + data[i].material + "</td>");
		        tr.append("<td>" + "<button type='button' class='btn btn-success mr-2 addBtn' id='addBtn"+i+"'>추가</button>" + "</td>");
		        $('#dataTable1').append(tr);
			}

			$(".addBtn").click(function(){
				var addBtn = $(this);
				var td = addBtn.parent().parent().children();
				var stuffNo = td.eq(0).text();
				var price = td.eq(3).text();
				
				var cnt = 0;
				var tb2TrList = $('#dataTable2').children().eq(1).children();
				for(var i=0; i<tb2TrList.length; i++){
					if(tb2TrList.eq(i).children().eq(0).text() == stuffNo){
						cnt++;
					}
				}
				if(cnt==0){
					var tr = $('<tr class="dataTable2" align="center"/>');
					tr.append("<td>" + stuffNo + "</td>");
					tr.append("<td>" + td.eq(1).text() + "</td>");
					tr.append("<td>" + td.eq(2).text() + "</td>");
					tr.append("<td>" + price + "</td>");
					tr.append("<td>" + "<input type='number' class='stuffNum' value='1' min='1' /> 개" + "</td>");
					tr.append("<td>" + "<input type='text' class='calPrice' value='" + price + "' readonly/>" + " 원" + "</td>");
					tr.append("<td>" + "<button type='button' class='btn btn-success mr-2 deleteBtn'>삭제</button>" + "</td>");
				    $('#dataTable2').append(tr);

					var calPriceList = $(".calPrice");
					var sum = 0;
					for(var i=0; i<calPriceList.length; i++){
						sum = sum + Number(calPriceList.eq(i).val());
					}
					$("#salTotAmt").attr("value",sum);
				}
				cnt = 0;
				
				$(".stuffNum").change(function(){
					var stuffNum = $(this);
					var thisTr = stuffNum.parent().parent();
					var tdList = thisTr.children();
					var price = tdList.eq(3).text();
					var stNum = tdList.eq(4).find('input').val();
					var result = price*stNum;
					tdList.eq(5).find('input').attr("value",result);
					
					var calPriceList = $(".calPrice");
					var sum = 0;
					for(var i=0; i<calPriceList.length; i++){
						sum = sum + Number(calPriceList.eq(i).val());
					}
					$("#salTotAmt").attr("value",sum);
				});
	    
				$(".deleteBtn").click(function(){
					var deleteBtn = $(this);
					var tr = deleteBtn.parent().parent();
					var td = tr.children();
					td.remove();
				});
			});
		}
	});
});

function enroll_validate() {
	if($("conName").val() == ""){
		$('#conName').focus();
		alert("거래처명을 입력해주세요.");
	    return false;
	}
	if($('#dataTable2').children().eq(1).children().length == 0){
		alert("물품 검색을 통해 판매 품목을 추가해 주세요.");
	    return false;
	}
	else{
		var trs = $('#dataTable2').children().eq(1).children();
		for(var i=0; i<trs.length; i++){
			var element = $("<input type='hidden' />");
			element.attr("name", "stNo"+i);
			element.attr("value", trs.eq(i).children().eq(0).text());
			$("#enrollSalInfoFrm").append(element);
			
			var element2 = $("<input type='hidden' />");
			element2.attr("name", "stNum"+i);
			element2.attr("value", trs.eq(i).children().eq(4).find('input').val());
			$("#enrollSalInfoFrm").append(element2);
		}
		var count = $("<input type='hidden' name='cnt' />");
		count.attr("value", trs.length);
		$("#enrollSalInfoFrm").append(count);
		return true;
	}
}

function submitCancel(){
	location.href="${path}/sale/saleList.do";
}

</script>













