class PromiseMailer < ApplicationMailer
  def creation_confirmation(promise)
    @promise = promise

    mail(
      to: @promise.user.email,
      subject: "New promise created!"
      )
  end
end
