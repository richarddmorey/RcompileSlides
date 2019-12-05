
$(document).ready(function() {
  
  $('.previoustitle')
    .siblings('hgroup')
    .children('h2')
    .each(function(){
      var current_text = $( this ).html();
      previous_title = $( this )
        .parents('slide')
        .prev('slide')
        .find('h2')
        .html();
      $( this ).html( previous_title );
    });

});

