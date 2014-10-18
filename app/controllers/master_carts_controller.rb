class MasterCartsController < ApplicationController
	def show
		@master_cart = MasterCart.new
		@masteruser = current_user.id
	end
end
