class Restaurant < ApplicationRecord
  # objects will be destroyed if they're associated with dependent: :destroy,
  # and deleted if they're associated with dependent: :delete_all.
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian) }, presence: true
end
