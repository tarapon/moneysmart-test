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
    url = Url.new(full_url: nil)
    url.validate
    assert_equal(url.errors.messages, full_url: ["is not a valid URL"])
  end

  test 'requires valid url format' do
    url = Url.new(full_url: 'not-a-url')
    url.validate
    assert_equal(url.errors.messages, full_url: ["is not a valid URL"])
  end

  test 'allow http urls' do
    url = Url.new(full_url: 'http://example.com')
    assert(url.validate)
  end

  test 'allow https urls' do
    url = Url.new(full_url: 'https://example.com')
    assert(url.validate)
  end
end
