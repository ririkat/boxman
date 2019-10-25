<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
	<style>
form {
	background: none;
}

form:active {
	background: rgb(240, 240, 240);
}
</style>
<section id="content">

<div></div>
<br/><br/><br/>
	<c:forEach items="${list }" var="list">
	<div id="chat-container" class="container-fluid ">
		<a href="">
			<div class="d-flex mt-3 py-2 border-bottom">
			<i class="fas fa-comments" style="font-size: xx-large;"></i>
				<div class="wrapper ml-2">
					<p class="mb-n1 font-weight-semibold">제목 : ${list['CHATTEXT'] }</p>
					<small>${loginEmp['EMPPHONE'] }</small>
				</div>
				<small class="text-muted ml-auto"></small>
			</div>
		</a>
	</div>
	</c:forEach>
${pageBar }
</section>

<script>

</script>

