class Invite < ApplicationRecord
  belongs_to :list
  belongs_to :user

  attr_accessor :email
end
