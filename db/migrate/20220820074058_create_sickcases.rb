class CreateSickcases < ActiveRecord::Migration[7.0]
  def change
    create_table :sickcases do |t|
      t.string :title
      t.string :description
      t.string :instruction

      t.timestamps
    end
  end
end
