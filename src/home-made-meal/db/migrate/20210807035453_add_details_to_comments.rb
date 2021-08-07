class AddDetailsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :seller_id, :integer
    add_column :comments, :buyer_id, :integer
    add_reference :comments, :profile, null: false, foreign_key: true
  end
end
