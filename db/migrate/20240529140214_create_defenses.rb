class CreateDefenses < ActiveRecord::Migration[7.1]
  def change
    create_table :defenses do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
