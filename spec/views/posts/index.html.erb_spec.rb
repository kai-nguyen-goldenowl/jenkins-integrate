# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  before(:each) do
    assign(:posts, [
             Post.create!(
               content: 'Content',
               title: 'Title'
             ),
             Post.create!(
               content: 'Content',
               title: 'Title'
             )
           ])
  end

  it 'renders a list of posts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Content'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
  end
end
