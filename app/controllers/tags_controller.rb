class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@tags = current_user.tags.all
  end

  def new
  	@tag  = current_user.tags.build
    @tag.color = TagColor.all.first.color_hex
  end

  def create
  	@tag  = current_user.tags.build (tag_params)
  	if @tag.save
      flash[:success] = "Tag added succesfully!"
      redirect_to tags_path
    else
      flash[:error] = "Tag not added succesfully!"
      render 'tags/index'
    end
  end

  def destroy
  	tag = Tag.find(params[:id])
    tag.destroy
    redirect_to tags_path, :notice => "Tag deleted."
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
  	@tag = Tag.find(params[:id])
  end

  def update
  	@tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, :notice => "Changes saved."
    else
      redirect_to tags_path, :alert => "Unable to save changes."
    end
  end

  private

    def tag_params
      params.require(:tag).permit(:name, :color)
    end
end
