class TweetsController < ApplicationController
    #追加箇所
    before_action :authenticate_user!
    #ここまで
    
    def index
        if params[:search] == nil
            @tweets= Tweet.all.page(params[:page]).per(3)
        elsif params[:search] == ''
            @tweets= Tweet.all.page(params[:page]).per(3)
        else
            #部分検索
            @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
        end
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
        
        @comments = @tweet.comments
        @comment = Comment.new
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
        params.require(:tweet).permit(:body, :image)
    end
    #ここまで
end