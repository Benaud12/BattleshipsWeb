require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Can enter my name' do
    visit '/New_Game'
    fill_in('name', :with => 'Billy')
    click_button 'Enter'
    expect(page).to have_content "Welcome to the game Billy!"
  end

  scenario 'Needs an actual name to be given' do
    visit '/New_Game'
    fill_in('name', :with => '')
    click_button 'Enter'
    expect(page).to have_content "No name received, please try again."
  end
  scenario 'link to re-enter name' do
    visit '/New_Game'
    fill_in('name', :with => '')
    click_button 'Enter'
    expect(page.find_link('Try again').visible?).to be true
  end
end
