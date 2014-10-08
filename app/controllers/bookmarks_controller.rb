class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all
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
    @scrape = MetaInspector.new(params[:bookmark][:website])
    @bookmark.name = @scrape.title
    @bookmark.website = @scrape.url
    @bookmark.info = @scrape.description
    if @scrape.image
      @bookmark.picture = @scrape.image
    elsif @scrape.favicon
      @bookmark.picture = @scrape.favicon
    elsif @scrape.images[1]
      @bookmark.picture = @scrape.images[1]
    end
    current_user.bookmarks << @bookmark

     if @bookmark.save
        redirect_to root_url, notice: "Bookmark Added"
      else
        render :index, notice: "Invalid Website"
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
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
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
