class GossipsController < ApplicationController
  before_action :anonymous_user, only: [:create]
  def index
    @gossips = Gossip.all.order(created_at: :desc)
  end


    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def create
    anonymous_user = User.find_by(email: "anonymous@example.com")

    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      user: anonymous_user
    )

    if @gossip.save
      flash[:success] = 
      redirect_to gossips_path
    else
      flash.now[:error] = 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  private 

  def anonymous_user
    if User.find_by(email: "anonymous@example.com")== nil
      User.create(
        first_name: "Anonymous",
        last_name: "User",
        email: "anonymous@example.com",
        bio: "This is an anonymous user."
      ).save
    end
  end
end


    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.first # utilisateur par défaut
    if @gossip.save
      redirect_to @gossip, notice: "Potin créé avec succès !"
    else
      render :new
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
    params.require(:gossip).permit(:title, :content, :tag_ids => [])
  end
end

