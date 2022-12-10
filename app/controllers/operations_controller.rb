class OperationsController < ApplicationController

    def save_posts
        if GoogleNews.save_posts_from_google
            @message = 'Succeed'
            #repubblica = HTTP.get("https://newsapi.org/v2/everything?sources=la-repubblica&sortBy=publishedAt&apiKey=4d5c3cbe2fd54b948ccabe755b9d6d38")
            #@message = repubblica.parse
            ###@message=ee["articles"]#[n]["url"].split("/")[3]
            #@len = @message["totalResults"]
            #@message['articles'].each do |article|
            #    puts article
            #end
        else
            @message = 'Failed'
        end
    end

    def bootstrap
    end
end