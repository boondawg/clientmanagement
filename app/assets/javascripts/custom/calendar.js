var Calendar = function () {


    return {
        //main function to initiate the module
        init: function () {
            Calendar.initCalendar();
        },

        initCalendar: function () {

            if (!jQuery().fullCalendar) {
                return;
            }

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var h = {};

            if (App.isRTL()) {
                 if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        right: 'title, prev, next',
                        center: '',
                        right: 'agendaDay, agendaWeek, month, today'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        right: 'title',
                        center: '',
                        left: 'agendaDay, agendaWeek, month, today, prev,next'
                    };
                }                
            } else {
                 if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        left: 'title, prev, next',
                        center: '',
                        right: 'today,month,agendaWeek,agendaDay'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        left: 'title',
                        center: '',
                        right: 'prev,next,today,month,agendaWeek,agendaDay'
                    };
                }
            }
           

            var initDrag = function (el) {
                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim(el.text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                el.data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                el.draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });
            }

            var addEvent = function (title) {
                title = title.length == 0 ? "Untitled Event" : title;
                var html = $('<div class="external-event label label-default">' + title + '</div>');
                jQuery('#event_box').append(html);
                initDrag(html);
            }

            $('#external-events div.external-event').each(function () {
                initDrag($(this))
            });

            $('#event_add').unbind('click').click(function () {
                var title = $('#event_title').val();
                addEvent(title);
            });

            //predefined events
            $('#event_box').html("");
            addEvent("My Event 1");
            addEvent("My Event 2");
            addEvent("My Event 3");
            addEvent("My Event 4");
            addEvent("My Event 5");
            addEvent("My Event 6");

            $('#calendar').fullCalendar('destroy'); // destroy the calendar
            $('#calendar').fullCalendar({ //re-initialize the calendar
                header: h,
                defaultView: 'agendaWeek',
                slotMinutes: 15,
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function (date, allDay) { // this function is called when something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');
                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;
                    copiedEventObject.className = $(this).attr("data-class");

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                events: '/consultations',
                eventClick: function(calEvent, jsEvent, view) {
                    $("#show-m").modal({
                        remote:calEvent.url });
                    return false;
                },

                eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
                    if (!isOverlapping(event))
                        updateEvent(event);
                    else
                        revertFunc();
                },
                eventResize: function(event, dayDelta, minuteDelta, revertFunc){
                    if (!isOverlapping(event))
                        updateEvent(event);
                    else
                        revertFunc();
                },

                dayClick: function(date, allDay, jsEvent, view) {
                    dayClicker(date, allDay, jsEvent, view);
                }
            });

        }

    };

}();

function dayClicker(date, allDay, jsEvent, view) {
    $("#basic").data('start_date_time', date)
    $("#basic").modal({
        remote:'/consultations/new'});

   /* if (allDay) {
        alert('Clicked on the entire day: ' + date);
    }else{
        alert('Clicked on the slot: ' + date);
    }

    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

    alert('Current view: ' + view.name);

    // change the day's background color just for fun
    $(this).css('background-color', 'red');*/

};

function updateEvent(the_consultation) {
    $.ajax({
        type: 'put',
        dataType: 'JSON',
        url: "/consultations/" + the_consultation.id,
        headers: {
            'X-Transaction': 'put',
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        data:
        {
            consultation: {
                start_date_time: "" + the_consultation.start,
                end_date_time: "" + the_consultation.end
            }
        },
        timeFormat: 'h:mm t{ - h:mm t} ',
        complete:  function (reponse) { }
    });
};

function isOverlapping(event){
    // "calendar" on line below should ref the element on which fc has been called
    var array = $('#calendar').fullCalendar('clientEvents');
    for(i in array){
        if ((event.end > array[i].start && event.start < array[i].end) && event != array[i]){
            return true;
        }
    }
    return false;
}