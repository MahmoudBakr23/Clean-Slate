class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
