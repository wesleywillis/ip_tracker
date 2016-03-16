
setInterval(function(){
  $.get("/api/districts/1/shifts", function(data) {
    $(".js-bad-shifts").html(data.count);
  });

}, 1000);

setInterval(function(){
  $.get("/api/districts/1/dormant", function(data) {
    $(".js-dormant-cases").html(data.count);
  });

}, 1000);
