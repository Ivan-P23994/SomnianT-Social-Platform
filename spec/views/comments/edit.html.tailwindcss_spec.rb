require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  before do
    @comment = assign(:comment, Comment.create!(
                                  author: 'MyString',
                                  body: 'MyString'
                                ))
  end

  it 'renders the edit comment form' do
    render

    assert_select 'form[action=?][method=?]', comment_path(@comment), 'post' do
      assert_select 'input[name=?]', 'comment[author]'

      assert_select 'input[name=?]', 'comment[body]'
    end
  end
end
