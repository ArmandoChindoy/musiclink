
class Api::V1::PlaylistsController < ApplicationController

    # GET /playlists or /playlists.json
    def index
        playlists = Playlist.all
        render json: playlists
    end

    # GET /playlists/1 or /playlists/1.json

    def show
        @playlist = Playlist.find(params[:id])
        render json: @playlist
    end

    # GET /playlists/new
    def new
        @playlist = Playlist.new
    end

    # GET /playlists/1/edit
    def edit
    end

    # POST /playlists or /playlists.json
    def create
        @playlist = Playlist.new(playlist_params)

        respond_to do |format|
            if @playlist.save
                format.html { redirect_to @playlist, notice: "Playlist was successfully created." }
                format.json { render :show, status: :created, location: @playlist }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @playlist.errors, status: :unprocessable_entity }
            end
        end
    end
end
