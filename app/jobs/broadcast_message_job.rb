class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(stream_room, data)
    Rails.logger.info "BroadcastMessageJob: with stream_room = #{stream_room} && data = #{data}"

    ActionCable.server.broadcast(stream_room, data)
  end
end
