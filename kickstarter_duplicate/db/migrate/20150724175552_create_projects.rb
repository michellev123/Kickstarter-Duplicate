class CreateProjects < ActiveRecord::Migration
  def up 
    create_table :projects do |t|
      t.integer :project_id
      t.integer :donor_id
      t.string :genre 
      t.string :title
      t.float :goal
      t.string :image_file
      t.string :description 
      t.string :location
      t.integer :duration
      
    
      
      
    end 
  end
  
  def down 
    drop_table :projects
  end 
end

