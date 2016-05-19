// $(document).ready(function(){
//     $('#try-this-div').sectionScroll();
//     $('.modal-trigger').leanModal();
//     $('.modal-trigger2').leanModal();
//   });

$(document).ready(function(){
  $.ajax({
    url: 'dashboard/deck/:id',
      method: 'PUT',
    data: {
      Job.update(
        {
          name: "Position",
        }
      )

    },
    success function(data) {

    },
    error: function(){

      }
    }
  })
}



