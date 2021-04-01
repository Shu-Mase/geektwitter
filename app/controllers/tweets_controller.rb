class TweetsController < ApplicationController
    #追加箇所
    before_action :authenticate_user!
    #ここまで
    
    def index
        # 追加場所ここから
        @tweets = Tweet.all
        # ここまで
    end

    # 追加場所ここから
    def new
        @tweet = Tweet.new
    end
    # ここまで

    #追加箇所
    def create
        tweet = Tweet.new(tweet_params)

        #追加箇所
        tweet.user_id = current_user.id
        #ここまで

        if tweet.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    # 追記ここから
    def show
        @tweet = Tweet.find(params[:id])
    end
    # ここまで

    # 追記ここから
    def edit
        @tweet = Tweet.find(params[:id])
    end
    # ここまで

    # 追記ここから
    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end
    # ここまで

    # 追加場所ここから
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end
    # ここまで
    
    private
    def tweet_params
        params.require(:tweet).permit(:body)
    end
    #ここまで
end