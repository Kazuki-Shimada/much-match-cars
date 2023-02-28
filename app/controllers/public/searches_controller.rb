class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @users = User.looks(params[:word])
      render "public/searches/search_result"
    elsif @range == "メーカー"
      @manufacturers = Manufacturer.looks(params[:word])
      render "public/searches/search_result"
    else
      @models = Model.looks(params[:word])
      render "public/searches/search_result"
    end
  end
end
