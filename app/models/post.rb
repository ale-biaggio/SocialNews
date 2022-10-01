class Post < ApplicationRecord
    #model validation
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    has_one_attached :image

    validates :title, :presence=> true, length: {in: 2..50 }
    validates :body, :presence=> true, length: {in: 100..1000}
    validates :category, :presence=> true

end
