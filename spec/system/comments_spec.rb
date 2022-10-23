require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Comment creation' do
    it 'Prompts comment creation modal' do
    end

    it 'Creates comment when comment is valid' do
    end

    it 'Does not create comment when comment is not valid' do
    end
  end

  describe 'Comment editing' do
    it 'Prompts turbo_frame replacement when edit is clicked' do
    end

    it 'Edits comment when comment is valid' do
    end

    it 'Edits comment when comment is not valid' do
    end
  end

  describe 'Comment delete' do
    it 'Prompts turbo_frame replacement when delete is clicked' do
    end
  end
end
