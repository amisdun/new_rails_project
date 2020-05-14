class CreateAdmissionTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :admission_templates do |t|
      t.string :student_number
      t.string :student_name
      t.string :student_address
      t.string :program_name
      t.string :email
      t.string :title

      t.timestamps
    end
  end
end
