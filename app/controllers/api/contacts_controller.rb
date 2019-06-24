class Api::ContactsController < ApplicationController
  def index
    if current_user
      @contacts = current_user.Contact.all
    # @contacts = Contact.all
      render 'index.json.jbuilder'
    else
      render json: [message: "You are not logged in you can't view your contacts!"]
    end
  end

  def create
    @contact = Contact.new (
                            name: params[:name],
                            picture: params[:picture],
                            email: params[:email],
                            phone_number: params[:phone_number],
                            guardian_id: current_user.id
                            )
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.name = params[:name] || @contact.name
    @contact.picture = params[:picture] || @contact.picture
    @contact.email = params[:contact] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.guardian_id = params[:guardian_id] || @contact.guardian_id

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {message: @contact.errors.full_messages}
    end

  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "You have successfully deleted the contact"}
  end
end
