require 'nokogiri'

class ProposalViewerRenderer
  def self.render(proposal)
    html = File.read(File.join(Rails.root, 'public', 'proposal-template', 'index.html'))

    ProposalViewerRenderer.new(proposal, html).render
  end

  def initialize(proposal, html)
    @proposal = proposal
    @html = html
  end

  def render
    fix_assets
    replace_placeholders
    populate_proposal_section
    @html
  end

  def fix_assets
    @html.gsub!('style/', '/proposal-template/style/')
    @html.gsub!('images/', '/proposal-template/images/')
  end

  def replace_placeholders
    @html.gsub!('{client_name}', @proposal.client.name)
    @html.gsub!('{proposal_name}', @proposal.name)
    @html.gsub!('{proposal_send_date}', @proposal.send_date.to_s)
    @html.gsub!('{proposal_user_name}', @proposal.user_name)
    @html.gsub!('{client_company}', @proposal.client.company)
    @html.gsub!('{client_website}', @proposal.client.website)
  end

  def populate_proposal_section
    @html = Nokogiri::HTML(@html)

    proposal_content = @html.at_css('#proposal-content')
    proposal_section = @html.at_css('#proposal_section').to_html
    proposal_content.content = ""

    @proposal.proposal_sections.each do |section|
      node = proposal_section.dup
      node.gsub!('{section_header}', section.name)
      node.gsub!('{section_content}', section.description)
      proposal_content.add_child(node)
    end
  end
end