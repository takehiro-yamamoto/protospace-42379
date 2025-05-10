class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]# 残りのアクション（index, showなど）は認証なしでアクセス可
  before_action :set_prototype, only: [:show, :edit, :update, :destroy] # showアクションは、特定のプロトタイプを表示するために必要な情報を取得するために使用。
  before_action :move_to_index, only: [:edit, :update, :destroy]  # ログインしていないユーザーは、edit, update, destroyアクションにアクセスできないようにする


  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      render :show
    end
  end

   private
  def prototype_params #ストロングパラメーターの定義 必須の指定があるものすべて
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  # ログインしていないユーザーは、edit, update, destroyアクションにアクセスできないようにする
    
  def move_to_index
    redirect_to root_path unless current_user == @prototype.user # 現在のユーザーがプロトタイプの作成者でない場合、ルートパスにリダイレクト。
  end

end


