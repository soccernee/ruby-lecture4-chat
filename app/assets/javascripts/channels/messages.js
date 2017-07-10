window.setupRoomMessages = function(roomId) {
  App.messages = App.cable.subscriptions.create(
    { channel: "MessagesChannel", room_id: roomId} , {
    connected: function() {
      // Called when the subscription is ready for use on the server
      console.log("MessagesChannel :: connected! ");
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
      console.log("MessagesChannel :: disconnected! ");
    },

    createMessage: function(data) {
      this.perform('create_message', data);
    },

    deleteMessage: function(messageId) {
      this.perform('delete_message', {id: messageId})
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log("MessagesChannel :: received data ", data);

      if (data.message) {
        console.log("someone sent this message: ", data.message.body);
        $('.messages').prepend(data.message.rendered);
      }

      if (data.deletedId) {
        $('#message_' + data.deletedId).remove();
      }

    }
  });
}