# frozen_string_literal: true

require 'rails_helper'

def log_in
  user = create :user, email: 'example@example.com', password: 'password'
  visit new_user_session_path

  fill_in 'Email', with: 'example@example.com'
  fill_in 'Password', with: 'password'
  click_on 'Log in'

  expect(page).to have_content("Hi #{user.name}")
end

describe 'Votes' do
  describe '#index page' do
    before do
      create_list :post, 10
    end

    context 'when not logged in' do
      it 'Adding vote to a post should redirect to login page', js: true do
        post = create :post

        visit root_path

        find("button[data-id=\"#{post.id}\"]").click
        expect(page).to have_current_path(new_user_session_path)
        expect(page).to have_content 'Log in'
      end
    end

    context 'when logged in' do
      it 'Adding vote to a post should increment the votes count', js: true do
        post = create :post
        log_in
        visit root_path

        expect(post.votes.count).to eq(0)
        expect(page).to have_selector(:button, '0')
        find("button[data-id=\"#{post.id}\"]").click
        expect(page).to have_selector(:button, '1')
        expect(post.votes.count).to eq(1)
      end
    end
  end

  describe '#show page' do
    context 'when not logged in' do
      it 'Adding vote to a post should redirect to login page', js: true do
        post = create :post

        visit post_path(post.id)

        find("button[data-id=\"#{post.id}\"]").click
        expect(page).to have_current_path(new_user_session_path)
        expect(page).to have_content 'Log in'
      end
    end

    context 'when logged in' do
      it 'Adding vote to a post should increment the votes count', js: true do
        post = create :post
        log_in
        visit post_path(post.id)

        expect(post.votes.count).to eq(0)
        expect(page).to have_selector(:button, '0')
        find("button[data-id=\"#{post.id}\"]").click
        expect(page).to have_selector(:button, '1')
        expect(post.votes.count).to eq(1)
      end
    end
  end
end
