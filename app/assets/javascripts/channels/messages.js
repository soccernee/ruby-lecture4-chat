App.messages = App.cable.subscriptions.create("MessagesChannel", {
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

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("MessagesChannel :: received data ", data);

    $('.messages').prepend(data.message.rendered);
  }
});
