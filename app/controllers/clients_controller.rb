class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end
def edit
  @client = Client.find(params[:id])
end
  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Profile updated"
      redirect_to @client
    else
      render 'edit'
    end
  end
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
      else
         render 'new'
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, :email, :weight, :dob, :gender, :address)
  end
end
