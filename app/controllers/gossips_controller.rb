class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all.order(created_at: :desc)
  end

  def new
    @gossip = Gossip.new
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

end


