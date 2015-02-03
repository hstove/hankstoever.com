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

  def project_thumb name, url, image, description=nil
    locals = { name: name, url: url, description: description, image: image }
    render partial: 'pages/project', locals: locals
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text).html_safe
    # markdown = GitHub::Markup.render("r.md", text).html_safe
  end

  def rand_nums min, max, count=10
    nums = []
    count.times do
      nums << rand(min..max).round(2)
    end
    nums
  end

  def hn_ad
    unless params['hn'] #|| Rails.env.development?
      return ""
    end
    message = "You might like #{link_to "hnbuffer", "http://hnbuffer.com"}, a service for posting to hacker news at the perfect time.".html_safe
    content_tag(:p, message, class: 'highlight')
  end

  def bitcoin_ad
    banner = "I made a course about #{link_to "running your own bitcoin arbitrage bot", btc_path, target: "_blank"}."
    banner += " It's based off my open source project, #{link_to 'rbtc_arbitrage', "https://github.com/hstove/rbtc_arbitrage"}."
    banner += content_tag :strong, " 50% off until May 1st!"
    bg_color = ab_test "ad_background_color","143,172,104", "205,215,182", "251,184,41", "211,25,150", "22,147,165"
    content_tag(:p, banner.html_safe, class: 'highlight', style: "background-color: rgba(#{bg_color},0.3)")
  end
end
