class Admin::PenyakitsController < ApplicationController
  before_action :set_penyakit, only: [:show, :edit, :update, :destroy, :gejala, :gejalaproses]

  # GET /penyakits
  # GET /penyakits.json
  def index

    @penyakits = Penyakit.all
  end

  # GET /penyakits/1
  # GET /penyakits/1.json
  def show

  end

  def gejala
     ar=Array.new
     @penyakit.gejalas.each do | data | 
       ar.push(data._id)
      end 
  @ar=ar
    @gejala=Gejala.order_by()

    
  end

  def gejalaproses
    data=params[:cekgejala]
    @penyakit.gejalas = []
    if data!=nil
    data.each do | datag |
      @penyakit.gejalas << Gejala.find(datag)
    end
  end
    @data=@penyakit.inspect
    redirect_to @penyakit, notice: 'Penyakit was successfully editted.'

  end

  # GET /penyakits/new
  def new
    @penyakit = Penyakit.new
  end

  # GET /penyakits/1/edit
  def edit
  end

  # POST /penyakits
  # POST /penyakits.json
  def create
    @penyakit = Penyakit.new(penyakit_params)

    respond_to do |format|
      if @penyakit.save
        format.html { redirect_to @penyakit, notice: 'Penyakit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @penyakit }
      else
        format.html { render action: 'new' }
        format.json { render json: @penyakit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /penyakits/1
  # PATCH/PUT /penyakits/1.json
  def update
    respond_to do |format|
      if @penyakit.update(penyakit_params)
        format.html { redirect_to @penyakit, notice: 'Penyakit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @penyakit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /penyakits/1
  # DELETE /penyakits/1.json
  def destroy
    @penyakit.destroy
    respond_to do |format|
      format.html { redirect_to penyakits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_penyakit
      @penyakit = Penyakit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def penyakit_params
      params.require(:penyakit).permit(:nama, :deskripsi, :solusi)
    end
end
