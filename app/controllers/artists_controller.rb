class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :destroy, :update, :edit]
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
      @artists = current_user.artists.all
    end
  
    def show
      @songs = @artist.songs
         if @artist.user != current_user
            flash[:notice] = "Not Allowed!"
            redirect_to artists_path
    end
  end
    def new
      @artist = Artist.new
    end
  
    def create
      @artist = Artist.new(artists_params)
      @artist.user = current_user
      if @artist.save
        redirect_to @artist
    else
        render 'new'
    end
    end
  
    def edit
      @artist 
    end
  
    def update
      @artist.update(artists_params)
        
      redirect_to artist
    end
  
    def destroy

      @artist.destroy
      redirect_to artists_path
    end
  
    private
  
      def artists_params
        params.require(:artist).permit(:name, :albums, :hometown, :img)
      end
      def find_artists
        @artist = Artist.find(params[:id])
      end  
  end