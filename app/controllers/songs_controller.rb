class SongsController < ApplicationController

    def index 
        @songs = Song.all
    end

    def show
        @song =  Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create 
        @song = Song.create(allowed_params)

       if @song.valid?
        redirect_to song_path(@song)
    else
        render :new
    end
    end

    def edit 
        @song = Song.find(params[:id])
   
    end

    def update 
        @song = Song.find(params[:id])
        @song.update(allowed_params)
        @song.save
        redirect_to song_path(@song)
    end

    def destroy
        song = Song.find(params[:id]).delete
        redirect_to songs_path
    end

    private 

    def allowed_params 
        params.require(:song).permit(:title, :released, :released_year, :artist_name, :genre)
    end
end
