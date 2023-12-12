class PlaylistsController < ApplicationController

  # GET /playlists or /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1 or /playlists/1.json
  def show
    @playlist = Playlist.find(params[:id])
  @song = @playlist.songs.build
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    @playlist.songs.build
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    byebug
    respond_to do |format|
      if @playlist.save
        byebug
        if params[:playlist][:songs]
          params[:playlist][:songs].each do |song_params, index|
            puts index, song_params
            @playlist.songs.create(song_params)
          end
        end 
        format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully created." }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_song
    @playlist = Playlist.find(params[:id])
    @song = @playlist.songs.build(song_params)
    if @song.save
      redirect_to playlist_path(@playlist), notice: 'Canción agregada correctamente.'
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      byebug
      params.require(:playlist).permit(:title, :description, songs: [:title, :description, :author])
    end

    def song_params
      params.require(:song).permit(:title, :description, :author)
    end
end
