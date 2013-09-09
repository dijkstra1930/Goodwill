class Product < ActiveRecord::Base
	has_many :bids 
	has_many :users, :through => :bids
	validates :name, presence: true
	validates :descript, presence: true
	validates_numericality_of :price, :on => :create
end

