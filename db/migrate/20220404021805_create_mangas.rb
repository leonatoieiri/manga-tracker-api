class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :uuid
      t.string :original_title
      t.string :en_title
      t.string :pt_title
      t.float :chapters
      t.integer :volumes
      t.references :author, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
