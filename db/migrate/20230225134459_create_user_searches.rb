class CreateUserSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_searches do |t|
      t.string :make
      t.string :model
      t.integer :year_from
      t.integer :year_to
      t.integer :price_from
      t.integer :price_to
      t.integer :user_id

      t.timestamps
    end
  end
end
