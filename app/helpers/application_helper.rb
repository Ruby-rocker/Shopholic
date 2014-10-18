module ApplicationHelper

	def view_product(id) 
		@product = Product.find(id)
	end

	def view_category
		@categories = Category.all
	end

	def view_brand
		@brands = Brand.all
	end

	def cost_product
		 #@product = Product.all
		 #cost[] = Array.new
		 @cost = ['0-1000' , '1001-2000','2001-5000','5001-10000','10001-20000','20001-700000']
	end

	def find_user(id)
		@user = User.find(id)
	end
end