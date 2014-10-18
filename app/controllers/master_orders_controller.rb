class MasterOrdersController < ApplicationController

	def new
		@master_order = MasterOrder.new
	end
end