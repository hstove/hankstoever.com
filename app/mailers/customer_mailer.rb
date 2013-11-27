class CustomerMailer < ActionMailer::Base
  default from: "hank.stoever@gmail.com"
  add_template_helper(ApplicationHelper)

  def digest email, posts=Post.for_digest
    @greeting = "monthly digest from hankstoever.com"
    @email = email
    @posts = posts

    unless @posts.blank?
      mail to: email, subject: @greeting
    end
  end

  def new_customer email
    @email = email
    mail to: "hstove@gmail.com", subject: "You have a new customer."
  end

  def bitcoin_class email
    mail to: email, subject: "Build your own bitcoin arbitrage bot"
  end

end
