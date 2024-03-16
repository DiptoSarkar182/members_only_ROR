class SecretsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @secrets = Secret.all.order('created_at DESC')
  end

  def new
    @secret = Secret.new
  end

  def create
    @secret = current_user.secrets.build(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to root_path, notice: "Secret was successfully created." }
      else

        format.html { render 'new', status: :unprocessable_entity }
      end
    end
  end

  private
  def secret_params
    params.require(:secret).permit(:title, :body)
  end
end
