module AnnouncerEvents
  extend Discordrb::EventContainer

  def self.run_py(scriptname, parameters)
      exec_str = 'python ' + 'py/'+scriptname + ' ' + parameters
      shell_return = %x(#{exec_str})
      return shell_return
  end

  message(with_text: "hello shell") do |event|
    event.respond "hello #{event.user.name}"
  end

  message(with_text: "goodnite shell") do |event|
    event.respond "goodnite #{event.user.name}"
  end

  member_join do |event|
    event.server.general_channel.send_message "#{event.user.name} joined!"
  end

  message(with_text: "!btc") do |event|
    event.respond "Current Bitcoin Price: #{run_py('btc.py', '')}."
  end
end
