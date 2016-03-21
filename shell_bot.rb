require 'discordrb'

shell = Discordrb::Bot.new ENV["DISCORD_EMAIL"].to_str, ENV["DISCORD_PASS"].to_str
start_time = Time.now

shell.message(with_text: "Ping!") do |event|
  event.respond "Pong!"
end

def uptime(start_time)
  Time.now - start_time
end

shell.message(with_text: "!uptime") do |event|
  event.respond "I have been running for #{uptime(start_time)}."
end

shell.run

