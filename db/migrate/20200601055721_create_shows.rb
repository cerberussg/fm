class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.belongs_to :federation
      t.string :name
      t.integer :number_of_matches
      t.string :day_of_week
      t.timestamps
    end
  end
end