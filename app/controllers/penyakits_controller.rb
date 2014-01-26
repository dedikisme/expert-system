class PenyakitsController < ApplicationController
  before_action :set_penyakit, only: [:show, :edit, :update, :destroy, :gejala, :gejalaproses]
  before_action :ceklogin
  layout "admin"
  # GET /penyakits
  # GET /penyakits.json
  def index

    @penyakits = Penyakit.all
    ar=[]
    i=0

    @penyakits.each do | datap |
      ar[i]=[]
      datap.gejalas.each do | datag |
        ar[i].push(datag._id.to_s)
      end
      ar[i].sort
      i+=1
    end

    d=[]
    ar.detect{ |e| (ar.count(e) > 1)? d.push(e) : nil ; }

    if d.count >0
      ar = []
      er=[]
      g=Gejala.find(d)
      g.each do | dag |
        ar.push(dag) 
      end
      for i in 0..ar.count-1
        if i!=0
        er=er & ar[i].penyakits
      else
        er = ar[i].penyakits
      end
      end
      @er=er

    end
  end

  # GET /penyakits/1
  # GET /penyakits/1.json
  def show

  end

  def jsonp
    p=params[:idpenyakit]
    if p=='' or p==nil
      datap = Penyakit.all.to_json

      render :json => datap, :callback => params[:callback]
    else

      datag=Gejala.all.to_a
      datag.each do | data |
        data.penyakits.each do | asd |
          if asd._id.to_s==p
            data["penyakit"]="checked"
          end
        end
      end

      render :json => datag.as_json, :callback => params[:callback]

    end
  end

  def gejala
   ar=Array.new
   @penyakit.gejalas.each do | data | 
     ar.push(data._id)
   end 
   @ar=ar
   @namapenyakit=@penyakit.nama
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

    def ceklogin
      if !user_signed_in? 
        redirect_to "/users/sign_in", notice: 'belum login'
      end
    end
  end
