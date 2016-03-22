require 'discordrb'
 
class Shell < Discordrb::Commands::CommandBot
  def initialize(email, password, prefix, attributes = {}, debug = false)
    super(email, password, prefix, attributes = {}, debug = false)
    @start_time = Time.now
  end
end

module AnnouncerEvents
  extend Discordrb::EventContainer

  message(with_text: "hi shell!") do |event|
    event.respond "Hi, #{event.user.name}!"
  end

  member_join do |event|
    event.server.general_channel.send_message "#{event.user.name} joined!"
  end

  message(with_text: "!btc") do |event|
    event.respond "Current Bitcoin Price: #{run_py('btc.py', '')}."
  end
end

module UtilityCommands
  extend Discordrb::Commands::CommandContainer

  command :my_id do |event|
    event.user.id
  end

  command :uptime do |event|
    "I have been running for #{uptime(@start_time)}."
  end
end

shell = Shell.new(ENV["DISCORD_EMAIL"].to_str, ENV["DISCORD_PASS"].to_str, '!')
shell.include! AnnouncerEvents
shell.include! UtilityCommands
#bot = Discordrb::Commands::CommandBot.new  ENV["DISCORD_EMAIL"].to_str, ENV["DISCORD_PASS"].to_str

def uptime(start_time)
  Time.now - start_time
end
 
def run_py(scriptname, parameters)
    exec_str = 'python ' + 'py/'+scriptname + ' ' + parameters
    shell_return = %x(#{exec_str})
    return shell_return
end
 
 
 
#bot.command :up do |_event, ip
#  event.respond "#{run_py('ip.py', ip)}."
#end
 
shell.run

