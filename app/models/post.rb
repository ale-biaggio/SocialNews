class Post < ApplicationRecord
    #model validation
    
    has_many :comments, dependent: :destroy
    
    has_one_attached :image
    
    def self.all_category ; %w[Affari Intrattenimento Politica Salute Spettacolo Sport Tecnologia] ; end
    validates :title, :presence=> true, length: {in: 2..50 }
    validates :body, :presence=> true, length: {in: 100..1000}
    validates :category, :presence=> true, :inclusion => {:in => Post.all_category}

end