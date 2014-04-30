class AssetsController < ApplicationController
  before_filter :authenticate_user!
  # after_action :verify_authorized

  def index
	@assets = current_user.assets.all
  end

  def new
  	@asset  = current_user.assets.build
  end

  def create
  	@asset  = current_user.assets.build (asset_params)
  	if @asset.save
      flash[:success] = "Asset added succesfully!"
      redirect_to assets_path
    else
      flash[:error] = "Asset not added succesfully!"
      render 'assets/index'
    end
  end

  def destroy
  	asset = Asset.find(params[:id])
    asset.destroy
    redirect_to assets_path, :notice => "Asset deleted."
  end

  def edit
  end

  private

    def asset_params
      params.require(:asset).permit(:asset_type, :amount)
    end
end
