require 'test_helper'

class VisitorsControllerTest < ActionDispatch::IntegrationTest
  test "should render visitors page" do
    url = Url.create!(full_url: 'http://example.com')
    get visitor_path(id: url.code)
    assert_response :success
  end
end
