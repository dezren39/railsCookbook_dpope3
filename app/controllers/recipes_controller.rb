class RecipesController < ApplicationController

  before_action :get_categories, :only =>[:new, :edit, :create, :update]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :except => [:index, :show]

  def index

    if params[:q]
       @recipes = Recipe.find_all_by_query(params[:q])
    else
        @recipes = Recipe.all
    end
    @title = 'index'
  end

  def show
  @title = 'Show Recipe'
  end

  def new
    @recipe = Recipe.new
    #@categories = Category.all.collect{|c| [c.name, c.id]}
    @title = 'New Recipe'
  end

  def edit
  @title = 'Edit Recipe'
  #@categories = Category.all.collect{|c| [c.name, c.id]}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @title = 'Create Recipe'

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  @title = 'Update Recipe'
  
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    @title = 'Delete Recipe'
    
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.includes(:category).find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions, :category_id)
    end
    
    def get_categories
      @categories = Category.all.collect{|c| [c.name, c.id] }
    end
end
