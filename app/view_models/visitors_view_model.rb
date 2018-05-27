class VisitorsViewModel
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
end
