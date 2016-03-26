module UtilityCommands
  extend Discordrb::Commands::CommandContainer

  @start_time = Time.now

  def self.uptime(start_time)
    Time.now - start_time
  end

  command :my_id do |event|
    event.user.id
  end

  command :uptime do
    "I have been running for #{uptime(@start_time)}."
  end

  command :help do
    "!my_id, !uptime, !btc"
  end

  command :sum do |event, x, y|
    x.to_i + y.to_i
  end
end
