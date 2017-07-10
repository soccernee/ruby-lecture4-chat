App.appearance = App.cable.subscriptions.create("AppearanceChannel", {
  connected: function() {
    // console.log("appearance: connected");
    this.install()
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // console.log("appearance: disconnected");
    // Called when the subscription has been terminated by the server
    // console.log("perform disappear");
    this.perform("disappear");
  },

  received: function(data) {
    // console.log("appearance: received", data);
    $(".online-users").html(data);
    // Called when there's incoming data on the websocket for this channel
  },

  appear: function() {
    // console.log("perform appear");
    this.perform("appear");
  },

  disappear: function() {
    // console.log("perform disappear");
    this.perform("disappear");
  },

  install: function() {
    that = this;
    // console.log("install: announcing apperance");
    that.appear();

    // for future page loads
    $(document).on("turbolinks:load", function() {
      that.appear();
    })
  }
});
