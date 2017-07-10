// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $('#message-body').on('keyup', function(event) {
    if (event.keyCode == 13) {
      const data = { body: $(this).val(), username: 'guest' };
      App.messages.createMessage(data);
      console.log("submitting message ", data);
      $(this).val('');
    }
  });
});