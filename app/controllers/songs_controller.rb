require 'third_party_api' 

class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    byebug
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def play
    # @song = Song.find(params[:id])
    # puts @song
    # byebug
    api = ThirdPartyApi.new('BQCrNzVYMxsutkoLZwb2Ah6oFzn6HQ6eIXWTXKRN3GSyA_ScVIqXXbx6rhXtwIJV4EAaZ68j3kA369Pcqnsy5VX4Z6C2AEuDfj8olAO8lHTp7dUh1BKCSbBR00Q4JMbGPMRm1_w3-aAKy8YvHsTTwcOGTwkscrTNjcsvhC9Vxdiht0SYdaVTYqY6IvD6ofxcZdUrmGRUjYEf7vaMK46-')
    data = {uris:['spotify:track:0Xth5s6Vpxz3ZZO3rYYolB']}
    # byebug
    response = api.put_data(data)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :description, :author, :playlist_id)
    end
end
