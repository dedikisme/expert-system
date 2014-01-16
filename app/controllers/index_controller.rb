class IndexController < ApplicationController
	def index


=begin

		p=Penyakit.all
		ar=[]
					i=0

		p.each do | datap |
			ar[i]=[]
			datap.gejalas.each do | datag |
				ar[i].push(datag._id.to_s)
			end
			ar[i].sort
			i+=1
		end

		d=[]
       ar.detect{ |e| (ar.count(e) > 1)? d.push(e) : nil ; }
		@ar=d
=end
	end
def kerusakan
	@p=Penyakit.all
end
end
