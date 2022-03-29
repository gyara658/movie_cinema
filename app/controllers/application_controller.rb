class ApplicationController < ActionController::Base

  #サインインした後にどのページに移動するか
  def after_sign_up_path_for(resource)
    user_path(resource.id)
  end

end
