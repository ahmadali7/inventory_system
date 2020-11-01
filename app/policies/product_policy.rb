class ProductPolicy < ApplicationPolicy
  def index?
    @user.admin?
  end
  def new?
    if user.present?
      !@user.buyer?
    end
  end
  
  def edit?
    if user.present?
      if !@user.buyer?
        true
      else
        false
      end
    end
  end 
  def destroy?
    if user.present?
      !@user.buyer?
    end
  end

end
