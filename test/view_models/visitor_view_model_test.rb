require 'test_helper'

class VisitorViewModelTest < ActiveSupport::TestCase
  setup do
    @url = Url.create!(full_url: 'http://example.com')
    @url.visitors = [
        Visitor.new(referer: 'http://google.com'),
        Visitor.new(referer: 'http://google.com'),
        Visitor.new(referer: 'http://twitter.com')
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
end
