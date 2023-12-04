class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Shows message when there is a routing error
  def not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
