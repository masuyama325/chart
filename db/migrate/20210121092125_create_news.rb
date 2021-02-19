class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.integer :candleStick_id
      t.string :discription

      t.timestamps
    end
  end
end
