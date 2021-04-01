class Tweet < ApplicationRecord
  #追加箇所
  #アソシエーション(1:多)
  belongs_to :user
  #ここまで
end
