class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postNo, null: false
      t.string :pref, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_f, null: false
      t.string :first_name_f, null: false
      t.string :phon
      t.references :user, null:false, foregin_key:true
      t.timestamps
    end
  end
end
