class User < ApplicationRecord

  validates :name, presence: true, length: { in: 3..20 }
  validates :password, presence: true, length: { in: 20..40 }

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
