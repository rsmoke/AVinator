class CrestronController < ApplicationController
  require 'redis'

  def index
    redis = Redis.new(host: "localhost")
    @room = redis.get("LSARoom")
    Rails.logger.debug "************************ room #{@room}"
    Rails.logger.debug "************************ room.class #{@room.class}"

    @room_hash = JSON.parse(@room)
    Rails.logger.debug "************************ room_hash #{@room_hash}"

    @room1 = @room_hash['LSARoom']
    Rails.logger.debug "************************ room1 #{@room1}"

  end
end
