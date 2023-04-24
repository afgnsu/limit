class Order < ApplicationRecord
  belongs_to :product

  before_create :check_order_limit

  private
  def check_order_limit
    errors.add(:base, 'Oops, Limit Exceeded!') if product.orders.size >= product.amount
  end
end
