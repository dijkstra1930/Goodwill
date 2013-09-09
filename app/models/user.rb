class User < ActiveRecord::Base
	has_many :products
	validates :username, :exclusion => { :in => %w(admin superuser) }
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

end
