class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました。"
      redirect_to "/microposts/index"
    else
      render "microposts/index"
    end
  end

  def destroy
  end

  def index
    if logged_in?
      @search_params = micropost_search_params
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
      @feed_items = User.search(@search_params).paginate(page: params[:page])
    end
  end


  private
    def micropost_params
      params.require(:micropost).permit(:content, :category, :area)
    end

    def micropost_search_params
      params.fetch(:search, {}).permit(:category, :area)
    end
end
