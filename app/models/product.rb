class Product < ActiveRecord::Base
	belongs_to :users
	validates :name, presence: true
	validates :descript, presence: true
	validates_numericality_of :price, :on => :create
end
