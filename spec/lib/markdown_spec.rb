require 'spec_helper'

describe Markdown do
  it 'renders markdown' do
    Markdown.render("Hello, *cat*").should eq "<p>Hello, <em>cat</em></p>\n"
  end
end
