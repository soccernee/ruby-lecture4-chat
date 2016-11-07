// window.updateMessagesViaJSON = function() {
//   $.getJSON(window.location.pathname + ".json", function(messages) {
//     e = $('.messages')
//     e.html('')
//     for (i in messages) {
//       message = messages[i]
//       e.append("<div class='message'><strong>" + message.username + "</strong> " + message.content + "</div>")
//     }
//   })
// }
//
// window.updateMessagesViaJS = function() {
//   $.ajax({ url: window.location.pathname, dataType: 'script' });
// }

function bindEnterToSubmit() {
  $("input#content").on("keyup", function(event) {
    console.log("event ", event);
    key = event.which;
    if (key == 13) {
      // press Enter should submit the content
      // note we exact roomId from the data attribute
      content = $(this).val();
      roomId = $(this).data("room");
      messageData = {"content": content, "room": roomId};
      console.log("Submitting messageData", messageData);
      App.messages.create(messageData);
      $(this).val('');
    }
  })
}
$(document).on("turbolinks:load", bindEnterToSubmit)
