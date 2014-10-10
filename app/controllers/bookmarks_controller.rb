class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :create, :destroy]

  def index
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.search(params[:search]).page(params[:page]).per_page(20)
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def my_links
    @bookmark = Bookmark.new
    @bookmarks = current_user.bookmarks.search(params[:search]).page(params[:page]).per_page(20)
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def api_public_index
    @bookmarks = Bookmark.search(params[:search]).first(20)
    render json: @bookmarks
  end

  def api_private_index
    @user = User.find(params[:user])
    @bookmarks = @user.bookmarks.search(params[:search]).first(20)
    render json: @bookmarks
  end

  def show
  end

  def new
    @bookmark = current_user.bookmarks.build
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new
    @url = bookmark_params[:website]

    @bookmark.scrape_url(@url, current_user)

    if @bookmark.save
      redirect_to root_url, notice: 'Bookmark Added'
    else
      redirect_to root_url, alert: 'Invalid Website'
    end
  end

  def update
  end

  def destroy
    @bookmark.destroy
    redirect_to root_url, notice: 'Bookmark Removed.'
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:website)
  end
end
