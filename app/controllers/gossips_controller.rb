class GossipsController < ApplicationController
  def index
    @gossips = Gossip.includes(:user).order(created_at: :desc)
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end

