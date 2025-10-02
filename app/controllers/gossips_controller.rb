class GossipsController < ApplicationController
  before_action :anonymous_user, only: [:create]
  def index
    @gossips = Gossip.all.order(created_at: :desc)
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


