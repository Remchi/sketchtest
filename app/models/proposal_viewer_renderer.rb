require 'nokogiri'

class ProposalViewerRenderer
  def self.render(proposal, html = nil)
    html = html || File.read(File.join(Rails.root, 'public', 'proposal-template', 'index.html'))

    html.gsub!('{client_name}', proposal.client.name)
    html.gsub!('{proposal_name}', proposal.name)
    html.gsub!('{proposal_send_date}', proposal.send_date.to_s)
    html.gsub!('{proposal_user_name}', proposal.user_name)
    html.gsub!('{client_company}', proposal.client.company)
    html.gsub!('{client_website}', proposal.client.website)

    html.gsub!('style/', '/proposal-template/style/')
    html.gsub!('images/', '/proposal-template/images/')

    html = Nokogiri::HTML(html)

    proposal_content = html.at_css('#proposal-content')
    proposal_section = html.at_css('#proposal_section').to_html
    proposal_content.content = ""

    proposal.proposal_sections.each do |section|
      node = proposal_section.dup
      node.gsub!('{section_header}', section.name)
      node.gsub!('{section_content}', section.description)
      proposal_content.add_child(node)
    end


    html
  end
end