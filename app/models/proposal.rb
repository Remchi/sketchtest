class Proposal < ActiveRecord::Base
  
  belongs_to :client
  has_many :proposal_sections, :dependent => :destroy
  
end
