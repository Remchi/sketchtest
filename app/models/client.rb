class Client < ActiveRecord::Base
  has_many :proposals, :dependent => :destroy
  
end
