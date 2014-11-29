Lita.configure do |config|
  # When possible, everything is an environment variable.
  # This makes it a bit easier to distribute but makes it a bit harder to deploy.
  # You can replace any of these variables with your settings WITHOUT having to 
  # set env vars. See the Lita docs for more info on how to do this.

  # Lita Settings
  config.robot.name = ENV["LITA_ROBOT_NAME"]
  config.robot.adapter = :irc
  config.robot.locale = :en
  config.robot.log_level = :info
  config.redis[:url] = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]

  #IRC Settings
  config.adapters.irc.server = ENV["LITA_IRC_SERVER"]
  config.adapters.irc.channels = ENV["LITA_IRC_CHANNELS"]
  config.adapters.irc.user = ENV["LITA_IRC_USER"]
  config.adapters.irc.realname = ENV["LITA_IRC_REALNAME"]
  config.adapters.irc.password = ENV["LITA_IRC_PASSWORD"]
  config.adapters.irc.cinch = lambda do |cinch_config|
    cinch_config.max_reconnect_delay = 123
  end

  # GitHub Settings
  config.handlers.github_commits.repos = { ENV["LITA_GITHUB_REPOSITORIES"] }

  # Nagios Settings
  config.handlers.nagios.default_room = ENV["LITA_NAGIOS_ROOM"]
  config.handlers.nagios.cgi = ENV["LITA_NAGIOS_CGI"]
  config.handlers.nagios.user = ENV["LITA_NAGIOS_USER"]
  config.handlers.nagios.pass = ENV["LITA_NAGIOS_PASSWORD"]
  config.handlers.nagios.version = 3
  config.handlers.nagios.time_format = "iso8601"
  config.handlers.nagios.verify_ssl = false

end