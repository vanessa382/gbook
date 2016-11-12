class CategoriesController < ApplicationController
  before_action :set_gbook

  def show
  end

  def create
    @category = @gbook.categories.create(category_params)
    @category.gbook_id = @gbook.id
    redirect_to gbook_categories_path(@gbook)
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_gbook
      @gbook = Gbook.find(params[:gbook_id])
    end

    def category_params
      params[:category].permit(:name,:weight)
    end
end
