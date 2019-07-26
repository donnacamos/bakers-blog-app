User.create(name: "Donna", email: "donna@donna.com", password: "mysecretpassword") 
User.create(name: "Stephen", email: "stephen@stephen.com", password: "myevensecreterpassword")

Blogs.create(posts: "Baking Bread", recipes: "Whole Wheat Bread", user_id: donna.id) 
Blogs.create(posts: "How To Die From Overexposure to Chocolate", recipes: "Death By Chocolate Cookies", user_id: stephen.id )  

donna.blogs.create(posts: "Unhappy? Try cheesecake!") 

stephens_entry = stephen.blogs.build(posts: "Sourdough is My Life.") 
stephens_entry.save 