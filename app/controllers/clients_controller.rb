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

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    #@client.update(client_params)
    if @client.update(client_params)
      flash[:notice] = "Client has been updated."
      redirect_to @client
    else
      flash[:alert] = "Client has not been updated."
      render "edit"
    end
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
