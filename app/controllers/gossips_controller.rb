class GossipsController < ApplicationController
  def new
    @gossip = Potin.new
  end

  def create
    @gossip = Potin.new(gossip_params)
    @gossip.user = User.find_by(first_name: 'anonymous') # Associer à l'utilisateur "anonymous"

    if @gossip.save
      redirect_to root_path, notice: 'Le super potin a été enregistré avec succès !'
    else
      flash.now[:alert] = 'Erreur : vous devez compléter ce champ / le titre doit faire au moins 3 caractères / etc.'
      render :new
    end
  end

  private

  def gossip_params
    params.require(:potin).permit(:title, :content)
  end
end
