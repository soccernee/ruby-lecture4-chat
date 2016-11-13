setupAppearance();

function setupAppearance() {
  App.appearance = App.cable.subscriptions.create("AppearanceChannel", {
    connected: function() {
      this.install()
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      // console.log("appearance received ", data)
      if (data.method == "appearance") {
        $(".online_users").html(data.html);
      }
    },

    install: function() {
      console.log("install");
      that = this;
      $(document).on("turbolinks:load", function(){
        that.perform("appear", {appearing_on: $(".main").data("appearing-on")})
      });
      that.perform("appear", {appearing_on: $(".main").data("appearing-on")})
    }
  });
};
