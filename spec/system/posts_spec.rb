require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Post creation' do
    it 'Prompts post creation modal' do
    end

    it 'Creates post when post is valid' do
    end

    it 'Does not create post when post is not valid' do
    end

  end

  describe 'Post editing' do
    it 'Prompts turbo_frame replacement when edit is clicked' do
    end

    it 'Edits post when post is valid' do
    end

    it 'Edits post when post is not valid' do
    end
  end

  describe 'Post delete' do
    it 'Prompts turbo_frame replacement when delete is clicked' do
    end
  end
end
