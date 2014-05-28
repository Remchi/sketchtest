require 'spec_helper'

feature 'Proposal Viewer page' do
  before do
    create(:proposal)
  end

  after do
    Client.destroy_all
  end

  scenario "renders information about proposal and client" do
    visit('/proposal_viewer/show/1')
    expect(page).to have_content('redesign')
    expect(page).to have_content('Joe')
    expect(page).to have_content('2014-01-01')
    expect(page).to have_content('Doe')
    expect(page).to have_content('Apple')
    expect(page).to have_content('http://www.apple.com')
  end

  scenario "renders several proposal sections" do
    visit('/proposal_viewer/show/1')
    expect(page.all('#proposal-content > div').length).to eq(4)
  end


end