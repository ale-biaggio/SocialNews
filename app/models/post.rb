class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    belongs_to :user
    has_one_attached :image
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end
    def disliked?(user)
        !!self.dislikes.find{|dislike| dislike.user_id == user.id}
    end
    def favorited?(user)
        !!self.favorites.find{|favorite| favorite.user_id == user.id}
    end
    def self.all_category ; %w[Affari Cultura Politica Salute Spettacolo Sport Tecnologia] ; end
    validates :title, :presence=> true, length: {in: 2..150 }
    #validates :body, :presence=> true, length: {in: 100..1000}
    validates :category, :presence=> true, :inclusion => {:in => Post.all_category}

    def self.search(search)
       where("category LIKE ?", "%#{search}%")
    end

end