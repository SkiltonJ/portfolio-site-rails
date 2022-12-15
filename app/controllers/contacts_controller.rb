class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Message sent! Thankyou for your inquiry'
      redirect_to root_path
    else
      flash.now[:error] = 'Could not send message, please check contact form'
      render 'pages/home', status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
