class ArtistsController < ApplicationController
  # before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
    @who = current_artist
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])    
    # pry
  end

  def commission_page
    @artist = Artist.find(params[:id])    

  end

  def messages
    @messages = Message.where(artist: current_artist)
  end

  def commission_artist
    # pry
    @artist = Artist.find(params[:id])  

    # need to put checks in here for each of these, and then send them in the ArtistMailer method
    if request.post?
      if current_artist
        @curr_user = current_artist
      elsif current_user
        @curr_user = current_user
      end
      pry
      @comment=request.POST['commission-comment']
      @due_date=request.POST['commission-due-date']
      @price=request.POST['commission-price']
      puts @comment
      puts @due_date
      puts @price
      new_message = Message.new(comment: @comment, due_date: @due_date, price: @price, artist: @artist, user: @curr_user)
      new_message.save
      #ArtistMailer.commission_notify_email(@artist, @comment, @due_date, @price).deliver!
      # pry
      redirect_to root_path
    else
      puts "whatttt"
    end

  end


  # GET /artists/new
  def new
    @artist = artist.new
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])  
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
        ArtistMailer.welcome_email(@artist).deliver_later  
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    @artist = Artist.find(params[:id])
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:email, :first_name, :last_name, :url, :city, :artist_type, :description, :image, artworks: [], messages: [])
    end
end
