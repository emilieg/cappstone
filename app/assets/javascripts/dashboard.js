// $(document).ready(function() {

//     // page is now ready, initialize the calendar...

//     $('#calendar').fullCalendar({
//         // put your options and callbacks here
//     })

// });


$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyCGSVbTQQsnkYvE0OzEOVk-fxsc3HX7aKQ',
        events: {
            googleCalendarId: 'emilie.gerber.harris@gmail.com',
            // className: 'gcal-event' // an option!
        },
        
    });
});