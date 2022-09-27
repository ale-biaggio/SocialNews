# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

more_posts = [
    {:title => "Farina come back", :tag => "#comeIlFarina", 
    :body => "Farina ritorna con rails a mietere vittime",
    :image => "https://qualcosa.png", :rank => 8},
    {:title => "Farina come back again", :tag => "#comeIlFarina", 
        :body => "Farina ritorna con rails a mietere vittime",
        :image => "https://qualcosa.png", :rank => 8}
]

more_posts.each do |post|
    Post.create!(post) #Non deve essere nullo il campo posto o da errore
end