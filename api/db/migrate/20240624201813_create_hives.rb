class CreateHives < ActiveRecord::Migration[7.1]
  def change
    create_table :hives do |t|
      t.string :name
      t.integer :weight

      t.timestamps
    end
  end
end
