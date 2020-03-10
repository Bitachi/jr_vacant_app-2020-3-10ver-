class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_or_your_post?, only: :destroy

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
    store_location
    Micropost.find_by(id: params[:id]).destroy
    redirect_back_or(microposts_index_path)
  end

  def index
    if logged_in?
      @search_params = micropost_search_params
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
      @feed_items = User.search(@search_params).paginate(page: params[:page])
    end
  end

  def admin_or_your_post?
    redirect_to root_url unless((Micropost.find(params[:id]).user_id == current_user.id) || (current_user.admin))
  end


  private
    def micropost_params
      params.require(:micropost).permit(:content, :category, :area)
    end

    def micropost_search_params
      params.fetch(:search, {area:"JR北海道",category:"遅延情報"}).permit(:category, :area)
    end
end
