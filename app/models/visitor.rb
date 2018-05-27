class Visitor < ApplicationRecord
  before_save :parse_user_agent

  def self.from(req)
    Visitor.new(
        ip: req.remote_ip,
        user_agent: req.headers['User-Agent'],
        referer: req.headers['Referer']
    )
  end

  private

  def parse_user_agent
    data = UserAgent.parse(user_agent)
    self.browser_name = data.browser
    self.browser_version = data.version
  rescue
  end
end
