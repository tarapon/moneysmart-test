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
end
