class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :kind, null: false
      t.string :place, null: false
      t.string :location, null: false
      t.string :title, null: false
      t.text :content, null: false, default: ''
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :ongoing

      t.timestamps
    end
  end
end
