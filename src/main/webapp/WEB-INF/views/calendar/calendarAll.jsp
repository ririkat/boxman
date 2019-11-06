<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="일정 등록" name="tabTitle" />
</jsp:include>
<section>
     <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="schTitle" id="schTitle"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="date" name="startDate" id="startDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="date" name="endDate" id="endDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">유형</label>
                                <select name="schCateName" id="schCateName">
                                    <option value="0">카테고리를 선택해주세요.</option>
                                <c:forEach var = "cate" items = "${list }">
									<option value = "${cate['SCHCATENAME'] }">${cate['SCHCATENAME'] }</option>
								</c:forEach>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">범위</label>
                                <select name="schLevel" id="schLevel">
                                    <option value="개인">개인</option>
                                    <option value="부서">부서</option>
                                    <option value="회사">회사</option>                                                                        
                                </select>
                            </div>
                        </div>
                        <br>
                        <input type = "hidden" id = "empNo" value = "${loginEmp['EMPNO'] }"/>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <input type = "hidden" id = "empNo" value = "${loginEmp['EMPNO'] }"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title"></h3>
            </div>

      
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
</section>
    <script src="${path }/resources/full/vendor/js/jquery.min.js"></script>
    <script src="${path }/resources/full/vendor/js/bootstrap.min.js"></script>
    <script src="${path }/resources/full/vendor/js/moment.min.js"></script>
    <script src="${path }/resources/full/vendor/js/fullcalendar.min.js"></script>
    <script src="${path }/resources/full/vendor/js/ko.js"></script>
    <script src="${path }/resources/full/vendor/js/select2.min.js"></script>
    <script src="${path }/resources/full/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${path }/resources/full/js/main.js"></script>
    <script src="${path }/resources/full/js/addEvent.js"></script>
    <script src="${path }/resources/full/js/editEvent.js"></script>
    <script src="${path }/resources/full/js/etcSetting.js"></script>
    
    <script>
    var arr = [];
    var empNo = $('#empNo').val();
    
    $(function(){
           $.ajax({
              contentType:'application/json',
              dataType:'json',
              url : "${path}/calendar/selectCalendarEmpNo.do?empNo="+ empNo,
              type : "post",
              async: false,
              success:function(data){
					
					 console.log(data);
					 arr = data;
				},
				
		      error:function(){
		            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
		        }
			});
           
           return arr;
	});
    </script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />