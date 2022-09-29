class User < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy

    validates :username, :presence => true, uniqueness: {case_sensitive: false}
    validates :name, :presence => true
    validates :surname, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true
end
