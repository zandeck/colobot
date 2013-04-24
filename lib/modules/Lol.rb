require 'cinch'

class Lol
	include Cinch::Plugin

	match /lol/, :method => :lol
	def lol(m)
		m.reply("oki")
	end
end

