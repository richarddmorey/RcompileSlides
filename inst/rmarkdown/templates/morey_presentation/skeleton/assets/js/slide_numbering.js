
$( document ).ready(function() {
    var n_slides = $("slide").length - 1;
    var n_no_include = $(".nopagenumberincrement").length;
    $("slide").attr("data-total-slides", n_slides - n_no_include);
    var i = 0;
    $("slide").each(function(index){
      var no_include = $( this ).children(".nopagenumberincrement").length;
      i = i + !no_include;
      $( this ).attr("data-slide-num", i);
    });
});

