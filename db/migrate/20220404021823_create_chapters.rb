class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :uuid
      t.integer :number
      t.string :cover
      t.float :chapter_start
      t.float :chapter_end
      t.date :release_date
      t.references :manga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
