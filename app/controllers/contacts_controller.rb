class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Message sent!'
      redirect_to root_path
    else
      flash[:error] = 'Could not send message'
      render 'pages/home', status: :unprocessable_entity
    end
  end
end
