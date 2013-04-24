require 'cinch'
require 'active_support/inflector'

modules = []

Dir.foreach('./lib/modules') do |mod| 
  if (mod =~ /.rb$/)
    load "./lib/modules/#{mod}" 
    p mod.gsub('.rb','')
    modules << mod.gsub('.rb','').camelize.constantize
  end
end

bot = Cinch::Bot.new do
  configure do |c|

    c.server = "irc.iiens.net"
    c.channels = ["#git-tutal"]
    c.nick   = File.read("./NAME")
    c.plugins.plugins = modules 
    
  end
  
end

bot.on :connect do

  modules.each do |mod|

    User("GitMaster").send("!#{mod.name.downcase}")

  end

end

bot.start

