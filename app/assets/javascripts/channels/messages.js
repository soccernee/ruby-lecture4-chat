window.setupRoomMessages = function(roomId) {
  App.messages = App.cable.subscriptions.create(
    {channel: "MessagesChannel", room_id: roomId}, {
    connected: function() {
      console.log("App.messages :: connected")
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      console.log("App.messages :: disconnected")
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      console.log("App.messages :: received", data)
      // Called when there's incoming data on the websocket for this channel
      if (data.html) {
        $(".messages").prepend(data.html);
      }

      if (data.deletedId) {
        $("#message_" + data.deletedId).remove();
      }
    },

    createMessage: function(data) {
      this.perform("create_message", data);
    },

    deleteMessage: function(messageId) {
      this.perform("delete_message", {id: messageId})
    }
  });
}
