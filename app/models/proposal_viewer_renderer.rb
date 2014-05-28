class ProposalViewerRenderer
  def self.render(proposal, html = nil)
    html = html || File.read(File.join(Rails.root, 'public', 'proposal-template', 'index.html'))

    html.gsub!('{client_name}', proposal.client.name)
    html.gsub!('{proposal_name}', proposal.name)
    html.gsub!('{proposal_send_date}', proposal.send_date.to_s)
    html.gsub!('{proposal_user_name}', proposal.user_name)
    html.gsub!('{client_company}', proposal.client.company)
    html.gsub!('{client_website}', proposal.client.website)

    html
  end
end