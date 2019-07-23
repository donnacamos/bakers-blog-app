class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :posts  
      t.string :recipe 
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
