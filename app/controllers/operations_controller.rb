class OperationsController < ApplicationController

    def save_posts
        if GoogleNews.save_posts_from_google
            @message = 'Succeed'
            #repubblica = HTTP.get("https://newsapi.org/v2/everything?sources=la-repubblica&sortBy=popularity&apiKey=4d5c3cbe2fd54b948ccabe755b9d6d38")
            #ee = repubblica.parse
            #n=0
            #while n<1000
            #    @message=ee["articles"]#[n]["url"].split("/")[3]
            #    puts @message
            #    n += 1
            #end
            ##@message=ee
            ##puts @message
        else
            @message = 'Failed'
        end
    end

    def bootstrap
    end
end