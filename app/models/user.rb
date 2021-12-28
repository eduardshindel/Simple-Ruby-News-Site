class User < ApplicationRecord
  has_secure_password

  validates :name, :presence => true, :length => { :in => 3..20 }
  validates :password, :presence => true, :length => { :in => 3..20 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
