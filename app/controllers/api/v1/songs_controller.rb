class Api::V1::SongsController < ApplicationController
    def index
        playlists = Playlist.all
        all_songs = playlists.map(&:songs).flatten
        render json: all_songs
    end

    def show
        song = Song.find(params[:id])
        render json: song
    end

    def create
        song = Song.new(song_params)
        if song.save
            render json: song
        else
            render json: {error: "Error creating song"}
        end
    end

    def destroy
        song = Song.find(params[:id])
        song.destroy
        render json: {message: "Song deleted"}
    end

    private

    def song_params
        params.require(:song).permit(:name, :artist, :album, :playlist_id)
    end
end