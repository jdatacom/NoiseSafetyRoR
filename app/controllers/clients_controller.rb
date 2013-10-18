class ClientsController < ApplicationController
  before_action :set_client, only: [:show,
                                    :edit,
                                    :update,
                                    :destroy
                                    ]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def show
    #@client = Client.find(params[:id])
  end

  def edit
    #@client = Client.find(params[:id])
  end

  def update
    #@client = Client.find(params[:id])
    #@client.update(client_params)
    if @client.update(client_params)
      flash[:notice] = "Client has been updated."
      redirect_to @client
    else
      flash[:alert] = "Client has not been updated."
      render "edit"
    end
  end

  def destroy
    #@client = Client.find(params[:id])
    @client.destroy

    flash[:notice] = "Client has been deleted."

    redirect_to clients_path
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

    def set_client
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The client you were looking" +
          " for could not be found."
      redirect_to clients_path
    end
end
