class DeleteCategoryIdColumnFromArticlesTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :category_id
  end
end
