module ApiHelper
  include Rack::Test::Methods 
  def app <co id="ch13_458_2"/>
    Rails.application
  end
end
RSpec.configure do |c|
  c.include ApiHelper, :type => :api
end
