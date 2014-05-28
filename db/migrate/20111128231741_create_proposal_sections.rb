class CreateProposalSections < ActiveRecord::Migration
  def self.up
    create_table :proposal_sections do |t|
      t.string      :name    
      t.text        :description   
      t.integer     :proposal_id   
      t.timestamps
    end
  end

  def self.down
    drop_table :proposal_sections
  end
end
