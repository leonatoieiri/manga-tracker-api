class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :nickname
      t.integer :role

      t.timestamps
    end
  end
end
