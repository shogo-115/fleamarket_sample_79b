class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_f, null: false
      t.string :first_name_f, null: false
      t.integer :birthday, null: false
      t.references :user, null:false, foregin_key:true
      t.timestamps
    end
  end
end
