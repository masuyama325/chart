class CreateCandleSticks < ActiveRecord::Migration[5.2]
  def change
    create_table :candle_sticks do |t|
      t.integer :open
      t.integer :high
      t.integer :low
      t.integer :close
      t.date :date
      t.boolean :yoso
      t.boolean :result
      
      t.timestamps
    end
  end
end
