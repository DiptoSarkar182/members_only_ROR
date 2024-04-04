class SecretChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'secret'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def receive(data)
    data['user'] = current_user
    ActionCable.server.broadcast('secret', data)
  end
end
