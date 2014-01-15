class KliensController < ApplicationController
  before_action :set_klien, only: [:show, :edit, :update, :destroy]
  before_action :ceklogin
  layout "admin"

  # GET /kliens
  # GET /kliens.json
  def index
    @kliens = Klien.all
  end

  # GET /kliens/1
  # GET /kliens/1.json
  def show
  end

  # GET /kliens/new
  def new
    @klien = Klien.new
  end

  # GET /kliens/1/edit
  def edit
  end

  # POST /kliens
  # POST /kliens.json
  def create
    @klien = Klien.new(klien_params)

    respond_to do |format|
      if @klien.save
        format.html { redirect_to @klien, notice: 'Klien was successfully created.' }
        format.json { render action: 'show', status: :created, location: @klien }
      else
        format.html { render action: 'new' }
        format.json { render json: @klien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kliens/1
  # PATCH/PUT /kliens/1.json
  def update
    respond_to do |format|
      if @klien.update(klien_params)
        format.html { redirect_to @klien, notice: 'Klien was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @klien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kliens/1
  # DELETE /kliens/1.json
  def destroy
    @klien.destroy
    respond_to do |format|
      format.html { redirect_to kliens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klien
      @klien = Klien.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def klien_params
      params.require(:klien).permit(:nama, :alamat, :email, :ip)
    end
        def ceklogin
          if !user_signed_in? 
          redirect_to "/users/sign_in", notice: 'belum login'
        end
    end
end
