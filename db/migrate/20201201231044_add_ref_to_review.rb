class AddRefToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :order, null: false, foreign_key: true
  end
end
