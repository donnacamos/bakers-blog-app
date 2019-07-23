# Create some seed data to work with and test association 

donna = User.create(name: "Donna", email: "donna@donna.com", password: "password")
bobby = User.create(name: "Bobby", email: "bobby@bobby.com", password: "password") 

# Blogs.create(content: "Today is a lovely day to bake bread.", recipe: "Whole Wheat Bread Loaf", user_id: "donna.id")  
# Blogs.create(content: "I love eating cookies. I will probably die of cookie overdose! Ha ha!", recipe: "Death by Chocolate Cookies", user_id: "bobby.id") 