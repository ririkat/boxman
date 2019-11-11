<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>기안조회</title>

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
			    <c:if test="${not empty apvOne['APVAPRIOR']}">
			    	<c:if test="${apvOne['APVAPRIOR'] eq apvOne['CURRTURN'] and apvOne['APVASTATUS'] eq '미결'}">
			    		<button type="button" class="btn btn-primary" onclick="apvPermit(${apvOne['APVNO']},${loginEmp['EMPNO']},${apvOne['APVAPRIOR']});">결재하기</button>
						<button type="button" class="btn btn-primary" onclick="apvReturn(${apvOne['APVNO']},${loginEmp['EMPNO']},${apvOne['APVAPRIOR']});">반려하기</button>
			    	</c:if>
			    </c:if>
			    <c:if test="${not empty apvOne['APVENO']}">
			    	<c:if test="${apvOne['APVESTATUS'] eq '미시행'}">
			    			<button type="button" class="btn btn-primary" onclick="apvEnforce(${apvOne['APVNO']},${loginEmp['EMPNO']});">시행하기</button>
							<button type="button" class="btn btn-primary" onclick="apvEReturn(${apvOne['APVNO']},${loginEmp['EMPNO']});">반송하기</button>
					</c:if>
			    </c:if>
			<h2 class="title font-weight-bold text-primary">${apvOne["APVTITLE"]}</h2>

			<form id="apvDocModiForm" class="form-sample" method="post" action="">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-boarded">
								<tr>
									<th>기안제목</th>
									<td>${apvOne['APVTITLE']}</td>
								</tr>
								<tr>
									<th>신청구분</th>
									<td>${apvOne['APVTYPE']}</td>
								</tr>
								<tr>
									<th>문서분류</th>
									<td>${apvOne['DCTITLE']}</td>
								</tr>
								<tr>
									<th colspan="2">결재폼</th>
								</tr>
								<tr>
									<td colspan="2">
										<div id="id01" class="text-center">
											${apvOne["APVHCONTENT"]}</div>
									</td>
								</tr>
								<tr>
									<th colspan="2">본문내용</th>
								</tr>
								<tr>
									<td colspan="2"><div id="id01" class="text-center">
											${apvOne['APVCCONTENT']}</div></td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td>${apvOne['MOREINFO']}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>

		<script>
		$(function(){
			window.opener.location.reload();
		});
		function apvPermit(apvNo,empNo,priorNo){
			if(confirm("결재처리하시겠습니까?")){
				/* 추가 결재 로직 추가 */
				/* 먼저 결재폼에 cateName를 가져온다! 있다면 가져와질거고 없으면 안가져와 지겠지?*/
				/*  cateName이 있는지 없는지 먼저 분기처리한 후에, 네임값에 따라 보낼 값을 넣어준다 (cateNo,sDate,eDate,pay) */
				/* 
					일반 결재인 경우는 기존 파라미터 값만 넣어서 넘겨주고,
					추가 결재인 경우는 분기처리해서 값을 넣어 전송!한다. mapping은 추가결재용 매핑으로 넘겨줌.
					단, 청구 금액이 있는 추가 결재는 일반결재와 같이 보내고 시행할 때 분기 처리함.
				*/
				/* ajax로 처리하고 팝업 창 닫기 */
				
				//먼저 ajax에서 넘겨줄 Object 생성, 기본 파라미터를 넣어줌.
				var param=new Object();
				param["apvNo"]=apvNo;
				param["empNo"]=empNo;
				param["priorNo"]=priorNo;
				
				//cateName 가져옴.
				var cateName=$('#cateName').val();
				var cateNo;
				var sDate;
				var eDate;
				var pay;
				if("undefined" !== typeof cateName && cateName !== null){
					var ckCol=$('#ckCol').val();
					var pkey=$('#pkey').val();
					var cateNo=$('#cateNo').val();
					var sDate;
					var eDate;
					var pay;
					
					param["cateName"]=cateName;
					param["ckCol"]=ckCol;
					param["pkey"]=pkey;
					param["cateNo"]=cateNo;
					
					if(cateName=="purchaseTab" || cateName=="saleTab"){
						var ckCol2=$('#ckCol2').val();
						var ckColDate=$('#ckColDate').val();
						var ckColDate2=$('#ckColDate2').val();
						param["ckCol2"]=ckCol2;
						param["ckColDate"]=ckColDate;
						param["ckColDate2"]=ckColDate2;
					}
					
						$.ajax({
							url:"${path}/apv/apvAddPermit.do",
							type : "post",
							data : param,
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								var result=data;
								alert(result["msg"]);
								var reName=result["EFRENAME"];
								var imgTag=$("<img/>");
								imgTag.attr({"src":"${path}/resources/upload/emp/"+reName,"width":"50px","height":"50px;"});
								
								var prior=result["APVAPRIOR"];
								console.log("stamp"+prior);
								$('#stamp'+prior).html(imgTag);
								saveUpdate(apvNo);
							}
						});
						
				}else{
					//일반결재
					$.ajax({
						url:"${path}/apv/apvPermit.do",
						type : "post",
						data : param,
                        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data) {
							var result=data;
							alert(result["msg"]);
							var reName=result["EFRENAME"];
							var imgTag=$("<img/>");
							imgTag.attr({"src":"${path}/resources/upload/emp/"+reName,"width":"50px","height":"50px;"});
							
							var prior=result["APVAPRIOR"];
							console.log("stamp"+prior);
							$('#stamp'+prior).html(imgTag);
							saveUpdate(apvNo);
						}
					});
				}
      		}
		}
		
		function saveUpdate(apvNo){
			var headContent=$("#id01").html();
			$.ajax({
				url:"${path}/apv/apvSaveUpdate.do",
				type : "post",
				data : {"apvNo":apvNo,"headContent":headContent},
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					if(data>0){
						alert("저장완료");
					}else{
						alert("저장실패");
					}
				}
			});
			
		}
		
		function apvReturn(apvNo,empNo){
			var moreInfo = prompt("반려사유를 입력하세요","");
			location.href="${path}/apv/apvReturn.do?apvNo="+apvNo+"&empNo="+empNo+"&moreInfo="+moreInfo;
		}
		function apvEnforce(apvNo,empNo){
			if(confirm("시행처리하시겠습니까?")){
      			location.href="${path}/apv/apvEnforce.do?apvNo="+apvNo+"&empNo="+empNo;
      		}
		}
		function apvEReturn(apvNo,empNo){
			var moreInfo = prompt("반송사유를 입력하세요","");
			location.href="${path}/apv/apvEReturn.do?apvNo="+apvNo+"&empNo="+empNo+"&moreInfo="+moreInfo;
		}
		</script>
	</section>

</body>
</html>

