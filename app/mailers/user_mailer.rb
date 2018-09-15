class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(current_user, order)
    @user = current_user
    @order = order
    mail(to: @user.email, subject: "Thanks for ordering! Here's your receipt and order number: #{@order.id}.")
  end

end
