class CreateDonations < ActiveRecord::Migration
  def up
    create_table :donations do |t|
      t.float :amount
      t.integer :donor_id
      t.integer :project_id
    end 
  end
    
    def down 
      drop_table :donations
    end 
      
end
