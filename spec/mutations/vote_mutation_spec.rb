# frozen_string_literal: true

require 'rails_helper'

describe Mutations::VoteMutation do
  let(:object) { :not_used }
  let(:user) { create :user, name: 'name' }
  let(:post) { create :post, user: user }

  def call(current_user:, context: {}, **args)
    context = Utils::Context.new(
      query: OpenStruct.new(schema: KittynewsSchema),
      values: context.merge(current_user: current_user),
      object: nil
    )
    described_class.new(object: nil, context: context, field: nil).resolve(args)
  end

  describe '#resolve' do
    it 'creates a vote' do
      result = call(current_user: user, post_id: post.id.to_s)
      expect(result).to eq is_voted: true
    end

    it 'destroys a vote' do
      create :vote, user: user, post: post
      result = call(current_user: user, post_id: post.id.to_s)
      expect(result).to eq is_voted: false
    end

    it "returns errors if post doesn't exist" do
      create :vote, user: user, post: post
      result = call(current_user: user, post_id: 99)

      expect(result[:errors]).to eq(['Post must exist'])
    end
  end
end
