class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
