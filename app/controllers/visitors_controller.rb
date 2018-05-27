class VisitorsController < ApplicationController
  def show
    @visitors = VisitorsViewModel.new(Url.find_by_code(params[:id]))
  end
end
