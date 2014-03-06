class MemosController < ApplicationController
  skip_before_action :authenticate, {:only => :show}
  def index
   @memos = current_user.memos
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
    @memo.user_id = current_user.id
    @memo.save!
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

  def tweet
    @memo = Memo.find(params[:id])
    if @memo.entry.size > 140
      # puts "140文字超えたよ"
      shorttweet = @memo.entry.truncate(100)
      shorttweet += " "
      shorttweet += memo_url(@memo)
      twitter_client.update(shorttweet)
    else
      twitter_client.update(@memo.entry)
    end

    flash[:notice] = "tweet: #{@memo.entry}"
    render :show
  end

  private

  def memo_params
    params.require(:memo).permit(:entry)
  end

  def twitter_client
    Twitter::Client.new(
      :consumer_key       => Settings.twitter_key,
      :consumer_secret    => Settings.twitter_secret,
      :oauth_token        => session[:oauth_token],
      :oauth_token_secret => session[:oauth_token_secret]
    )
  end
end
