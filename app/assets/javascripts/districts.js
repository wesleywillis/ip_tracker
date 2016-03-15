
setInterval(function(){
  $.get("/api/districts/1/shifts", function(data) {
    console.log(data)
    $(".js-bad-shifts").html(data.count)
  });

}, 1000)
