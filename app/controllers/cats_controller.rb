class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  # GET /cats
  def index
    @cats = Cat.page(params[:page]).per(4)
  end

  # GET /cats/1
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to @cat, notice: 'Cat was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cats/1
  # PATCH/PUT /cats/1.json
  def update
    if @cat.update(cat_params)
      format.html redirect_to @cat, notice: 'Cat was successfully updated.'
    else
      format.html render action: 'edit'
    end
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat.destroy
    format.html redirect_to cats_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_params
      params.require(:cat).permit(:name, :color)
    end
end
