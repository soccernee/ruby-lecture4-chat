$(document).on("turbolinks:load", function() {
  $("#message-body").on('keyup', function(event) {
    console.log("message changed", event);
    if (event.keyCode == 13) {
      var data = {body: $(this).val(), username: "guest"};
      console.log("submitting....", data);
      App.messages.createMessage(data);
      $(this).val('');
    }
  });

  $(".js-delete-message").on('click', function(event) {
    var messageId = $(this).data('message-id');
    console.log("deleting message id", messageId);
    App.messages.deleteMessage(messageId)
  });

  $(".js-set-up-room").each(function(index){
    var roomId = $(this).data('room-id');
    console.log("set up for roomId", roomId);
    window.setupRoomMessages(roomId);
  })
})
