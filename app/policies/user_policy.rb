class UserPolicy < ApplicationPolicy
	def create?
		@user.admin?
	end

	def create_user?
		if user.present?
			@user.admin?
		end
		@user.admin?
	end

end
