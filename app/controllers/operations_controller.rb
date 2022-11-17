class OperationsController < ApplicationController

    def save_posts
        if GoogleNews.save_posts_from_google
            @message = 'Succeed'
        else
            @message = 'Failed'
        end
    end

    def bootstrap
    end
end