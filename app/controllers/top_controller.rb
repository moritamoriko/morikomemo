class TopController < ApplicationController
  skip_before_filter :authenticate

  # トップ
  def index
  	if signed_in?
  	  redirect_to memos_path
  	end
  end
end
