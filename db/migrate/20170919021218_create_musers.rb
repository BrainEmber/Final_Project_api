class CreateMusers < ActiveRecord::Migration[5.1]
  def change
    create_table :musers do |t|
      t.string :name
      t.string :genera
      t.string :game
      t.string :hours

      t.timestamps
    end
  end
end
