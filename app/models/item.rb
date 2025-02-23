class Item < ApplicationRecord
  has_one_attached :image
  blongs_to :user

  def indax
    @items = Item.all
  end

  private

  def items_params
    params.require(:item).permit(:name, :introduction, :price)
  end

end
