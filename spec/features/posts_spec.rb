# frozen_string_literal: true

require 'rails_helper'

describe 'Posts' do
  it 'Displaying the posts on the homepage', js: true do
    post1 = create :post
    post2 = create :post

    visit root_path

    expect(page).to have_content post1.title
    expect(page).to have_content post2.title
  end

  it 'Displaying the post detail page', js: true do
    post = create :post

    visit root_path
    click_on post.title

    expect(page).to have_content 'comments'
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.tagline)
  end
end
