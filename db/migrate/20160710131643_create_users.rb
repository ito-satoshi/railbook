class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :username
      t.string :passsword
      t.string :email

      t.timestamps null: false
    end
  end
end
