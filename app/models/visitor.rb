class Visitor < ApplicationRecord
  def self.from(req)
    Visitor.new(
        ip: req.remote_ip,
        user_agent: req.headers['User-Agent'],
        referer: req.headers['Referer']
    )
  end
end
