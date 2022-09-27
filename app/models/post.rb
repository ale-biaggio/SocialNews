class Post < ApplicationRecord
    #model validation

    validates :title, :presence=> true, length: {in: 2..50 }
    validates :body, presence=> true, length: {in: 100..1000}

end
