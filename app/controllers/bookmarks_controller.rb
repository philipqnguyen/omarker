class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.search(params[:search])
  end

  def my_links
    @bookmark = Bookmark.new
    @bookmarks = current_user.bookmarks.search(params[:search])
  end

  def api_public_index
    @bookmarks = Bookmark.search(params[:search])
    render json: @bookmarks
  end

  def api_private_index
    @user = User.find(params[:user])
    @bookmarks = @user.bookmarks.search(params[:search])
    render json: @bookmarks
  end


  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = current_user.bookmarks.build
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new
    @url = params[:bookmark][:website]

    @bookmark.add_info(@url, current_user)

    if @bookmark.save
      redirect_to root_url, notice: "Bookmark Added"
    else
      redirect_to root_url, alert: "Invalid Website"
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    @bookmark = Bookmark.find(params[:id])
    @doc = Nokogiri::HTML(open(params[:bookmark][:website])) do |config|
      config.strict.nonet
    end
    @bookmark.name = @doc.css("head title").text
    @bookmark.info = @doc.css("body div").text
    @bookmark.website = params[:bookmark][:website]
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to root_url, notice: 'Bookmark Updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :index, notice: "Invalid Website" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark Removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params[:bookmark]
    end
  #     def project_params
  #   params.require(:project).permit(:title, :content)
  # end
end
