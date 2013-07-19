class Post < ActiveRecord::Base
  def html
    Bluecloth.new(body).to_html.html_safe
  end

  def to_param
    "#{id}-#{slug}"
  end

  def preview
    index = body.index("\n")
    index.nil? ? body : body[0...index]
  end

  def slug(param=self.title)

    # strip the string
    ret = param.strip

    #blow away apostrophes
    ret.gsub! /['`]/, ""
    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "
    # replace all non alphanumeric, periods with dash
    ret.gsub! /\s*[^A-Za-z0-9\.]\s*/, '-'
    # replace underscore with dash
    ret.gsub! /[-_]{2,}/, '-'
    # convert double dashes to single
    ret.gsub! /-+/, "-"
    # strip off leading/trailing dash
    ret.gsub! /\A[-\.]+|[-\.]+\z/, ""
    ret.gsub! ".", "-"
    ret
  end
end
