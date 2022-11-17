require 'http'

class GoogleNews

    def self.save_posts_from_google
        attempts = 0
        begin
            attempts += 1

            response = HTTP.get("https://newsapi.org/v2/everything?q=farina&from=2022-11-17&sortBy=popularity&apiKey=4d5c3cbe2fd54b948ccabe755b9d6d38")
        
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


        p=response.parse
        m = Post.new
        m['user_id']=1
        m['title']=p['articles'][1]['title']
        m['category']='Salute'
        m['body']=p['articles'][1]['content']
        m.save!
        return true
    end

end