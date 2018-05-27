require 'test_helper'

class UrlTest < ActiveSupport::TestCase

  test"returns shorten url code" do
    url = Url.new(id: '37334772')
    assert_equal(url.code, 'm87p0')
  end

  test "returns empty code" do
    url = Url.new
    assert_nil(url.code)
  end

  test 'requires presence of full_url' do
    url = Url.new(full_url = nil)
    url.validate
    assert_equal(url.errors.messages, full_url: ["can't be blank"])
  end
end
