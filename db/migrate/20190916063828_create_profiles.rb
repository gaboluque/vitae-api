class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :phone
      t.string :location
      t.integer :gender
      t.text :description, default: ''
      t.date :birth_date

      t.timestamps
    end
  end
end
