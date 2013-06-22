module Markdown
  extend self

  def render(markdown)
    parser.render markdown
  end

  private

  def parser
    @parser ||= Redcarpet::Markdown.new(renderer)
  end

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new(filter_html:true, prettify: true)
  end

end
