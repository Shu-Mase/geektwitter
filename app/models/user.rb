class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #追加箇所
  has_many :tweets, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  #追記箇所
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  #ここまで
  #追記箇所
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
  #ここまで
  #以下を追記
  has_many :comments, dependent: :destroy
end