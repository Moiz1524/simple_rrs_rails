App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    alert('ok');
    console.log("Connected to Action Cable Server.")
  },
  disconnected: function() {
    console.log("Disconnected from Action Cable Server.")
  },
  received: function(data) {
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
  }
});