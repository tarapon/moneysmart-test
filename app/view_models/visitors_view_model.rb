class VisitorsViewModel
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def top_referers
    @url.visitors
        .select('referer, count(id) as count')
        .group('referer')
        .order('count desc')
        .limit(10)
        .to_a
  end

  def top_browsers
    @url.visitors
        .select('browser_name, count(id) as count')
        .group('browser_name')
        .order('count desc')
        .limit(10)
        .to_a
  end
end
