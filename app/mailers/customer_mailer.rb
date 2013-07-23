class CustomerMailer < ActionMailer::Base
  default from: "hank.stoever@gmail.com"
  default bcc: "hstove@gmail.com"
  add_template_helper(ApplicationHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer.digest.subject
  #
  def digest email, posts=Post.for_digest
    @greeting = "monthly digest from hankstoever.com"
    @email = email
    @posts = posts

    mail to: email, subject: @greeting
  end
end
