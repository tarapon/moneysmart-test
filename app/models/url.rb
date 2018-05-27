BASE = 36

class Url < ApplicationRecord
  validates_presence_of :full_url

  def code
    id.to_s(BASE) if id?
  end

  def self.find_by_code(code)
    self.find(code.to_i(BASE))
  end

  def to_param
    code
  end
end
