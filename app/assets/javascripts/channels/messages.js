App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
    console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    console.log("disconnected");
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log("received", data);
    if (data.method == "append") {
      $(".messages").append(data.html);
    }
    // Called when there's incoming data on the websocket for this channel
  },

  create: function(messageData) {
    console.log("create ", messageData);
    this.perform("create", messageData);
  }
});
