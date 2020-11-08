class CreateCreatings < ActiveRecord::Migration[5.2]
  def change
    create_table :creatings do |t|
      t.references :article, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
