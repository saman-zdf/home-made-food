class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :street_number
      t.string :street_name
      t.string :suburb
      t.integer :postcode
      t.integer :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
