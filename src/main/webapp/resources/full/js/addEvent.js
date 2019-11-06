var eventModal = $('#eventModal');
var loginEmp = $('#empNo');
var modalTitle = $('.modal-title');
var editTitle = $('#schTitle');
var editStart = $('#startDate');
var editEnd = $('#endDate');
var editType1 = $('#schCateName');
var editType2 = $('#schLevel');
var editColor = $('#edit-color');



var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    editStart.val(start);
    editEnd.val(end);

    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');
        
    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

    	
    	console.log(editTitle.val());
    	console.log(loginEmp.val());
    	console.log(editStart.val());
    	console.log(editEnd.val());
    	console.log(editType1.val());
    	console.log(editType2.val());
    	console.log(editColor.val());
    	
    	
        var eventData = {
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            type: editType1.val(),
            type2: editType2.val(),
            username: loginEmp.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff'
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;
        
        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "insertCalendarEnd.do?",
            data: {
            	schTitle : eventData.title,
            	startDate : eventData.start,
            	endDate : eventData.end,
            	empName : eventData.username,
            	cateName : eventData.type,
            	schLevel : eventData.type2,
            	color : eventData.backgroundColor
            },
            success: function (response) {
            	console.log(response);
            	
            	if(response > 0) {
            		alert("일정 등록 완료");
            	} else {
            		alert("일정 등록 실패");
            	}
//                $('#calendar').fullCalendar('removeEvents');
//                $('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};