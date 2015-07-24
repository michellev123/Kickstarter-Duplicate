class CreateDonors < ActiveRecord::Migration
  def up
    create_table :donors do |t|
      t.string :username
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :credit_card

      
    end 
  end
  
  def down
    drop_table :donors
  end 
end
