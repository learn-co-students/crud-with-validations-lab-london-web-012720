class SongsController < ApplicationController
    def index #list of drinks
        @songs = Song.all
    end
  
    def show #individual record. one drink for ex
        @song = Song.find(params[:id])
    end
  
    def new #display form for create a new record
        @song = Song.new
    end
  
    def create #save new record when clicked submit on "new"
        @song = Song.new(allowed_params)
        
        if @song.save
            redirect_to song_path(@song)
        else
            render "new"
        end
    end
  
    def edit #display form for the existing record
        @song = Song.find(params[:id])
    end
  
    def update #update the existing modified record
        @song = Song.find(params[:id])
  
        if @song.update_attributes(allowed_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end
  
    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end
  
    private
    def allowed_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end