class Admin::CatagoriesController < ApplicationController
  before_action :set_admin_catagory, only: %i[ show edit update destroy ]

  # GET /admin/catagories or /admin/catagories.json
  def index
    @admin_catagories = Catagory.all
  end

  # GET /admin/catagories/1 or /admin/catagories/1.json
  def show
  end

  # GET /admin/catagories/new
  def new
    @admin_catagory = Catagory.new
  end

  # GET /admin/catagories/1/edit
  def edit
  end

  # POST /admin/catagories or /admin/catagories.json
  def create
    @admin_catagory = Catagory.new(admin_catagory_params)

    respond_to do |format|
      if @admin_catagory.save
        format.html { redirect_to admin_catagory_url(@admin_catagory), notice: "Catagory was successfully created." }
        format.json { render :show, status: :created, location: @admin_catagory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_catagory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/catagories/1 or /admin/catagories/1.json
  def update
    respond_to do |format|
      if @admin_catagory.update(admin_catagory_params)
        format.html { redirect_to admin_catagory_url(@admin_catagory), notice: "Catagory was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_catagory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_catagory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/catagories/1 or /admin/catagories/1.json
  def destroy
    @admin_catagory.destroy!

    respond_to do |format|
      format.html { redirect_to admin_catagories_url, notice: "Catagory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catagory
      @admin_catagory = Catagory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_catagory_params
      params.require(:admin_catagory).permit(:name, :description)
    end
end
