class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
#    @client = Client.new(params[:client])
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = "Client has been created."
      redirect_to @client
    else
      flash[:alert] = "Client has not been created."

      render "new"
    end
  end

  private

    def client_params
      params.require(:client).permit(:name)
    end
end
