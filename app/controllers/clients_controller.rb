class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
  end

  def edit
  end
end
