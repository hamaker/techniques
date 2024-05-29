class CreateTechniques < ActiveRecord::Migration[7.1]
  def change
    create_table :techniques do |t|
      t.references :attack, null: false, foreign_key: true
      t.references :defense, null: false, foreign_key: true
      t.string :group, null: false
      t.integer  :exam_level, null: false

      t.timestamps
    end
  end
end
