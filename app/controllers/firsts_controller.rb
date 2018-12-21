class FirstsController < ApplicationController
  def index
    @firsts = First.all
  end
  
  def show
    @first = First.find(params[:id])
  end
  
  def new
    @first = First.new
  end
  
  def create
    @first = First.new(first_params)
    
    if @first.save
      flash[:success] = 'First が正常に投稿されました'
      redirect_to @first
    else
      flash.now[:danger] = 'First が投稿されませんでした'
      render :new
    end
    
  end
  
  def edit
    @first = First.find(params[:id])
  end
  
  def update
    @first = First.find(params[:id])
    
    if @first.update(first_params)
      flash[:success] = 'First は正常に更新されました'
      redirect_to @first
    else
      flash.now[:danger] = 'Firstは更新されませんでした'
      render :edit
    end
  end
  
  
  def destroy
    @first = First.find(params[:id])
    @first.destroy
    
    flash[:success] = 'First は正常に削除されました'
    redirect_to firsts_url
  end
  

  private
  
  # Strong Parameter
  def first_params
    params.require(:first).permit(:content)
  end
  
end

