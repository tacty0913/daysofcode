class HomeController < ApplicationController
  skip_before_action :login_required
  def top
  end
end
