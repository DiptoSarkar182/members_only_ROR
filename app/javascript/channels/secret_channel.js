import consumer from "channels/consumer"

const secretChannel = consumer.subscriptions.create("SecretChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const secretDisplay = document.querySelector('#secret-display')
    secretDisplay.insertAdjacentHTML('afterbegin', this.template(data))
  },


  template(data) {
      const date = new Date(data.created_at.replace(/Z|(\+\d{2}:\d{2})$/g, ''));
      const day = String(date.getDate()).padStart(2, '0');
      const month = date.toLocaleString('en-US', { month: 'short' });
      const year = date.getFullYear();
      const hour = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
      const minute = String(date.getMinutes()).padStart(2, '0');
      const ampm = date.getHours() >= 12 ? 'PM' : 'AM';
      const formattedDate = `${month} ${day}, ${year}, ${hour}:${minute} ${ampm}`;

      const userSignedIn = document.querySelector('#secret-display').getAttribute('data-user-signed-in') === 'true';

    return `
    <div class="secret bg-white rounded-lg shadow-md p-6">
      <h3 class="text-xl font-semibold text-gray-800 mb-2">
        ${data.title}
      </h3>
      <p class="secret-username text-gray-600 mb-2">
        ${userSignedIn ? `Posted by, ${data.user.username}` : '****'}
      </p>
      <p class="text-gray-500 mb-4">
        ${formattedDate}
      </p>
      <p class="text-gray-700">
        ${data.body}
      </p>
    </div>
  `
  }
});
