# frozen_string_literal: true

require 'rails_helper'

describe 'Sessions' do
  let!(:user) { create :user, email: 'example@example.com', password: 'password' }

  it 'Signing in and signing out' do
    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    expect(page).to have_content("Hi #{user.name}")

    click_on 'Logout'

    expect(page).not_to have_content("Hi #{user.name}")
  end
end
