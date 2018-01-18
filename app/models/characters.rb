class Character < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :race, :char_class
end
