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
<script
	src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${path }/resources/b4/js/sb-admin-2.min.js"></script>
<style>
	div#userId-container{position:relative; padding:0px;}
	div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:0px;}
	div#userId-container span.ok{color:green;}
	div#userId-container span.no{color:red;}
</style>

</head>
<body>
	<section>
		<div class="col-12 stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">비밀번호 변경</h4>
					<form class="forms-sample" id="upPwFrm">
					<input type="hidden" id="empNo" value="${empNo }"/>
						<div class="form-group row">
							<label for="exampleInputEmail2" class="col-sm-3 col-form-label">비밀번호</label>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control" id="pw"
									placeholder="비밀번호입력">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label">비밀번호 확인</label>
							<div class="col-sm-9">
								<div id="userId-container">
									<input type="password" class="form-control"
										id="pw2" placeholder="비밀번호입력">
									<span class="guide ok okPw">비밀번호 확인이 일치합니다.</span>
			             			<span class="guide no noPw">비밀번호가 일치하지 않습니다.</span>
			             		</div>
							</div>
						</div>
						<div style="margin: 0 auto; width:fit-content;">
							<button type="button" class="btn btn-success mr-2" onclick="return validate();">완료</button>
							<button class="btn btn-light" id="pwCancel">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(function(){
			$('#pw2').blur(function(){
		         var pw = $('#pw').val();
		         var pw2 = $('#pw2').val();
	        	 if(pw == pw2) {
	        		$("span.okPw").show();
					$("span.noPw").hide();
	        	 } else {
	        		$("span.okPw").hide();
	 				$("span.noPw").show();
	        	 }
	         });
			
			$('#pwCancel').click(function(){
				self.close();
			});
		});
		
		function validate() {
			if($('span.noPw').is(":visible")) {
		    	  alert("비밀번호를 확인하세요.");
		    	  return false;
		     }
			var empPassword = $('#pw').val().trim();
			var empNo = $('#empNo').val().trim();
			if(empPassword.length < 4) {
				alert("비밀번호는 4자 이상으로 입력해주세요.");
				return false;
			}
			$.ajax({
				url:"${path}/emp/updatePasswordEnd.do?empNo="+empNo,
				data:{"empPassword":empPassword},
				success:function(data) {
					if(data==1) {
						alert("비밀번호가 변경되었습니다.");
						self.close();
					} else {
						alert("비밀번호 변경이 실패하였습니다.");
					}
				}
			})
		}
		
	</script>
</body>
</html>