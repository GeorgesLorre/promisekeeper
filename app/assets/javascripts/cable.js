// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);
function testhitout(){
 $(document).ready(function() {
  $('#promise_temp_witnesses').select2({
    theme: "bootstrap"
  });

  $('.datepicker').pickadate();
  $('#promise_temp_witnesses').on('change', function (e) {
    console.log(e);
    var arr = $('#promise_temp_witnesses').select2('data');
    if(arr.length === 0) {
      $('#submit-glyph').hide();
    }
    else {
      $('#submit-glyph').show();
    }

});
});
}
testhitout();


