class SecretsController < ApplicationController
  def index
    @secrets = Secret.all.order('created_at DESC')
  end
end
