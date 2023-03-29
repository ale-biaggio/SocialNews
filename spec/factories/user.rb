FactoryBot.define do
    factory :user1, class: User do
        name {"La Repubblica"}
        surname {""} 
        username {"La Repubblica"}
        email {"larepubblica@gmail.com"}
        password {"password"}
    
        after(:create) { |user1| user1.confirm }
    end
    factory :user2, class: User do
        name {"Ansa"} 
        surname {""}
        username  {"Ansa"}
        email {"ansa@gmail.com"}
        password {"password"}

        after(:create) { |user2| user2.confirm }
    end
    factory :user3, class: User do
        name {"Il Sole 24 Ore"} 
        surname {""}
        username  {"Il Sole 24 Ore"}
        email {"ilsole24ore@gmail.com"}
        password {"password"}

        after(:create) { |user3| user3.confirm }
    end
    factory :user4, class: User do
        name {"Football Italia"} 
        surname {""} 
        username  {"Football Italia"}
        email {"footballitalia@gmail.com"}
        password {"password"}

        after(:create) { |user4| user4.confirm }
    end
    factory :user5, class: User do
        name {"BBC News"} 
        surname {""}
        username  {"BBC News"}
        email {"bbcnews@gmail.com"}
        password {"password"}

        after(:create) { |user5| user5.confirm }
    end
    factory :user6, class: User do
        name {"nome_prova"} 
        surname {""} 
        username  {"utente_prova"}
        email {"11@1"}
        password {"123456"}

        after(:create) { |user6| user6.confirm }
    end
    factory :user7, class: User do
    name { "Mario" }
    email { "test@example.com" }
    password { "password" }

    after(:create) { |user7| user7.confirm }
    end
    factory :user8, class: User do
        name {"admin"} 
        surname {""} 
        username  {"admin"}
        email {"admin@gmail.com"}
        password {"123456"}

        after(:create) { |user8| user8.confirm }
    end
    factory :user9, class: User do
        name {"Il Fatto Quotidiano"} 
        surname {""} 
        username  {"Il Fatto Quotidiano"}
        email {"ilfattoquotidiano@gmail.com"}
        password {"123456"}
 
        after(:create) { |user9| user9.confirm }
    end
end

 