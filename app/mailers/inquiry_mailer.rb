class InquiryMailer < ApplicationMailer
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => '【Snuggle】お問い合わせ完了通知')
  end

  def received_admin_email(inquiry)
    @inquiry = inquiry
    mail(:to => ENV['MY_EMAIL'], :subject => '【Snuggle】お問い合わせ通知')
  end
end
