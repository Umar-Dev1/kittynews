# frozen_string_literal: true

require 'rails_helper'

describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:votes).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:tagline) }
    it { is_expected.to validate_presence_of(:comments_count) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'db_columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:tagline).of_type(:string) }
    it { is_expected.to have_db_column(:url).of_type(:string) }
    it { is_expected.to have_db_column(:comments_count).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end

  describe '.reverse_chronological' do
    it 'returns the posts in reverse chronological order' do
      post1 = create :post, created_at: 2.days.ago
      post2 = create :post, created_at: 1.day.ago

      expect(described_class.reverse_chronological).to eq [post2, post1]
    end
  end
end
