require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get urls_path
    assert_response :success
  end

  test "should create new url" do
    post urls_path, params: { url: { full_url: 'http://example.com' } }
    assert_response :success
  end

  test "should redirect to known url" do
    url = Url.create!(full_url: 'http://example.com')
    get url_path(id: url.code)
    assert_response :redirect
  end

  test "should return 404 for unknown url" do
    get url_path(id: 'random')
    assert_response :missing
  end

  test 'collects visitor data' do
    Visitor.delete_all
    url = Url.create!(full_url: 'http://example.com')
    get url_path(id: url.code)
    assert_equal(1, Visitor.count)
  end
end
