class User < ApplicationRecord
  validates :name, presence: true, length: { in: 3..20 }
  validates :password, presence: true, length: { in: 20..40 }
end
