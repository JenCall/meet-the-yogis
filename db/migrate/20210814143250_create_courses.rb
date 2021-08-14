class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.text :classstyle
      t.string :title
      t.text :description
      t.text :address
      t.float :price
      t.string :language
      t.integer :availability
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
