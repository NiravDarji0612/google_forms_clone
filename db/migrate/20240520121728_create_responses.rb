class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :g_form, null: false, foreign_key: true
      t.jsonb :answers
      t.string :sent_by
      t.timestamps
    end
  end
end
