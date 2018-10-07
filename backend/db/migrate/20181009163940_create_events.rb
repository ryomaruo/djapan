class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :dj, foreign_key: true
      t.string :country, null: false
      t.string :city, null: false
      t.string :venue, null: false
      t.string :link, null: false
      t.datetime :dates, null: false
      t.timestamps
    end
  end
end
