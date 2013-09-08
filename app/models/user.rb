class User < ActiveRecord::Base
	has_many :bids
	has_many :products, :through => :bids
	validates :username, :exclusion => { :in => %w(admin superuser) }
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
	
end
