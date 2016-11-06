$(document).on("turbolinks:load", function() {
  messages = $(".messages");
  roomId = messages.data('room-id');
  console.log("roomId", roomId);
  setupRoomSubscription(roomId);
})

function setupRoomSubscription(roomId) {
  App.messages = App.cable.subscriptions.create({channel: "MessagesChannel", room: roomId}, {
    connected: function() {
      console.log("connected")
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      console.log("disconnected")
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      console.log("received ", data)
      if (data.action == "create") {
        $(".messages").append(data.messageHtml)
      }
      // Called when there's incoming data on the websocket for this channel
    },

    create: function(messageText) {
      console.log("creating ", messageText);
      this.perform("create", {message: messageText});
    }
  });
}
