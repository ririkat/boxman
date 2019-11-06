<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="BoxMan" name="tabTitle"/> 
   <jsp:param value="일정관리" name="pageTitle"/>
</jsp:include>
<section>
<div class="p-5">
  <h2 class="mb-4">일정관리</h2>
  <div class="card">
                <div style="float:left;">
                      <a href="${path}/calendar/insertCalendar.do" class="btn btn-light btn-icon-split">
                    <span class="icon text-gray-600">
                      <i class="fas fa-arrow-right"></i>
                    </span>
                    <span class="text">일정 등록</span>
                  </a>
                 </div>
    <div class="card-body p-0">
      <div id="calendar"></div>
    </div>
  </div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
