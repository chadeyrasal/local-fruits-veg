hello = User.create(:username => "hello", :email => "hello@gmail.com", :password => "pwdhello")
hi = User.create(:username => "hi", :email => "hi@gmail.com", :password => "pwdhi")
bonjour = User.create(:username => "bonjour", :email => "bonjour@gmail.com", :password => "pwdbonjour")
bonsoir = User.create(:username => "bonsoir", :email => "bonsoir@gmail.com", :password => "pwdbonsoir")
hallo = User.create(:username => "hallo", :email => "hallo@gmail.com", :password => "pwdhallo")
hola = User.create(:username => "hola", :email => "hola@gmail.com", :password => "pwdhola")
pierre = User.create(:username => "pierre", :email => "pierre@gmail.com", :password => "pwdpierre")
paul = User.create(:username => "paul", :email => "paul@gmail.com", :password => "pwdpaul")
jacques = User.create(:username => "jacques", :email => "jacques@gmail.com", :password => "pwdjacques")
joseph = User.create(:username => "joseph", :email => "joseph@gmail.com", :password => "pwdjoseph")


carotte = Product.create(:name => "carotte", :unit => "bunch", :quantity => 3, :user_id => 1)
celeri = Product.create(:name => "celeri", :unit => "unit", :quantity => 9, :user_id => 3)
leek = Product.create(:name => "leek", :unit => "unit", :quantity => 6, :user_id => 5)
salad = Product.create(:name => "salad", :unit => "unit", :quantity => 8, :user_id => 7)
beetroot = Product.create(:name => "beetroot", :unit => "unit", :quantity => 7, :user_id => pierre.id)
apple = Product.create(:name => "apple", :unit => "kg", :quantity => 5, :user_id => 11)
tomatoe = Product.create(:name => "tomatoe", :unit => "box", :quantity => 3, :user_id => 10)
potatoe = Product.create(:name => "potatoe", :unit => "kg", :quantity => 4, :user_id => 8)
strawberry = Product.create(:name => "strawberry", :unit => "box", :quantity => 5, :user_id => pierre.id)
raspberry = Product.create(:name => "raspberry", :unit => "box", :quantity => 2, :user_id => 4)
blackberry = Product.create(:name => "blackberry", :unit => "box", :quantity => 4, :user_id => 2)
courgette = Product.create(:name => "courgette", :unit => "kg", :quantity => 3, :user_id => joseph.id)
cucumber = Product.create(:name => "cucumber", :unit => "kg", :quantity => 1, :user => jacques)
gherkin = Product.create(:name => "gherkin", :unit => "box", :quantity => 2, :user_id => 5)
basil = Product.create(:name => "basil", :unit => "bunch", :quantity => 1, :user_id => 7)
parsley = Product.create(:name => "parsley", :unit => "bunch", :quantity => 1, :user_id => 9)
oregano = Product.create(:name => "oregano", :unit => "bunch", :quantity => 2, :user_id => 8)
chili = Product.create(:name => "chili", :unit => "g", :quantity => 200, :user_id => 6)
pepper = Product.create(:name => "pepper", :unit => "kg", :quantity => 1, :user_id => 4)
thyme = Product.create(:name => "thyme", :unit => "g", :quantity => 100, :user_id => 2)
bonsoir.products.create(:name => "mint", :unit => "bunch", :quantity => 2)
bonjours_products = bonjour.products.build(:name => "corn", :unit => "unit", :quantity => 4)
bonjours_products.save
