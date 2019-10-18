<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <style>
li > div {
    border: 1px solid #5a6f89;
    border-radius: 3px;
    overflow: hidden;
    list-style-type: none;
    text-decoration: none;
    
}

.b-related {
    display: block;
    float: left;
    padding: 7px 35px 7px 13px;
    width: 100%;
    background: #fff url(/_res/research/img/common/ico-link.png) no-repeat right 12px center;
    font-size: 16px;
    line-height: 21px;
    color: #5a6f89;
    font-weight: 400;
    box-sizing: border-box;
    text-decoration: none;
    
}

li {
    display: inline-block;
    position: relative;
    padding: 0 10px 10px 0;
    width: calc(25% - 11px);
    vertical-align: top;
}

*{
	text-decoration: none;
    list-style-type: none;
    margin: 0;
    padding: 0;
}

</style> -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
<section id="content">

<div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">관련사이트</h4>
                    <p class="card-description"> 내부/외부 사이트 <code>바로가기</code> </p>
                    <table class="table">
                      <thead>
                       <div class="col-sm-12 col-md-6">
		                  <div id="dataTable_filter" class="dataTables_filter">
		                     <div style="float:right;">
		                      <a href="${path}/notice/insertSite.do" class="btn btn-light btn-icon-split">
		                    <span class="icon text-gray-600">
		                      <i class="fas fa-arrow-right"></i>
		                    </span>
		                    <span class="text">사이트등록</span>
		                  </a>
		                 </div>
		                  </div>
		                 </div>
                        <tr>
                          <th>번호</th>
                          <th>업체명</th>
                          <th>링크</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Jacob</td>
                          <td>53275531</td>
                          <td>
                            <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="#"><span>사이트연결</span></a></label>
                          </td>
                        </tr>
                        <tr>
                          <td>Messsy</td>
                          <td>53275532</td>
                          <td>
                            <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="#"><span>사이트연결</span></a></label>
                          </td>
                        </tr>
                        
                        <tr>
                          <td>John</td>
                          <td>53275533</td>
                          <td>
                            <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="#"><span>사이트연결</span></a></label>
                          </td>
                        </tr>
                        <tr>
                          <td>Peter</td>
                          <td>53275534</td>
                          <td>
                            <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="#"><span>사이트연결</span></a></label>
                          </td>
                        </tr>
                        <tr>
                          <td>Dave</td>
                          <td>53275535</td>
                          <td>
                            <label class=""><a class="b-related btn btn-outline-success my-2 my-sm-0" href="#"><span>사이트연결</span></a></label>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
</section>

