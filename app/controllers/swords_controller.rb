class SwordsController < ApplicationController
  before_action :set_sword, only: [:show, :edit, :update]

  def index
    @swords = Sword.all
  end

  def show
  end

  def new
    @sword = Sword.new
  end

  def create
    @sword = Sword.new(sword_params)
    @sword.user_id = current_user.id
    if @sword.save
      flash[:notice] = "You successfully created a sword"
      redirect_to sword_path(@sword)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sword.update(sword_params)
      flash[:notice] = "You successfully updated a sword"
      redirect_to sword_path(@sword)
    else
      render :edi
    end
  end

  def destroy
    sword = Sword.find(params[:id])
    sword.destroy
    flash[:notice] = "You successfully deleted a sword"
    redirect_to swords_path
  end

  private

  def sword_params
    params.require(:sword).permit(:name, :style, :owner)
  end

  def set_sword
    @sword = Sword.find(params[:id])
  end

end
