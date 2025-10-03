class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all.order(created_at: :desc)
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    anonymous_user = User.find_by(email: "anonymous@example.com")

    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      user: anonymous_user || User.first # fallback si l'anonyme n'existe pas
    )

    if @gossip.save
      flash[:success] = "Potin créé avec succès !"
      redirect_to gossips_path
    else
      flash.now[:error] = "Erreur lors de la création du potin"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: "Potin mis à jour avec succès !"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: "Potin supprimé avec succès !"
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, tag_ids: [])
  end
end

