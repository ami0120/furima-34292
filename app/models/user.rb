class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' } do
  validates :first_name
  validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width characters' } do
  validates :first_ruby
  validates :last_ruby
  end
  validates :birthday, presence: true

end
