require 'discordrb'
require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  database: 'Shell_Game',
  username: 'Shell_Postgres',
  password: ENV["POSTGRES_PASS"],
  host:     'localhost'
)

# Load in rb files from rby dir
# Command/event modules
Dir[File.dirname(__FILE__) + '/rby/*.rb'].each {|file| require file }
 
class Shell < Discordrb::Commands::CommandBot
  # This is doing absolutely nothing. Can add to init now though
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

