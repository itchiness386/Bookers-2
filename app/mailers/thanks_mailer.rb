class ThanksMailer < ApplicationMailer

  def signup_mail(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}"
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      from: "no-replay@gmail.com",
      to: @user.email #宛先
    )
  end
end
