class CreateUserMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :user_mangas do |t|
      t.string :uuid
      t.float :chapter_read
      t.integer :volume_read
      t.integer :volume_bought
      t.references :manga, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
