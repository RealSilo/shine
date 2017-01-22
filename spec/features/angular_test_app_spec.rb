require 'rails_helper'

feature 'angular test' do
  let(:email) { 'pat@example.com' }
  let(:password) { 'password123' }

  before do
    User.create!(email: email,
                 password: password,
                 password_confirmation: password)
  end

  scenario 'angular test app is working' do
    visit '/angular_test'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'

    expect(page).to have_content('Name')

    fill_in 'name', with: 'Pat'
    within 'h2' do
      expect(page).to have_content('Hello Pat')
    end
  end
end
