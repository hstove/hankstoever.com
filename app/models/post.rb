class Post < ActiveRecord::Base
  def html
    Bluecloth.new(body).to_html.html_safe
  end
end
