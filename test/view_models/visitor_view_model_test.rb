require 'test_helper'

class VisitorViewModelTest < ActiveSupport::TestCase
  setup do
    @url = Url.create!(full_url: 'http://example.com')
    @url.visitors = [
        Visitor.new(referer: 'http://google.com', user_agent: 'Chrome/66.0.3359.181 '),
        Visitor.new(referer: 'http://google.com', user_agent: 'Chrome/66.0.3359.181 '),
        Visitor.new(referer: 'http://twitter.com', user_agent: 'Safari/605.1.15')
    ]
  end

  test"should group visitors by referrer" do
    url = VisitorsViewModel.new(Url.last)
    assert_equal(2, url.top_referers.size)

    assert_equal('http://google.com', url.top_referers[0].referer)
    assert_equal(2, url.top_referers[0].count)

    assert_equal('http://twitter.com', url.top_referers[1].referer)
    assert_equal(1, url.top_referers[1].count)
  end

  test"should group visitors by browser name" do
    url = VisitorsViewModel.new(Url.last)
    assert_equal(2, url.top_browsers.size)

    assert_equal('Chrome', url.top_browsers[0].browser_name)
    assert_equal(2, url.top_referers[0].count)

    assert_equal('Safari', url.top_browsers[1].browser_name)
    assert_equal(1, url.top_referers[1].count)
  end
end
