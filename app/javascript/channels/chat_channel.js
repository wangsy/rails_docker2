import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("chat2 channel connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("chat2 channel disconnected")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    document.body.insertAdjacentHTML("beforeend", "<p>New blog posted.</p>")
  }
});
