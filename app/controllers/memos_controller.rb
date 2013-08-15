class MemosController < ApplicationController
	def new
      @memo = Memo.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @memo }
      end

	end
	def create
		@memo = Memo.new(params[:entry])
		if @memo.save
			redirect_to new_memo_path
		else
			redirect_to root_path
		end
	end	

end
