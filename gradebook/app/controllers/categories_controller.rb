class CategoriesController < ApplicationController
  before_action :set_gbook

  def show
  end

  def edit
  end

  def create
    @category = @gbook.categories.create(category_params)
    @category.gbook_id = @gbook.id
    redirect_to gbook_categories_path(@gbook)
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to gbook_category_path(@gbook,@category), notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
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
