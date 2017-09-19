class CreateFusers < ActiveRecord::Migration[5.1]
  def change
    create_table :fusers do |t|
      t.string :name
      t.string :genera
      t.string :game
      t.string :hours

      t.timestamps
    end
  end
end
