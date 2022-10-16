# frozen_string_literal: true

require 'rails_helper'

describe 'Record not found' do
  it 'visiting post show page with non-existing post id should show "Page not found"', js: true do
    visit post_path(100)

    expect(page).to have_content 'Page not found'
  end
end
