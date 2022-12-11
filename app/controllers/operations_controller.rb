class OperationsController < ApplicationController

    def save_posts
        if GoogleNews.save_posts_from_google
            #@message = 'Succeed'
            #bbc = HTTP.get("https://newsapi.org/v2/everything?q=italy&source=bbc-news&sortBy=popularity&apiKey=5e8be9cf55d3442883b6a248fbc8ab4b")
            #ee = bbc.parse
            #ee['articles'].each do |article|
            #    puts article["url"].split("/").to_s+"\n"
            #end
            #@message=ee["articles"][3]["url"].split("/")#[5]
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