require 'http'

class GoogleNews

    def self.save_posts_from_google
        attempts = 0
        begin
            attempts += 1
            repubblica = HTTP.get("https://newsapi.org/v2/everything?sources=la-repubblica&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            ansa = HTTP.get("https://newsapi.org/v2/everything?sources=ansa&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            sole24 = HTTP.get("https://newsapi.org/v2/everything?sources=il-sole-24-ore&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            football = HTTP.get("https://newsapi.org/v2/everything?sources=football-italia&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
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
       n = 18
       affari, intrattenimento, politica, spettacolo, sport = 0,0,0,0,0

       rep_json['articles'].each do |article|
           keyword = article["url"].split("/")[3]
           if (affari < 3 && keyword == "economia")
               m = Post.new
               m['user_id'] = 1
               m['title'] = article["title"]
               m['category'] = 'Affari'
               m['body'] = article["content"]
               m['rank'] = n
               m.save!
               affari += 1
           end
           if (intrattenimento < 3 && keyword == "cultura")
               m = Post.new
               m['user_id'] = 1
               m['title'] = article["title"]
               m['category'] = 'Intrattenimento'
               m['body'] = article["content"]
               m['rank'] = n
               m.save!
               intrattenimento += 1
           end
           if (politica < 3 && keyword == "politica")
               m = Post.new
               m['user_id'] = 1
               m['title'] = article["title"]
               m['category'] = 'Politica'
               m['body'] = article["content"]
               m['rank'] = n
               m.save!
               politica += 1
           end
           if (spettacolo < 3 && keyword == "spettacoli")
               m = Post.new
               m['user_id'] = 1
               m['title'] = article["title"]
               m['category'] = 'Spettacolo'
               m['body'] = article["content"]
               m['rank'] = n
               m.save!
               spettacolo += 1
           end
           if (sport < 3 && keyword == "sport")
               m = Post.new
               m['user_id'] = 1
               m['title'] = article["title"]
               m['category'] = 'Sport'
               m['body'] = article["content"]
               m['rank'] = n
               m.save!
               sport += 1
           end
           n -= 1
       end
        return true
    end

end