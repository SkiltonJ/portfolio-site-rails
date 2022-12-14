class Contact < MailForm::Base
  attribute :name
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :message
  attribute :nickname, captcha: true
  validates :name, presence: true
  validates :message, presence: true

  def headers
    { to: "jackson.jaensch14@gmail.com",
      subject: "Portfolio Inquiry",
      from: "#{name} #{email}" }
  end
end
