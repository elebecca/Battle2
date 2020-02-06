feature 'Attacking' do   
    scenario 'Attack Player 2' do
        sign_in_and_play
        click_button 'attack'
        expect(page).to have_content 'Dave attacked Mittens'
      end
  end