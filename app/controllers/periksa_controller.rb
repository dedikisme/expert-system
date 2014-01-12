class PeriksaController < ApplicationController
  def index

  end

  def create
  	datapost=[]
  	cookies[:nama]=params[:nama]
  	cookies[:alamat]=params[:alamat]
  	cookies[:email]=params[:email]
    ar=[]
    p=Penyakit.where(:gejala_ids.exists => true).where(:gejala_ids.ne => [])
    p.each do | data |
      ar.push(data._id)
    end 
    cookies[:penyakit]=ar
    redirect_to '/periksa/cek'

  end

  def cek
  	@nama=cookies[:nama]
  	@alamat=cookies[:alamat]
  	@email=cookies[:email]
    arpenyakit=cookies[:penyakit].split('&')
    ar=[]
    bandingar=[]
    for i in 0..arpenyakit.count-1
      p=Penyakit.find(arpenyakit[i])
      ar[i]=p.gejalas
      if i!=0 
    bandingar = ar[i-1]-ar[i]
    if bandingar.count==0
      bandingar = ar[i]-ar[i-1]
      if bandingar.count==0
        break
      end
    end
    end
    if bandingar.count!=0
    break
  end

    end
    @tanya= bandingar[0].nama
    @idgejala=bandingar[0]._id


  end

  def proses
    g=Gejala.find(params[:idgejala])
          arpenyakits=cookies[:penyakit].split('&')
    idpenyakits=[]
    g.penyakits.each do | data |
      idpenyakits.push(data._id.to_s)
    end


    if params[:pilihan]=='ya'
        arpenyakits.concat(idpenyakits)
        penyakits=arpenyakits.find_all { |e| arpenyakits.count(e) > 1 }
        penyakits=penyakits.uniq
      
    else
        penyakits = arpenyakits - idpenyakits
    end


    cookies[:penyakit]=penyakits
    if penyakits.count==1
      path = "/periksa/hasil"
    else
      path = "/periksa/cek"
    end
    @inspect= penyakits
    redirect_to path
  end

  def hasil
    @nama=cookies[:nama]
    @alamat=cookies[:alamat]
    @email=cookies[:email]
    p=Penyakit.find(cookies[:penyakit])
    @penyakit=p.nama
    @gejalas=p.gejalas
    @solusi=p.solusi
  end
end