class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :type_of_question
      t.references :g_form, null: false, foreign_key: true
      t.timestamps
    end
  end
end
