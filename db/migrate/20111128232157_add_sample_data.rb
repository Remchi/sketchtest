class AddSampleData < ActiveRecord::Migration
  def self.up
    
    client = Client.new
    client.name = "Duke Pete"
    client.company = "Earthlingworks Inc."
    client.website = "http://www.google.com/"
    client.save
    
    proposal = Proposal.new
    proposal.client = client
    proposal.name = "Website Redesign"
    proposal.user_name = "James Snoop"
    proposal.send_date = DateTime.now

    [['Name 1', 'Description for #1'], ['Name 2', 'Description for #2'], ['Name 3', 'Description for #3']].each do |c|
      proposal_section = ProposalSection.new
      proposal_section.name = c.first
      proposal_section.description = c.last
      proposal.proposal_sections << proposal_section
    end
    
    proposal.save
    
  end

  def self.down
    Client.all.each{|c| c.destroy }
  end
end
