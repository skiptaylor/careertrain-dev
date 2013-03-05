require 'minitest/autorun'
require 'rack/test'
require './app'

class ReportTests < MiniTest::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

	# def test_made_by
	# 	report = Report.new
	# 	assert_equal report.made_by, 'Acme Corp.'
	# end
end
