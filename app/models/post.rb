class Post < ActiveRecord::Base
  scope :for_digest, -> { where("created_at > ?", 1.month.ago) }
  default_scope -> { order("created_at desc") }
  def html
    Maruku.new(body).to_html.html_safe
  end

  def to_param
    "#{id}-#{slug}"
  end

  def preview
    index = body.index("\n")
    string = index.nil? ? body : body[0...index]
    string += "\n\n\n<small>(Continued)</small>"
  end

  def self.by_week
    order('created_at asc').group_by(&:week)
  end

  def self.word_counts
    weeks = {}
    by_week.each do |week, posts|
      weeks[week] = posts.collect(&:word_count).inject{|sum, count| sum += count }
    end
    weeks
  end

  def week
    created_at.beginning_of_week
  end

  def word_count
    body.split.size
  end

  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
    Rails.cache.write(view_cache_title, self.views)
  end

  def view_cache_title
    "posts_#{self.id}_views"
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

  # adapted from:
  # http://insideintercom.io/machine-learning-way-easier-than-it-looks/
  def similar
    title_keywords = self.title.split(' ')
    posts = Post.all.to_a.sort do |post1, post2|
      post1_title_intersection = post1.body.split(' ') & title_keywords
      post2_title_intersection = post2.body.split(' ') & title_keywords

      post2_title_intersection.length <=> post1_title_intersection.length
    end
    posts.delete self
    posts[0..4].shuffle[0..1]
  end

  # Returns estimated minutes to read a post
  def reading_time
    word_count / 200
  end

  def creation_date
    posted_at || created_at
  end

end
