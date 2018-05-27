class UrlsController < ApplicationController
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
    if @url
      redirect_to @url.full_url
    else
      render nothing: true, status: 404
    end
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
