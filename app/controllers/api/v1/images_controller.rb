class Api::V1::ImagesController < ApplicationController

    before_action :find_image, only: [:update]
     def index
       @images = Image.all
       render json: @images
     end

     def update
       @image.update(image_params)
       if @image.save
         render json: @image, status: :accepted
       else
         render json: { errors: @image.errors.full_messages }, status: :unprocessible_entity
       end
     end

     def show
       @image = Image.all.find()
       client = Aws::Rekognition::Client.new
       resp = client.detect_labels(
                image: { bytes: File.read("./test_pic.png") }
              )
     end


     private

     def image_params
       params.permit(:id, :name, :picture)
     end

     def find_image
       @image = Image.find(params[:id])
     end

end
