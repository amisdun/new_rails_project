class CreateReceiptTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :receipt_templates do |t|
      t.string :student_name
      t.string :date
      t.string :amount_in_words
      t.integer :amount_in_numbers
      t.string :index_number

      t.timestamps
    end
  end
end
