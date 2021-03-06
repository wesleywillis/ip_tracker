// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
  // $(document).ready(function(){
  function dismissAlerts(){
    $('.shift-dismiss-button').click( function(){
      console.log("inside SHIFT click");
      var shift_id = $($(this).parents("tr")[0]).children(".grab_shift_id").html();
      var self = $(this);
      $.ajax({
        type: "PATCH",
        url: "shift_alerts",
        data: {shift_id: shift_id}
      }).done(function() {
        self.closest('tr').fadeOut();
      }).fail(function(){
      });
    });
    $('.customer_dismiss_icon').click( function(){
      console.log("inside CLIENT click");
      var client_id = $($(this).parents("tr")[0]).children(".grab_client_id").html();
      var self = $(this);
      $.ajax({
        type: "PATCH",
        url: "dormant",
        data: {client_id: client_id}
      }).done(function() {
        self.closest('tr').fadeOut();
      }).fail(function(){
      });
    });
  }

  jQuery(document).on("ready page:change", function() { dismissAlerts(); });
