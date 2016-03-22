require 'discordrb'
 
shell = Discordrb::Bot.new ENV["DISCORD_EMAIL"].to_str, ENV["DISCORD_PASS"].to_str
 
#bot = Discordrb::Commands::CommandBot.new  ENV["DISCORD_EMAIL"].to_str, ENV["DISCORD_PASS"].to_str
 
start_time = Time.now
 
shell.message(with_text: "Ping!") do |event|
  event.respond "Pong!"
end
 
def uptime(start_time)
  Time.now - start_time
end
 
def run_py(scriptname, parameters)
    exec_str = 'python ' + 'py/'+scriptname + ' ' + parameters
    shell_return = %x(#{exec_str})
    return shell_return
end
 
shell.message(with_text: "!uptime") do |event|
  event.respond "I have been running for #{uptime(start_time)}."
end
 
shell.message(with_text: "!btc") do |event|
  event.respond "Current Bitcoin Price: #{run_py('btc.py', '')}."
end
 
#bot.command :up do |_event, ip
#  event.respond "#{run_py('ip.py', ip)}."
#end
 
shell.run
#bot.run