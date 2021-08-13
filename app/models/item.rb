class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user
  has_many :users, through: :lists

  validates :title, :quantity, presence: true
  # validates :status, default: false

end
