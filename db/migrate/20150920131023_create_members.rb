class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, id: false do |t|
      t.string :enum, null: false
      t.string :password_digest, null: false
      t.string :name, null:false
      t.string :birth, null:false
      t.text :position
      t.text :department
      t.datetime :created_at, null:false
      t.datetime :updated_at, null:false

      t.timestamps null: false
    end

    execute "ALTER TABLE members ADD PRIMARY KEY (enum);"
  end

  def self.down
    drop_table :members
  end
end
