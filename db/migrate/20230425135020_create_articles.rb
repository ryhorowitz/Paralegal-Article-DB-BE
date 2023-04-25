class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :published
      t.string :link
      t.integer :country_id
      t.integer :category_id
      t.timestamp
    end
  end
end
