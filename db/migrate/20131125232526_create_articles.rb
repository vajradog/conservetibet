class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :teacher
      t.string :recorded
      t.string :sound
      t.string :image
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
