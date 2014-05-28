require 'spec_helper'

describe ProposalViewerRenderer do
  let(:proposal) { build(:proposal)}

  describe "replacing placeholders" do
    it "replaces client_name placeholder" do
      html = "<p>{client_name}</p>"
      expect(ProposalViewerRenderer.render(proposal, html)).to eq("<p>Doe</p>")
    end
    it "replaces proposal_name placeholder" do
      html = "<p>{proposal_name}</p>"
      expect(ProposalViewerRenderer.render(proposal, html)).to eq("<p>redesign</p>")
    end
    it "replaces proposal_send_date placeholder" do
      html = "<p>{proposal_send_date}</p>"
      expect(ProposalViewerRenderer.render(proposal, html)).to eq("<p>2014-01-01</p>")
    end
    it "replaces proposal_user_name placeholder" do
      html = "<p>{proposal_user_name}</p>"
      expect(ProposalViewerRenderer.render(proposal, html)).to eq("<p>Joe</p>")
    end
    it "replaces client_company placeholder" do
      html = "<p>{client_company}</p>"
      expect(ProposalViewerRenderer.render(proposal, html)).to eq("<p>Apple</p>")
    end
    it "replaces client_website placeholder" do
      html = "<p>{client_website}</p>"
      expect(ProposalViewerRenderer.render(proposal, html)).to eq("<p>http://www.apple.com</p>")
    end
  end
end