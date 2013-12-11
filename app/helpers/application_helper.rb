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
    # unless params['btc'] #|| Rails.env.development?
    #   return ""
    # end
    message = "I'm #{link_to "crowdfunding a course", "https://uludum.org/funds/2", target: "_blank"}"
    message += " about creating a bitcoin arbitrage bot. Pre-order the online course for just $10.00."
    content_tag(:p, message.html_safe, class: 'highlight')
  end
end
