class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :posts do |t| 
      t.string :content  
      t.string :recipes 
      t.integer :user_id 
      
      t.timestamp null: false 
    end 
  end
end
