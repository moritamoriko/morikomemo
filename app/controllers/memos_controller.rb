class MemosController < ApplicationController
   def index
   @memos = Memo.all
  end

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
    redirect_to @memo
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)
    redirect_to edit_memo_path(@memo), notice: "編集しました。"
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path, notice: "削除しました。"
  end

  private

  def memo_params
    params.require(:memo).permit(:entry)
  end
end
