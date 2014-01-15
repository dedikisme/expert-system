class IndexController < ApplicationController
  def index
  end
  def kerusakan
  	@p=Penyakit.all
  end
end
