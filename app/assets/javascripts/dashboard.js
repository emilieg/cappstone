// $(document).ready(function() {

//     // page is now ready, initialize the calendar...

//     $('#calendar').fullCalendar({
//         // put your options and callbacks here
//     })

// });


$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: '<YOUR API KEY>',
        events: {
            googleCalendarId: 'abcd1234@group.calendar.google.com',
            className: 'gcal-event' // an option!
        },
        
    });
});