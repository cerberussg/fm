class CreateDivisions < ActiveRecord::Migration[6.0]
  def change
    create_table :divisions do |t|
      t.string :name
      t.references :federation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
