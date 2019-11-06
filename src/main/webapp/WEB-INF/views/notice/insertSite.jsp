<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
<section id="content">

<div class="card">

                      <div class="card-body">
                        <h4 class="card-title">사이트등록</h4>
                        <p class="card-description"></p>
                        <form id="site" class="forms-sample">
                          <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">사이트형식</label>
                            <div class="col-sm-4">
                              <div class="form-radio">
                                <label class="form-check-label">
                                  <input type="radio" class="form-check-input" name="stCheck" id="membershipRadios1" value="내부" checked=""> 내부 <i class="input-helper"></i></label>
                              </div>
                            </div>
                            <div class="col-sm-5">
                              <div class="form-radio">
                                <label class="form-check-label">
                                  <input type="radio" class="form-check-input" name="stCheck" id="membershipRadios2" value="외부"> 외부 <i class="input-helper"></i></label>
                              </div>
                            </div>
                          </div>
                        </div>
                          <div class="form-group">
                            <label class="col-sm-3 col-form-label" for="exampleInputEmail1">사이트이름</label>
                            <input type="text" class="form-control" name="stName" id="exampleInputEmail1" placeholder="">
                          </div>                      
                          <div class="form-group">
                            <label class="col-sm-3 col-form-label" for="exampleInputPassword1">링크</label>
                            <input type="text" class="form-control" name="stLink" id="exampleInputPassword1" placeholder="">
                          </div>
                          <div style="margin:0 auto; width:fit-content;">
                           
                          <button type="button" class="btn btn-success mr-2" onclick="insertNotice();">등록</button>
                          <button class="btn btn-light">Cancel</button>
                        </div>
                        </form>
                      </div>
                    </div>

</section>
<script>
		function insertNotice(){
			$("#site").attr("action","${path }/notice/insertSiteEnd.do");
			$("#site").submit();
		}
</script>

