require 'http'

class GoogleNews

    def self.save_posts_from_google
        attempts = 0
        begin
            attempts += 1
            repubblica = HTTP.get("https://newsapi.org/v2/everything?sources=la-repubblica&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            ansa = HTTP.get("https://newsapi.org/v2/everything?sources=ansa&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            #sole24 = HTTP.get("https://newsapi.org/v2/everything?sources=il-sole-24-ore&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            #football = HTTP.get("https://newsapi.org/v2/everything?sources=football-italia&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            bbc = HTTP.get("https://newsapi.org/v2/everything?q=italy&source=bbc-news&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
        
        rescue => e
            if attempts < 10
                #sleep(1)
                retry
            else
                puts e.backtrace
                raise
                return false
            end
        end
        #salvataggio nel db degli articoli di repubblica 
        rep_json = repubblica.parse
        tot_res = rep_json["totalResults"]
        n = 60
        affari, cultura, politica, spettacolo, sport = 0,0,0,0,0
 
        rep_json['articles'].each do |article|
            title = article["title"]
            if !Post.exists?(title: title)
                keyword = article["url"].split("/")[3]
                if (affari < 3 && keyword == "economia")
                    m = Post.new
                    m['user_id'] = 1
                    m['title'] = article["title"]
                    m['category'] = 'Affari'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    affari += 1
                    n -= 3
                end
                if (cultura < 3 && keyword == "cultura")
                    m = Post.new
                    m['user_id'] = 1
                    m['title'] = article["title"]
                    m['category'] = 'Cultura'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    cultura += 1
                    n -= 3
                end
                if (politica < 3 && keyword == "politica")
                    m = Post.new
                    m['user_id'] = 1
                    m['title'] = article["title"]
                    m['category'] = 'Politica'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    politica += 1
                    n -= 3
                end
                if (spettacolo < 3 && keyword == "spettacoli")
                    m = Post.new
                    m['user_id'] = 1
                    m['title'] = article["title"]
                    m['category'] = 'Spettacolo'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    spettacolo += 1
                    n -= 3
                end
                if (sport < 3 && keyword == "sport")
                    m = Post.new
                    m['user_id'] = 1
                    m['title'] = article["title"]
                    m['category'] = 'Sport'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    sport += 1
                    n -= 3
                end
            end
        end


        #salvataggio nel db degli articoli di ansa 
        ansa_json = ansa.parse
        tot_res = ansa_json["totalResults"]
        n = 59
        affari, cultura, politica, sport, tecnologia = 0,0,0,0,0
 
        ansa_json['articles'].each do |article|
            title = article["title"]
            if !Post.exists?(title: title)
                keyword = article["url"].split("/")[5]
                if (affari < 3 && keyword == "economia")
                    m = Post.new
                    m['user_id'] = 2
                    m['title'] = article["title"]
                    m['category'] = 'Affari'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    affari += 1
                    n -= 3
                end
                if (cultura < 3 && keyword == "cultura")
                    m = Post.new
                    m['user_id'] = 2
                    m['title'] = article["title"]
                    m['category'] = 'Cultura'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    cultura += 1
                    n -= 3
                end
                if (politica < 3 && keyword == "politica")
                    m = Post.new
                    m['user_id'] = 2
                    m['title'] = article["title"]
                    m['category'] = 'Politica'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    politica += 1
                    n -= 3
                end
                if (sport < 3 && keyword == "sport")
                    m = Post.new
                    m['user_id'] = 2
                    m['title'] = article["title"]
                    m['category'] = 'Sport'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    sport += 1
                    n -= 3
                end
                if (tecnologia < 3 && keyword == "tecnologia")
                    m = Post.new
                    m['user_id'] = 2
                    m['title'] = article["title"]
                    m['category'] = 'Tecnologia'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    tecnologia += 1
                    n -= 3
                end
            end
        end

        #salvataggio nel db degli articoli di bbc 
        bbc_json = bbc.parse
        tot_res = bbc_json["totalResults"]
        n = 58
        affari, spettacolo, sport, tecnologia = 0,0,0,0
 
        bbc_json['articles'].each do |article|
            title = article["title"]
            if !Post.exists?(title: title)
                keyword = article["url"].split("/")[3]
                if (affari < 3 && keyword == "business")
                    m = Post.new
                    m['user_id'] = 5
                    m['title'] = article["title"]
                    m['category'] = 'Affari'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    affari += 1
                    n -= 3
                end
                if (sport < 3 && keyword == "sports")
                    m = Post.new
                    m['user_id'] = 5
                    m['title'] = article["title"]
                    m['category'] = 'Sport'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    sport += 1
                    n -= 3
                end
                if (tecnologia < 3 && keyword == "technology")
                    m = Post.new
                    m['user_id'] = 5
                    m['title'] = article["title"]
                    m['category'] = 'Tecnologia'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    tecnologia += 1
                    n -= 3
                end
                if (spettacolo < 3 && keyword == "entertainment")
                    m = Post.new
                    m['user_id'] = 5
                    m['title'] = article["title"]
                    m['category'] = 'Spettacolo'
                    m['body'] = article["content"]
                    m['img_test'] = article["urlToImage"]
                    m['rank'] = n
                    m.save!
                    spettacolo += 1
                    n -= 3
                end
            end
        end
    end

end