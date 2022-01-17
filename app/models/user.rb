class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :fishes, dependent: :destroy
  has_many :fish_comments, dependent: :destroy
  has_many :fish_favorites, dependent: :destroy

  # フォローをした、されたの関係/class_name: "Relationship"でRelationshipテーブルを参照/foreign_key(外侮キー)で参照するカラムを指定しています
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # フォロー・フォロワーの一覧画面で、user.followersという記述でフォロワーを表示したいので、throughでスルーするテーブル、sourceで参照するカラムを指定。

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end






  attachment :profile_image, destroy: false
end
