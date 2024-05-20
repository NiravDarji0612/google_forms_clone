class CreateGForms < ActiveRecord::Migration[7.1]
  def change
    create_table :g_forms do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
