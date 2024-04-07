class CatagoriesController < ApplicationController
  def show 
    @catagory = Catagory.find(params[:id])
    @products = @catagory.products
  end
end 
