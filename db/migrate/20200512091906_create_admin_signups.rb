class CreateAdminSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_signups do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
