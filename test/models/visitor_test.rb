require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  test 'initialize from request' do
    request = OpenStruct.new(remote_ip: '192.168.1.1', headers: {
        'Referer' => 'http://example.com',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4)'
    })

    visitor = Visitor.from(request)
    assert_equal(visitor.ip, '192.168.1.1')
    assert_equal(visitor.referer, 'http://example.com')
    assert_equal(visitor.user_agent, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4)')
  end

  test 'should parse user agent' do
    request = OpenStruct.new(headers: {
        'User-Agent' => 'Mozilla/5.0 Chrome/66.0.3359.181 Safari/537.36'
    })

    visitor = Visitor.from(request)
    visitor.save!

    assert_equal(visitor.browser_name, 'Chrome')
    assert_equal(visitor.browser_version, '66.0.3359.181')
  end
end
