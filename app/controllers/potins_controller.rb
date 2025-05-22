class PotinsController < ApplicationController
  def new
    @potin = Potin.new
  end

  def create
    @potin = Potin.new(potin_params)
    @potin.user = current_user # Assurez-vous que l'utilisateur est connecté

    if @potin.save
      redirect_to root_path, notice: 'Potin créé avec succès !'
    else
      render :new
    end
  end

  private

  def potin_params
    params.require(:potin).permit(:title, :content)
  end
end
