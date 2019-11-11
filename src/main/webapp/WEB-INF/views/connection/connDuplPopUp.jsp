<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
.pricing-box {
    border-radius: 4px;
    border: solid 1px #f1efef;
    background-color: #ffffff;
    padding: 47px;
    text-align: center;
    -webkit-transition: all 1s;
    -moz-transition: all 1s;
    -ms-transition: all 1s;
    -o-transition: all 1s;
    transition: all 1s;
}
img {
    vertical-align: middle;
    border-style: none;
}
.pricing-box .title-text {
    color: #000000;
}

.font-weight-medium {
    font-weight: 500;
}
h6, .h6 {
    font-size: 1.125rem;
}
.pricing-box .pricing-list {
    list-style: none;
    padding-left: 0;
    margin-bottom: 40px;
}
ol, ul, dl {
    margin-top: 0;
    margin-bottom: 1rem;
}
</style>

<section>
	<div class="pricing-box form-group">
		<img src="${path }/resources/sd/starter.svg" alt="starter">
		<h6 class="font-weight-medium title-text">거래처명 중복검사</h6>
		<ul class="pricing-list">
			<c:if test="${result>0 }">
				<li>같은 상호명의</li>
				<li>${conCateg}거래처가</li>
				<li>존재합니다.</li>
				<li>다시 입력해주세요.</li>
		        <br><br>
		        <button type="button" class="btn btn-outline-primary" onclick="remove();">확인</button>
			</c:if>
			
			<c:if test="${result==0}">
				<li>새로 등록 가능한</li>
				<li>${conCateg}거래처 입니다.</li>
		        <br><br>
		        <button type="button" class="btn btn-outline-primary" onclick="setting();">확인</button>
		    </c:if>
		</ul>
	</div>
</section>

<script>
function remove() {
   opener.document.getElementById("conName").value = "";
   opener.document.getElementById("conNameCheckResult").value = "N";
   self.close();
}
function setting() {
   opener.document.getElementById("conNameCheckResult").value = "Y";
   self.close();
}
</script>


