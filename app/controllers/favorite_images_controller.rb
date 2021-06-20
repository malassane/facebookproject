class FavoriteImagesController < ApplicationController
    def show
      @favorites = current_user.favorite_images.all
    end 
    def create
      favorite = current_user.favorite_images.create(picture_id: params[:picture_id])
      redirect_to pictures_path, notice: "#{favorite.picture.user.name}'S Post has been added to favorites"
    end
    def destroy
      favorite = current_user.favorite_images.find_by(id: params[:id]).destroy
      redirect_to pictures_path, notice: "#{favorite.picture.user.name}Unblogged Mr.'s Post"
    end
  end
