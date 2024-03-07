# frozen_string_literal: true

class HomeController < ApplicationController
  # skip_before_action :check_logged_in, only: :index
  include Secured

  def index
    @user = session[:userinfo]
  end
end
