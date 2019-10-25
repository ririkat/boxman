<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<section>
	<div>
		<c:if test="${result>0 }">
			<c:if test="${conCateg eq '유통'}">
				같은 상호명의 유통거래처가 존재합니다.<br/>
				다시 입력해주세요.
			</c:if>
			<c:if test="${(conCateg eq '매입') or (conCateg eq '매출')}">
				동일한 이름의 거래처가 존재합니다.<br/>
				다시 입력해주세요.
			</c:if>
			<br><br>
			<button type="button" onclick="remove();">확인</button>
		</c:if>
		
		<c:if test="${result==0}">
			새로 등록 가능한 ${conCateg}거래처 입니다.
			<br><br>
			<button type="button" onclick="setting();">확인</button>
		</c:if>
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



