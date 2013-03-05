require 'minitest/autorun'
require 'rack/test'
require './app'

class RrcTests < MiniTest::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

	# def test_made_by
	# 	rrc = Rrc.new
	# 	assert_equal rrc.made_by, 'Acme Corp.'
	# end
end
