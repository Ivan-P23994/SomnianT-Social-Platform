require 'rails_helper'

RSpec.describe 'comments/new', type: :view do
  before do
    assign(:comment, Comment.new(
                       author: 'MyString',
                       body: 'MyString'
                     ))
  end

  it 'renders new comment form' do
    render

    assert_select 'form[action=?][method=?]', comments_path, 'post' do
      assert_select 'input[name=?]', 'comment[author]'

      assert_select 'input[name=?]', 'comment[body]'
    end
  end
end
