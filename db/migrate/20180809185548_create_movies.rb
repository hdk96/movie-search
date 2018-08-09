class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :moviename
      t.date :date
      t.string :director
      t.string :image

      t.timestamps
    end
  end
end
