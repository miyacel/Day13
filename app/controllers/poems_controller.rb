class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :destroy]

  
  def index
    @poems = Poem.all
  end

  
  def show
  end

  
  def new
    if params[:back]
      @poem = Poem.new(poem_params)
    else
      @poem = Poem.new
    end
  end

  
  def edit
    @poem = Poem.find(params[:id])
  end


  def create
    @poem = Poem.new(poem_params)

    respond_to do |format|
      if @poem.save
        format.html { redirect_to @poem, notice: 'Poem was successfully created.' }
        format.json { render :show, status: :created, location: @poem }
      else
        format.html { render :new }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @poem = Poem.find(params[:id])
    @poem.update(poem_params)
    
    respond_to do |format|
      if @poem.update(poem_params)
        format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @poem.destroy
    respond_to do |format|
      format.html { redirect_to poems_url, notice: 'Poem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_poem
      @poem = Poem.find(params[:id])
    end

    def poem_params
      params.require(:poem).permit(:title, :content, :auther)
    end
end
