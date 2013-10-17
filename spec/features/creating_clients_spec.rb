#require 'rspec'
require 'spec_helper'

#describe 'Creating Clients' do
feature 'Creating Clients' do

#  it 'should can create a client' do
  scenario 'should can create a client' do
    visit '/'

    click_link 'New Client'

    fill_in 'Name', with: 'TextMate 2'
    click_button 'Create Client'

    expect(page).to have_content('Client has been created.')

    #To change this template use File | Settings | File Templates.
#    true.should == false
  end
end