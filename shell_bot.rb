require 'discordrb'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
# require_relative '/ruby_modules/announcer_events'
 
class Shell < Discordrb::Commands::CommandBot
  # This is doing absolutely nothing
  def initialize(email, password, prefix, attributes = {}, debug = false)
    super(email, password, prefix, attributes = {}, debug = false)
  end
end

shell = Shell.new(ENV["DISCORD_EMAIL"].to_str, ENV["DISCORD_PASS"].to_str, '!')
shell.include! AnnouncerEvents
shell.include! UtilityCommands

shell.run
 
#bot.command :up do |_event, ip
#  event.respond "#{run_py('ip.py', ip)}."
#end

