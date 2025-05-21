class PagesController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
    @first_name = params[:first_name]
  end

  def home
    @potins = Potin.includes(:user).all
  end
end
