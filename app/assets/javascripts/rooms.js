// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $('#message-body').on('keyup', function(event) {
    if (event.keyCode == 13) {
      const data = { body: $(this).val()};
      App.messages.createMessage(data);
      console.log("submitting message ", data);
      $(this).val('');
    }
  });

  $('.js-delete-message').on('click', function(event) {
    const messageId = $(this).data('message-id');
    console.log("deleting message with id = ", messageId);
    App.messages.deleteMessage(messageId);
  });

  $('.js-set-up-room').each(function(index) {
    const roomId = $(this).data('room-id');
    console.log("setting up room id = ", roomId);
    window.setupRoomMessages(roomId);
  });

});