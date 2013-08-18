class MemosController < ApplicationController
  def new
    @memo = Memo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @memo }
    end
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to new_memo_path
  end

  private

  def memo_params
    params.require(:memo).permit(:entry)
  end
end
