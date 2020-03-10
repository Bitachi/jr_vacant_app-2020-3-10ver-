module MicropostsHelper
  def admin_or_yours?(micropost)
    if ((Micropost.find(micropost.id).user_id == current_user.id) || current_user.admin)
      true
    else
      false
    end
  end
end
