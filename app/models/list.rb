class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :invites
  has_many :users, through: :invites

  validates :name, presence: true, uniqueness: true
end
