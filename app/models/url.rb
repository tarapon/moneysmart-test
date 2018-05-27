BASE = 36

class Url < ApplicationRecord
  validates :full_url, url: { allow_nil: false, allow_blank: false }
  has_many :visitors

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
