
setInterval(function(){
  $.get("/api/districts/1/shifts", function(data) {
    console.log(data);
    $(".js-bad-shifts").html(data.count);
  });

}, 1000);

setInterval(function(){
  $.get("/api/districts/1/dormant", function(data) {
    console.log(data);
    $(".js-dormant-cases").html(data.count);
  });

}, 1000);

$('span').click( function(){
    $(this).toggleClass('glyphicon-remove-circle').toggleClass('glyphicon-ok-circle');
});
