module ApplicationHelper
  def link name, template=nil
    template ||= name.to_s.downcase.to_sym
    html = content_tag :p, class: "link" do
      link_to name.to_s.titleize, page_path(template: template)
    end
  end

  def project name, url, description=nil
    html = content_tag :p, class: "project" do
      repo = Octokit::Repository.from_url(url)
      inner = link_to name, url, target: '_blank'
      unless description.nil?
        inner << content_tag(:span, (" - " + description).html_safe)
      end
      inner
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end

  def rand_nums min, max, count=10
    nums = []
    count.times do
      nums << rand(min..max).round(2)
    end
    nums
  end

  def hn_ad
    # unless Rails.env.development? && params['hn']
    #   return "" unless !request.referer.blank? && request.referer.include?("ycombinator")
    # end
    message = "You might like #{link_to "hnbuffer", "http://hnbuffer.com"}, a service for posting to hacker news at the perfect time.".html_safe
    content_tag(:p, message, class: 'highlight')
  end

  def to_slug(param=self.slug)

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

    ret
  end
end
