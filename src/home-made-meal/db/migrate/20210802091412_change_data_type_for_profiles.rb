class ChangeDataTypeForProfiles < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :state, :string 
  end
end
