<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
	<jsp:param value="BXMN" name="tabTitle"/> 
	<jsp:param value="대시보드" name="pageTitle"/>
</jsp:include>

<section>

	<!-- 내 메모 -->
	<div class="card shadow mb-4">
	  <div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">내 메모</h6>
	  </div>
	  <div class="card-body">
	  	<div id="saveNote-container">
	  		<span class = "save ok">This is note</span>
	  	</div>
	  	<script>
	  		/* $(function(){
	  			$.ajax({
	  				url: "${path}/note/noteSave.do",
	  				data: {""}
	  			})
	  		}); */
	  	</script>
	  
	    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce CSS bloat and poor page performance. Custom CSS classes are used to create custom components and custom utility classes.</p>
	    <p class="mb-0">Before working with this theme, you should become familiar with the Bootstrap framework, especially the utility classes.</p>
	    
	  </div>
	</div>



</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

