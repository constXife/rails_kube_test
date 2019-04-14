class ApplicationController < ActionController::Base
  def home
    render plain: 'Hello, Rails TestKube!'
  end
end
