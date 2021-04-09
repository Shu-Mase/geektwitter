class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  #追記箇所
  validates_uniqueness_of :tweet_id, scope: :user_id
  #ここまで
end
