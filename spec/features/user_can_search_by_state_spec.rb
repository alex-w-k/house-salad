require 'rails_helper'

describe 'A user can find house of representative members by state' do
  describe 'A user selects a state from the drop down and presses locate members of the house' do
    it 'returns a list of members of the house by selected state' do
      visit root_path

      select 'Colorado', from: 'state'
      click_button('Locate Members of the House')
      expect(page).to have_content('State Representitives For Colorado')
      expect(page).to have_content('There are 7 results')
    end
  end
end
