# Unique header generation
require 'middleman-core/renderers/redcarpet'
require 'digest'
class UniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @head_count = {}
  end

  def header(text, header_level)
    friendly_text = text.gsub(/<[^>]*>/, '').parameterize
    if friendly_text.strip.length == 0
      # Looks like parameterize removed the whole thing! It removes many unicode
      # characters like Chinese and Russian. To get a unique URL, let's just
      # URI escape the whole header
      friendly_text = Digest::SHA1.hexdigest(text)[0, 10]
    end
    @head_count[friendly_text] ||= 0
    @head_count[friendly_text] += 1
    friendly_text += "-#{@head_count[friendly_text]}" if @head_count[friendly_text] > 1
    "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end

  def preprocess(full_document)
    full_document = super(full_document) if defined?(super)
    ERB.new(full_document).result(binding)
  end

  def url_generation(verb, path, highlight: true)
    return "\`#{verb.upcase} #{ENV['BASE_URL']}#{path}\`" if highlight

    "#{ENV['BASE_URL']}#{path}"
  end

  def badge(id, name, value, color)
    "[![#{id}](https://img.shields.io/badge/#{name}-#{value}-#{color}.svg)](https://app.airjobmanager.com/)"
  end
end
