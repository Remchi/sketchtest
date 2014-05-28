class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.string          :name                
      t.string          :user_name           
      t.date            :send_date             
      t.integer         :client_id          
      t.timestamps
    end
  end

  def self.down
    drop_table :proposals
  end
end


