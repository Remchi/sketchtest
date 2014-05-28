class ProposalViewerController < ApplicationController

  def show
    proposal = Proposal.includes([:client, :proposal_sections]).find(params[:id])
    render text: ProposalViewerRenderer.render(proposal)
  end

end
