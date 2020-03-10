module UsersHelper

  # 渡されたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=wavatar&?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def current_user_or_admin?
    if params[:id].to_i == current_user.id || current_user.admin?
      true
    else
      false
    end
  end
end
