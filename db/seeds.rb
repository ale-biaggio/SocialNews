more_users = [
    {
    :name => "aaaaaaaaa", 
    :surname => "ermatto", 
    :username => "ajeje",
    :email => "ddddddd@gmail",
    :password => "peccatidigola",
    :phone => "666"
    }
]

more_users.each do |user|
    User.create!(user) #Non deve essere nullo il campo posto o da errore
end

more_posts = [
    {
    :title => "Farina come back", 
    :category => "Intrattenimento", 
    :body => "Farina ritorna con rails a mietere vittimeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
    :rank => 8
    }
]

more_posts.each do |post|
    Post.create!(post) #Non deve essere nullo il campo posto o da errore
end

more_comments = [
    {
    :body => "Farina00", 
    :like => 3 
    }
]

more_comments.each do |comment|
    Comment.create!(comment) #Non deve essere nullo il campo posto o da errore
end


post_counter = Post.all.size
user_counter = User.all.size
more_comments.each do |comment|
  r = Comment.new(comment)
  r.post = Post.find(rand(1..post_counter))
  r.user = User.find(rand(1..user_counter))
  r.save
end