class SongsController < ApplicationController
    def edit
        @song = Song.find(params[:id])

    end
    def new
        @song = Song.new
    end
    def index
        @songs = Song.all
    end
    def show
        @song = Song.find(params[:id])
    end
    
    def update
        @song = Song.find(params[:id])
        @song = Song.update(song_params)
        redirect_to song_path(@song)
    end
    def create
        @song = Song.create(song_params)
        redirect_to song_path(@song)
    end
    def destroy

    end

    private
    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end
end
