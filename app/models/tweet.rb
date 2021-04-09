class Tweet < ApplicationRecord
    #追加箇所
    #アソシエーション(1:多)
    belongs_to :user
    #ここまで
    # 追記ここから
    mount_uploader :image, ImageUploader
    # 追記ここまで
    #追記箇所
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    #ここまで
    #以下を追記
    has_many :comments, dependent: :destroy
end
