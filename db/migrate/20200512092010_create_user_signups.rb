class CreateUserSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_signups do |t|
      t.string :username
      t.string :password
      t.string :category

      t.timestamps
    end
  end
end
