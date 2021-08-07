class RemoveColumnFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :profile, null: false, foreign_key: true
  end
end
