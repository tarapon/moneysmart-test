class UrlsController < ApplicationController
  after_action :store_visitor, only: :show

  def index
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      render :create
    else
      render :index
    end
  end

  def show
    @url = Url.find_by_code(params[:id])
    redirect_to @url.full_url
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end

  def store_visitor
    @url.visitors << Visitor.from(request) unless @url.nil?
  end
end
