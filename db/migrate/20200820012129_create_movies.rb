class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :length
      t.string :genre
      t.string :rating
      t.integer :release_year

      t.timestamps
    end
  end
end
