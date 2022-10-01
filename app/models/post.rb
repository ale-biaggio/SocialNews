class Post < ApplicationRecord
    #model validation
<<<<<<< HEAD
=======

>>>>>>> parent of 8a48ee5 (model di user e commenti)
    has_one_attached :image

    validates :title, :presence=> true, length: {in: 2..50 }
    validates :body, :presence=> true, length: {in: 100..1000}
    validates :category, :presence=> true

end
