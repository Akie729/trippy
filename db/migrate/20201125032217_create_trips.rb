class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :title
      t.string :text
      t.text :image

      t.timestamps
    end
  end
end
