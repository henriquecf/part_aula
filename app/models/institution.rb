class Institution < ActiveRecord::Base
  validates :name, presence: true
end
