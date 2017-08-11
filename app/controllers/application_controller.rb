class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :default_metas

	def default_metas
		@metas = helpers.default_meta
	end

end
