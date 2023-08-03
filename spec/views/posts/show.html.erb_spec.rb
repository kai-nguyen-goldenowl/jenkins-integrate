# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  before(:each) do
    assign(:post, Post.create!(
                    content: 'Content',
                    title: 'Title'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Title/)
  end
end
