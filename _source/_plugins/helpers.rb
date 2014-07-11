module Jekyll
  class ProgressTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      _, @topic, @percent = *text.match(/(\D*)\s(\d+)/)
    end
    require "kramdown"
    def render(context)
      <<-PROGRESS
<div class="progress">
<div class="bar" style="width: #{@percent}%;">#{@topic}</div>
</div>
      PROGRESS
    end
  end
end
Liquid::Template.register_tag('progress', Jekyll::ProgressTag)