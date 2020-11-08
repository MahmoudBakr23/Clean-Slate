class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :author, index: true
      t.references :article, index: true, foreign_key: true

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :author_id
  end
end
