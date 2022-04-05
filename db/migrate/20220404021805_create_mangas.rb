class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :uuid
      t.string :original_title
      t.string :en_title
      t.string :pt_title
      t.float :released_chapters
      t.integer :released_volumes
      t.references :author, null: true, foreign_key: true
      t.references :publisher, null: true, foreign_key: true

      t.timestamps
    end
  end
end
