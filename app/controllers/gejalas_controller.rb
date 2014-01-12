class GejalasController < ApplicationController
  before_action :set_gejala, only: [:show, :edit, :update, :destroy]
  before_action :ceklogin

  # GET /gejalas
  # GET /gejalas.json
  def index
    
    @gejalas = Gejala.all
  end

  # GET /gejalas/1
  # GET /gejalas/1.json
  def show
  end

  # GET /gejalas/new
  def new
    @gejala = Gejala.new
  end

  # GET /gejalas/1/edit
  def edit
  end

  # POST /gejalas
  # POST /gejalas.json
  def create
    @gejala = Gejala.new(gejala_params)

    respond_to do |format|
      if @gejala.save
        format.html { redirect_to @gejala, notice: 'Gejala was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gejala }
      else
        format.html { render action: 'new' }
        format.json { render json: @gejala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gejalas/1
  # PATCH/PUT /gejalas/1.json
  def update
    respond_to do |format|
      if @gejala.update(gejala_params)
        format.html { redirect_to @gejala, notice: 'Gejala was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gejala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gejalas/1
  # DELETE /gejalas/1.json
  def destroy
    @gejala.destroy
    respond_to do |format|
      format.html { redirect_to gejalas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gejala
      @gejala = Gejala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gejala_params
      params.require(:gejala).permit(:nama)
    end
        def ceklogin
          if !user_signed_in? 
          redirect_to "/users/sign_in", notice: 'belum login'
        end
    end
end
