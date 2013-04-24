class Test
  include Cinch::Plugin

  match /test/,:method => :test1
  def test1(m)
    m.reply("ca marche!")
  end
end
