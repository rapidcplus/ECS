class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  def index
    @item = Item.includes(:user)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to index_path, success: t('items.create.success')
    else
      flash.now[:danger] = t('items.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :item_url)
  end
end
