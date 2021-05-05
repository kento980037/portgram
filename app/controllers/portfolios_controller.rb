class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio =Portfolio.find(params[:id])
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
    if @portfolio.save
      redirect_to portfolio_path(@portfolio), notice: "投稿に成功しました．"
    else
      render :new
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id]) 
    if @portfolio.user != current_user
      redirect_to portfolios_path, alert: "不正なアクセスです．"
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
       redirect_to portfolio_path(@portfolio), notice: "投稿に成功しました．"
    else
       render :edit
    end
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.destroy
    redicect_to portfolio_path
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :body, :image)
  end

end
