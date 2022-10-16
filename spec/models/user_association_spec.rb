# frozen_string_literal: true

require 'rails_helper'

describe UserAssociation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:followed_by_user).class_name('User') }
    it { is_expected.to belong_to(:following_user).class_name('User') }
  end

  describe 'db_columns' do
    it { is_expected.to have_db_column(:following_user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:followed_by_user_id).of_type(:integer) }
  end
end
