class ConnectionsController < ApplicationController
  before_action :set_connetion, only:[:destroy]

  def create
  	connection = current_user.connections.create_from_omniauth(auth_hash)

  	if connection.save
  		redirect_to dashboard_path,  notice: "Connection created!"
  	else
  		redirect_to dashboard_path, notice: "Something went wrong!"
  	end
  end

  def destroy
  	@connection.destroy
  	redirect_to dashboard_path, notice: "Connection deleted!"
  end

  def omniauth_failure
    redirect_to dashboard_path, notice: "Something went wrong!"
  end

  private
  	def auth_hash
  		request.env['omniauth.auth']
  	end

  	def set_connection
  		@connection = Connection.find(params[:id])
  	end
end
