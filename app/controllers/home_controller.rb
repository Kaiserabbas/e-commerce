class HomeController < ApplicationController
  def index
    @main_catagories = Catagory.take(6)
  end
end
