class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t| 
      t.string :posts 
      t.string :recipes 
      t.integer :user_id 
      
      t.timestamp null: false 
    end 
  end
end
