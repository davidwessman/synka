class PasswordMailer < Clearance::ClearanceMailer
  include Roadie::Rails::Automatic
  default(from: "Synka <david@wessman.co>")
  layout("mailer")
  helper(EmailHelper)

  def change_password(user)
    @user = user
    ApplicationMailer.new.send(:set_message_id)
    mail(
      from: Clearance.configuration.mailer_sender,
      to: @user.email,
      subject: I18n.t(
        :change_password,
        scope: [:clearance, :models, :clearance_mailer]
      ),
    )
  end
end
