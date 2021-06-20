class PicturesController < ApplicationController
    before_action:set_pic, only: [:show, :update, :edit, :destroy]

    def new
        @picture = Picture.new
    end
    def show 
        @favorite = current_user.favorite_images.find_by(picture_id: @picture.id)
    end 
    def edit
    end
    def update 
        if @picture.update(pic_params)
            redirect_to pictures_path, notice: "Mise à jour effectuée !"
          else
            render :edit
        end
    end
    def index
        @pictures = Picture.all
    end
    def create 
        @picture = current_user.pictures.build(pic_params)
        if params[:back]
            render :new
        else
            if @picture.save 
                redirect_to new_picture_path
            else
                render :new
            end
        end
    end
    def destroy
        @picture.destroy
        redirect_to pictures_path, notice:"Image supprimée!"
    end
    def confirm 
        @picture = current_user.pictures.build(pic_params)
        render :new if @picture.invalid?
    end
        

    private
    def pic_params
        params.require(:picture).permit(:image, :image_cache)
    end
    def set_pic
        @picture= Picture.find(params[:id])
    end
end 